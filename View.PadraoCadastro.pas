unit View.PadraoCadastro;

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
	Vcl.ExtCtrls,
	Vcl.StdCtrls;

type
	TForm_PadraoCadastro = class(TForm)
		Panel_Inferior : TPanel;
		Panel_Fundo : TPanel;
		Button_Confirma : TButton;
		Button_Cancelar : TButton;
		Button_Pesquisar : TButton;
		Button_Sair : TButton;
		Button_Excluir : TButton;
    procedure Button_ConfirmaClick(Sender: TObject);
    procedure Button_ExcluirClick(Sender: TObject);
    procedure Button_CancelarClick(Sender: TObject);
		protected
			function validarCampos() : Boolean; virtual; abstract;
			procedure gravarRegistro(); virtual; abstract;
			procedure excluirRegistro(); virtual; abstract;
			procedure limparCampos; virtual; abstract;
			function existeRegistro: Boolean; virtual; abstract;
		private
			{ Private declarations }
		public
			{ Public declarations }
	end;

var
	Form_PadraoCadastro : TForm_PadraoCadastro;

implementation

{$R *.dfm}

procedure TForm_PadraoCadastro.Button_CancelarClick(Sender: TObject);
begin
	if (MessageDlg('Deseja cancelar a operação?',
  	mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    limparCampos;
  end;
end;

procedure TForm_PadraoCadastro.Button_ConfirmaClick(Sender: TObject);
begin
	if validarCampos then
  begin
		gravarRegistro;
    limparCampos;
  end;
end;

procedure TForm_PadraoCadastro.Button_ExcluirClick(Sender: TObject);
begin
	if (MessageDlg('Deseja excluir o registro?',
  	mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
		excluirRegistro;
    limparCampos;
  end;
end;

end.
