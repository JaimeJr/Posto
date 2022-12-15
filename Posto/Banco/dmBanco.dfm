object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123;Persist Security Info=True;User ' +
      'ID=SYSDBA;Data Source=POSTO;Initial Catalog=POSTO'
    Provider = 'MSDASQL.1'
    Left = 87
    Top = 8
  end
end
