inherited Form_Padrao_Pesquisa: TForm_Padrao_Pesquisa
  Caption = 'Form_Padrao_Pesquisa'
  DefaultMonitor = dmDesktop
  FormStyle = fsNormal
  Position = poDesktopCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel1: TPanel
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 382
      Align = alClient
      DataSource = DataSource_Pesquisa
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  inherited Panel2: TPanel
    object Button_Atualizar: TButton
      Left = 97
      Top = 6
      Width = 113
      Height = 59
      Caption = '&Atualizar'
      TabOrder = 0
      OnClick = Button_AtualizarClick
    end
    object Button_Confirmar: TButton
      Left = 225
      Top = 6
      Width = 113
      Height = 59
      Caption = '&Confirmar'
      ModalResult = 1
      TabOrder = 1
      OnClick = Button_ConfirmarClick
    end
    object Button_Sair: TButton
      Left = 352
      Top = 6
      Width = 113
      Height = 59
      Caption = '&Sair'
      TabOrder = 2
      OnClick = Button_SairClick
    end
  end
  object FDQuery_Pesquisa: TFDQuery
    Left = 312
    Top = 232
  end
  object DataSource_Pesquisa: TDataSource
    DataSet = FDQuery_Pesquisa
    Left = 424
    Top = 152
  end
end
