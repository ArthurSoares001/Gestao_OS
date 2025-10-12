object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=testes'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\psqlODBC\1600\bin\libpq.dll'
    Left = 64
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 48
  end
end
