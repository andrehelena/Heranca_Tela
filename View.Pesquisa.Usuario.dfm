inherited Form_PesquisaUsuario: TForm_PesquisaUsuario
  Caption = 'Pesquisa de usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel1: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'login'
          Title.Caption = 'Login'
          Width = 188
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 312
          Visible = True
        end>
    end
  end
end
