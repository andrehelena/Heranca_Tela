inherited Form_Pesquisa_Pedidos: TForm_Pesquisa_Pedidos
  Caption = 'Pesquisa de pedidos'
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel1: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Observacao'
          Title.Caption = 'Observa'#231#227'o'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Caption = 'Cliente'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fantasia'
          Title.Caption = 'Empresa'
          Width = 149
          Visible = True
        end>
    end
  end
end
