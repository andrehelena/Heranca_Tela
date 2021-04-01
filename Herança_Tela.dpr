program Herança_Tela;

uses
  Vcl.Forms,
  View.Padrao in 'View.Padrao.pas' {Form_Padrao},
  View.Principal in 'View.Principal.pas' {Form_Principal},
  View.PadraoCadastro in 'View.PadraoCadastro.pas' {Form_PadraoCadastro},
  View.Cadastro.Usuario in 'View.Cadastro.Usuario.pas' {Form_Cadastro_Usuario},
  Data.Module.Conexao in 'Data.Module.Conexao.pas' {DataModuleConexao: TDataModule},
  View.Cadastro.JSON.Exemplo in 'View.Cadastro.JSON.Exemplo.pas' {Form_JSON_Exemplo},
  DataSet.Serialize.Export in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\core\DataSet.Serialize.Export.pas',
  DataSet.Serialize.Import in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\core\DataSet.Serialize.Import.pas',
  DataSet.Serialize in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\helpers\DataSet.Serialize.pas',
  DataSet.Serialize.Consts in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\providers\DataSet.Serialize.Consts.pas',
  DataSet.Serialize.Utils in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\providers\DataSet.Serialize.Utils.pas',
  DataSet.Serialize.Config in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\singletons\DataSet.Serialize.Config.pas',
  DataSet.Serialize.BooleanField in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\types\DataSet.Serialize.BooleanField.pas',
  DataSet.Serialize.Language in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\types\DataSet.Serialize.Language.pas',
  DataSet.Serialize.UpdatedStatus in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\types\DataSet.Serialize.UpdatedStatus.pas',
  View.Frame.Usuario in 'View.Frame.Usuario.pas' {Frame_Usuario: TFrame},
  View.Padrao.Form in 'View.Padrao.Form.pas' {Form_Padrao_Form},
  View.Padrao.Pesquisa in 'View.Padrao.Pesquisa.pas' {Form_Padrao_Pesquisa},
  View.Pesquisa.Usuario in 'View.Pesquisa.Usuario.pas' {Form_PesquisaUsuario},
  View.Pesquisa.Pedidos in 'View.Pesquisa.Pedidos.pas' {Form_Pesquisa_Pedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.CreateForm(TDataModuleConexao, DataModuleConexao);
  Application.Run;
end.
