inherited Form_Cadastro_Usuario: TForm_Cadastro_Usuario
  Caption = 'Form_Cadastro_Usuario'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_Inferior: TPanel
    inherited Button_Confirma: TButton
      Caption = '&Confirmar'
    end
    inherited Button_Pesquisar: TButton
      OnClick = Button_PesquisarClick
    end
    inherited Button_Sair: TButton
      Caption = '&Sair'
      OnClick = Button_SairClick
    end
  end
  inherited Panel_Fundo: TPanel
    inline Frame_CadUsuario: TFrame_Usuario
      Left = 39
      Top = 16
      Width = 348
      Height = 129
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 39
      ExplicitTop = 16
    end
  end
end
