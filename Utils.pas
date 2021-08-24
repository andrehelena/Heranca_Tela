unit Utils;

interface

uses
	Vcl.Forms,
	Winapi.Windows,
	System.SysUtils,
	FireDAC.Comp.Client,
  System.Classes,
  Vcl.Imaging.jpeg,
  Vcl.Graphics;

procedure mensagemAviso(const mensagem : String);
function mensagemPergunta(const mensagem : String) : Boolean;
function StrToSQL(texto : string) : String;
function ultimoCodigo(tabela, campo : String) : Integer;
function resizeImage(FilePathNameImg : TMemoryStream; const WMax, HMax : Word) : TMemoryStream;

implementation

uses
	Data.Module.Conexao;

procedure mensagemAviso(const mensagem : String);
begin
	Application.MessageBox(pchar(mensagem), 'Aviso', MB_OK +
			MB_ICONWARNING + MB_TOPMOST);
end;

function mensagemPergunta(const mensagem : String) : Boolean;
begin
	case Application.MessageBox(pchar(mensagem), 'Aviso', MB_YESNO +
			MB_ICONQUESTION + MB_TOPMOST) of
		IDYES :
			begin
				Result := True;
			end;
		IDNO :
			begin
				Result := False;
			end;
	end;
end;

function StrToSQL(texto : string) : String;
begin
	Result := QuotedStr(texto);
end;

function ultimoCodigo(tabela, campo : String) : Integer;
var
	tmp : TFDQuery;
begin
	tmp := TFDQuery.Create(nil);
	try
		ExecutaSQL('SELECT MAX(' + campo + ')+1 AS Ultimo FROM ' + tabela, tmp);
		Result := tmp.FieldByName('Ultimo').AsInteger;
	finally
		FreeAndNil(tmp)
	end;
end;

function resizeImage(FilePathNameImg : TMemoryStream; const WMax, HMax : Word) : TMemoryStream;
type
	pRGBArray = ^TRGBArray;
	TRGBArray = array [Word] of TRGBTriple;
var
	JPEGImage      : TJPEGImage;
	TBmp, obBitMap : TBitmap;
	DstGap, WNew, HNew, X, Y, T3, Z1, Z2, IZ2, W1, W2, W3, W4, XP, XP2, YP, YP2 : Integer;
	SrcLine1, SrcLine2, DstLine : pRGBArray;
	jpg                         : TJPEGImage;
	tmpMemory                   : TMemoryStream;
begin
	Result                   := nil;
	FilePathNameImg.Position := 0;
	tmpMemory                := TMemoryStream.Create;
	try // Start of try except
		JPEGImage := TJPEGImage.Create; // Create the JPEG image... try  // now
		obBitMap  := TBitmap.Create;
		try // to load the file but
			try
				JPEGImage.LoadFromStream(FilePathNameImg);
				// might fail...with an Exception.
				obBitMap.Assign(JPEGImage);
			except
				obBitMap.LoadFromStream(FilePathNameImg);
				obBitMap.Assign(obBitMap);
			end;
			// Assign the image to our bitmap.Result := True;
			// Got it so return True.
		finally
			JPEGImage.Free; // ...must get rid of the JPEG image. finally
		end; { try }
	except
		on E : Exception do
		begin
			E.Message := 'Erro ao carregar a imagem para redimensionar!'#13#10 + E.Message;
			Raise;
		end;
	end; { try }

	TBmp := TBitmap.Create;
	try
		if (obBitMap.Width < WMax) or (obBitMap.Height < HMax) then
			Exit;
		WNew := (obBitMap.Width * HMax) div obBitMap.Height;
		HNew := (WMax * obBitMap.Height) div obBitMap.Width;
		if (WMax < WNew) then
		begin
			TBmp.Width  := WMax;
			TBmp.Height := HNew;
		end else begin
			TBmp.Width  := WNew;
			TBmp.Height := HMax;
		end;
		obBitMap.PixelFormat := pf24Bit;
		TBmp.PixelFormat     := pf24Bit;
		DstLine              := TBmp.ScanLine[0];
		DstGap               := Integer(TBmp.ScanLine[1]) - Integer(DstLine);
		XP2                  := MulDiv(pred(obBitMap.Width), $10000, TBmp.Width);
		YP2                  := MulDiv(pred(obBitMap.Height), $10000, TBmp.Height);
		YP                   := 0;
		for Y                := 0 to pred(TBmp.Height) do
		begin
			XP       := 0;
			SrcLine1 := obBitMap.ScanLine[YP shr 16];
			if (YP shr 16 < pred(obBitMap.Height)) then
				SrcLine2 := obBitMap.ScanLine[Succ(YP shr 16)]
			else
				SrcLine2 := obBitMap.ScanLine[YP shr 16];
			Z2         := Succ(YP and $FFFF);
			IZ2        := Succ((not YP) and $FFFF);
			for X      := 0 to pred(TBmp.Width) do
			begin
				T3                   := XP shr 16;
				Z1                   := XP and $FFFF;
				W2                   := MulDiv(Z1, IZ2, $10000);
				W1                   := IZ2 - W2;
				W4                   := MulDiv(Z1, Z2, $10000);
				W3                   := Z2 - W4;
				DstLine[X].rgbtRed   := (SrcLine1[T3].rgbtRed * W1 + SrcLine1[T3 + 1].rgbtRed * W2 + SrcLine2[T3].rgbtRed * W3 + SrcLine2[T3 + 1].rgbtRed * W4) shr 16;
				DstLine[X].rgbtGreen := (SrcLine1[T3].rgbtGreen * W1 + SrcLine1[T3 + 1].rgbtGreen * W2 + SrcLine2[T3].rgbtGreen * W3 + SrcLine2[T3 + 1].rgbtGreen * W4) shr 16;
				DstLine[X].rgbtBlue  := (SrcLine1[T3].rgbtBlue * W1 + SrcLine1[T3 + 1].rgbtBlue * W2 + SrcLine2[T3].rgbtBlue * W3 + SrcLine2[T3 + 1].rgbtBlue * W4) shr 16;
				Inc(XP, XP2);
			end;
			Inc(YP, YP2);
			DstLine := pRGBArray(Integer(DstLine) + DstGap);
		end;
		obBitMap.Assign(TBmp);
		try
			begin
				jpg := TJPEGImage.Create;
				try
					jpg.Assign(obBitMap);
					jpg.CompressionQuality := 75;
					jpg.SaveToStream(tmpMemory);

				finally
					jpg.Free;
				end;
			end;
		except
			raise;
		end; { try }
	finally
		Result := tmpMemory;
		TBmp.Free;
		obBitMap.Free;
	end;
end;

end.
