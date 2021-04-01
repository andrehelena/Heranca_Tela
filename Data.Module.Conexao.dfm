object DataModuleConexao: TDataModuleConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 394
  Width = 431
  object FDConnection_Live: TFDConnection
    Params.Strings = (
      'Database=test'
      'DriverID=MySQL'
      'Password=server'
      'Port=3307'
      'Server=192.168.10.12'
      'User_Name=root')
    LoginPrompt = False
    Left = 80
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\andre\Desktop\Geito Errado - Conexao\Win32\Debug\libmar' +
      'iadb.dll'
    Left = 72
    Top = 168
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection_Live
    Left = 200
    Top = 72
  end
end
