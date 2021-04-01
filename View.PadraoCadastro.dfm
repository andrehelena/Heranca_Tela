object Form_PadraoCadastro: TForm_PadraoCadastro
  Left = 0
  Top = 0
  Caption = 'Form_PadraoCadastro'
  ClientHeight = 455
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 23
  object Panel_Inferior: TPanel
    Left = 0
    Top = 384
    Width = 643
    Height = 71
    Align = alBottom
    TabOrder = 1
    object Button_Confirma: TButton
      Left = 16
      Top = 6
      Width = 97
      Height = 59
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = Button_ConfirmaClick
    end
    object Button_Cancelar: TButton
      Left = 325
      Top = 6
      Width = 97
      Height = 59
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = Button_CancelarClick
    end
    object Button_Pesquisar: TButton
      Left = 222
      Top = 6
      Width = 97
      Height = 59
      Caption = 'Pesquisar'
      TabOrder = 2
    end
    object Button_Sair: TButton
      Left = 428
      Top = 6
      Width = 97
      Height = 59
      Caption = 'Sair'
      TabOrder = 4
    end
    object Button_Excluir: TButton
      Left = 119
      Top = 6
      Width = 97
      Height = 59
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = Button_ExcluirClick
    end
  end
  object Panel_Fundo: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 384
    Align = alClient
    TabOrder = 0
  end
end
