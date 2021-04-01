unit Data.Module.Conexao;

interface

uses
	System.Classes,
	FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Error,
	FireDAC.UI.Intf,
	FireDAC.Phys.Intf,
	FireDAC.Stan.Def,
	FireDAC.Stan.Pool,
	FireDAC.Stan.Async,
	FireDAC.Phys,
	FireDAC.Phys.MySQL,
	FireDAC.Phys.MySQLDef,
	FireDAC.VCLUI.Wait,
	Data.DB,
	FireDAC.Comp.Client,
	IniFiles,
	FireDAC.Stan.Param,
	FireDAC.DatS,
	FireDAC.DApt.Intf,
	FireDAC.DApt,
	FireDAC.Comp.DataSet;

type
	TConDBIni = record
		SerEnder : String;
		DBName : String;
		DBPort : Integer;
		DBUser : String;
		DBSenha : String;
	end;

type
	TDataModuleConexao = class(TDataModule)
		FDConnection_Live : TFDConnection;
		FDPhysMySQLDriverLink1 : TFDPhysMySQLDriverLink;
		FDQuery1 : TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
		private
		public
			{ Public declarations }
	end;

var
	DataModuleConexao : TDataModuleConexao;
	configIni         : TConDBIni;

procedure LerArquivoIni();
procedure GravarArquivoIni();
procedure AjustarConexaoBD();
function ExecutaSQL(sql : String; const ZQueryParametro : TFDQuery = nil) : Boolean;

implementation

uses
	Vcl.Forms,
	System.SysUtils,
	Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure GravarArquivoIni();
var
	objIniEscrever : TIniFile;
begin
	objIniEscrever := TIniFile.Create(ExtractFileDir(application.ExeName) + '\configDB.ini');
	try
		objIniEscrever.WriteString('BDCONFIG', 'DBEndereco', configIni.SerEnder);
		objIniEscrever.WriteString('BDCONFIG', 'DBName', configIni.DBName);
		objIniEscrever.WriteInteger('BDCONFIG', 'DBPorta', configIni.DBPort);
		objIniEscrever.WriteString('BDCONFIG', 'DBUsuario', configIni.DBUser);
		objIniEscrever.WriteString('BDCONFIG', 'DBSenha', configIni.DBSenha);
	finally
		FreeAndNil(objIniEscrever);
	end;
end;

procedure LerArquivoIni();
var
	objIniLer : TIniFile;
begin
	objIniLer := TIniFile.Create(ExtractFileDir(application.ExeName) + '\configDB.ini');
	try
		configIni.SerEnder := objIniLer.ReadString('BDCONFIG', 'DBEndereco', 'localhost');
		configIni.DBName   := objIniLer.ReadString('BDCONFIG', 'DBName', '');
		configIni.DBPort   := objIniLer.ReadInteger('BDCONFIG', 'DBPorta', 3306);
		configIni.DBUser   := objIniLer.ReadString('BDCONFIG', 'DBUsuario', '');
		configIni.DBSenha  := objIniLer.ReadString('BDCONFIG', 'DBSenha', '');
	finally
		FreeAndNil(objIniLer);
	end;
end;

procedure AjustarConexaoBD();
begin
	DataModuleConexao.FDConnection_Live.Params.Clear;
	DataModuleConexao.FDConnection_Live.Params.Add('DriverID=MySQL');
	DataModuleConexao.FDConnection_Live.Params.Add('Server=' + configIni.SerEnder);
	DataModuleConexao.FDConnection_Live.Params.Add('Database=' + configIni.DBName);
	DataModuleConexao.FDConnection_Live.Params.Add('Port=' + configIni.DBPort.ToString);
	DataModuleConexao.FDConnection_Live.Params.Add('User_Name=' + configIni.DBUser);
	DataModuleConexao.FDConnection_Live.Params.Add('Password=' + configIni.DBSenha);
	DataModuleConexao.FDConnection_Live.Connected := True;
end;

function ExecutaSQL(sql : String; const ZQueryParametro : TFDQuery = nil) : Boolean;
begin
	Result := False;
	try
		if (not DataModuleConexao.FDConnection_Live.Connected) then
			Exit;
		if (ZQueryParametro <> nil) then
		begin
			ZQueryParametro.Connection := DataModuleConexao.FDConnection_Live;
			ZQueryParametro.Close;
			ZQueryParametro.sql.Clear;
			ZQueryParametro.sql.Add(sql);

			if (Pos('SELECT', Trim(UpperCase(sql))) in [1, 2]) then
				ZQueryParametro.Open
			else
				ZQueryParametro.ExecSQL;
		end else
		begin
			DataModuleConexao.FDQuery1.Connection := DataModuleConexao.FDConnection_Live;
			DataModuleConexao.FDQuery1.Close;
			DataModuleConexao.FDQuery1.sql.Clear;
			DataModuleConexao.FDQuery1.sql.Add(sql);
			if (Pos('SELECT', Trim(UpperCase(sql))) in [1, 2]) then
				DataModuleConexao.FDQuery1.Open
			else
				DataModuleConexao.FDQuery1.ExecSQL;
		end;
	except
		on E : Exception do
		begin
			ShowMessage('Erro no metodo ExecutaSQL ' + #13#10 + E.Message);
			Raise;
		end;
	end;
end;

procedure TDataModuleConexao.DataModuleCreate(Sender: TObject);
begin
	LerArquivoIni;
  AjustarConexaoBD;
end;

end.
