inherited Form_JSON_Exemplo: TForm_JSON_Exemplo
  Caption = 'JSON - Exemplo'
  ClientHeight = 686
  ClientWidth = 1038
  OnClose = FormClose
  ExplicitWidth = 1054
  ExplicitHeight = 725
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_Inferior: TPanel
    Top = 615
    Width = 1038
    inherited Button_Sair: TButton
      OnClick = Button_SairClick
    end
  end
  inherited Panel_Fundo: TPanel
    Width = 1038
    Height = 615
    object Label1: TLabel
      Left = 31
      Top = 11
      Width = 110
      Height = 23
      Caption = 'Consulta SQL'
    end
    object Label2: TLabel
      Left = 543
      Top = 11
      Width = 51
      Height = 23
      Caption = 'JSON '
    end
    object Memo_SQL: TMemo
      Left = 31
      Top = 40
      Width = 442
      Height = 561
      TabOrder = 0
    end
    object Memo_JSON: TMemo
      Left = 520
      Top = 40
      Width = 489
      Height = 561
      TabOrder = 1
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 352
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 488
    Top = 416
  end
end
