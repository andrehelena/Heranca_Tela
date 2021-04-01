unit View.Cadastro.Usuario;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.SysUtils,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	View.PadraoCadastro,
	Vcl.StdCtrls,
	Vcl.ExtCtrls,
	FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Param,
	FireDAC.Stan.Error,
	FireDAC.DatS,
	FireDAC.Phys.Intf,
	FireDAC.DApt.Intf,
	FireDAC.Stan.Async,
	FireDAC.DApt,
	Data.DB,
	FireDAC.Comp.DataSet,
	FireDAC.Comp.Client,
	Data.Module.Conexao, View.Frame.Usuario;

type
	TForm_Cadastro_Usuario = class(TForm_PadraoCadastro)
    Frame_CadUsuario: TFrame_Usuario;
		procedure FormClose(Sender : TObject; var Action : TCloseAction);
		procedure Button_SairClick(Sender : TObject);
		procedure Button_PesquisarClick(Sender : TObject);
    procedure FormCreate(Sender: TObject);

		private
			function validarCampos() : Boolean; override;
			procedure gravarRegistro(); override;
			procedure excluirRegistro(); override;
			procedure limparCampos; override;
			function existeRegistro : Boolean; override;
			function existeRegistroTable(tmpTable : TFDQuery) : Boolean;
		public
			{ Public declarations }
	end;

var
	Form_Cadastro_Usuario : TForm_Cadastro_Usuario;

implementation

const
	SQL_INSERT : String = 'INSERT INTO usuarios(login, nome) VALUES (%s, %s)';
	SQL_UPDATE : String = 'UPDATE usuarios SET nome = %s WHERE login = %s';
	SQL_SELECT : String = 'SELECT login, nome FROM usuarios WHERE login = %s';
	SQL_DELETE : String = 'DELETE FROM usuarios WHERE login = %s';
{$R *.dfm}


procedure TForm_Cadastro_Usuario.Button_PesquisarClick(Sender : TObject);
var
	tmpTable : TFDQuery;
begin
	inherited;
 	tmpTable := TFDQuery.Create(Self);
	try
		if existeRegistroTable(tmpTable) then
		begin
//			LabeledEdit_Usuario.Text := tmpTable.FieldByName('login').AsString;
//			LabeledEdit_Nome.Text    := tmpTable.FieldByName('nome').AsString;
		end;
	finally
		FreeAndNil(tmpTable);
	end;
end;

procedure TForm_Cadastro_Usuario.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_Cadastro_Usuario.excluirRegistro;
var
	sql : String;
begin
	inherited;
	sql := Format(SQL_DELETE, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
	ExecutaSQL(sql);
end;

function TForm_Cadastro_Usuario.existeRegistroTable(tmpTable : TFDQuery) : Boolean;
var
	sql : String;
begin

	sql := Format(SQL_SELECT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
	ExecutaSQL(sql, tmpTable);
	Result := not tmpTable.IsEmpty;

end;

function TForm_Cadastro_Usuario.existeRegistro : Boolean;
var
	sql      : String;
	tmpTable : TFDQuery;
begin
	tmpTable := TFDQuery.Create(Self);
	try
		sql := Format(SQL_SELECT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
		ExecutaSQL(sql, tmpTable);
		Result := not tmpTable.IsEmpty;
	finally
		FreeAndNil(tmpTable);
	end;
end;

procedure TForm_Cadastro_Usuario.FormClose(Sender : TObject; var Action : TCloseAction);
begin
	inherited;
	Action := CaFree;
	Release;
	Form_Cadastro_Usuario := nil;
end;

procedure TForm_Cadastro_Usuario.FormCreate(Sender: TObject);
begin
  inherited;
	Frame_CadUsuario.Create(Self);
end;

procedure TForm_Cadastro_Usuario.gravarRegistro;
var
	sql : String;
begin
	inherited;
	if existeRegistro then
		sql := Format(SQL_UPDATE, [QuotedStr(Frame_CadUsuario.LabeledEdit_Nome.Text),
				QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)])
	else
		sql := Format(SQL_INSERT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text),
				QuotedStr(Frame_CadUsuario.LabeledEdit_Nome.Text)]);

	ExecutaSQL(sql);
end;

procedure TForm_Cadastro_Usuario.limparCampos;
begin
	inherited;
	Frame_CadUsuario.limpaCamposDoFrame;
end;

function TForm_Cadastro_Usuario.validarCampos : Boolean;
begin
	if not Frame_CadUsuario.validaCampos then
		Result := False
	else
		Result := True;
end;

end.
