unit View.Pesquisa.Pedidos;

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
	View.Padrao.Pesquisa,
	Data.DB,
	FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Param,
	FireDAC.Stan.Error,
	FireDAC.DatS,
	FireDAC.Phys.Intf,
	FireDAC.DApt.Intf,
	FireDAC.Stan.Async,
	FireDAC.DApt,
	FireDAC.Comp.DataSet,
	FireDAC.Comp.Client,
	Vcl.StdCtrls,
	Vcl.Grids,
	Vcl.DBGrids,
	Vcl.ExtCtrls;

type
	TForm_Pesquisa_Pedidos = class(TForm_Padrao_Pesquisa)
		procedure FormCreate(Sender : TObject);
		private
			{ Private declarations }
		public
			{ Public declarations }
	end;

var
	Form_Pesquisa_Pedidos : TForm_Pesquisa_Pedidos;

implementation

{$R *.dfm}


procedure TForm_Pesquisa_Pedidos.FormCreate(Sender : TObject);
begin
	inherited;
	SQL_Consulta := 'SELECT P.ID, Total, Observacao, Nome, Fantasia ' +
		'FROM Pedidos P ' +
		'INNER JOIN Pessoas Pes ON Pes.ID = P.ID_Cliente ' +
		'INNER JOIN Empresas E ON E.ID = P.ID_Empresa ';
end;

end.
