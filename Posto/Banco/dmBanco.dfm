object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 165
  Width = 215
  object qryBomba: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      '  FROM BOMBA')
    Left = 8
    Top = 64
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Database=C:\Users\jaime\Documents\_Projeto\Banco\POSTO.FDB'
      'Password=123'
      'DriverID=FB')
    Connected = True
    Left = 88
    Top = 8
  end
  object qryBombaConsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      '  FROM BOMBA'
      ' WHERE ID = :ID')
    Left = 8
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
