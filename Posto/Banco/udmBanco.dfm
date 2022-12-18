object dmPosto: TdmPosto
  OldCreateOrder = False
  Height = 368
  Width = 459
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Database=C:\Users\jaime\Documents\_Projeto\Banco\POSTO.FDB'
      'Password=123'
      'DriverID=FB')
    Connected = True
    Left = 400
    Top = 8
  end
  object qryNovoID: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(ID) + 1 AS NOVOID'
      '  FROM ABASTECIMENTO')
    Left = 296
    Top = 232
    object qryNovoIDNOVOID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOVOID'
      Origin = 'NOVOID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryValorLitro: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT VALOR_LITRO'
      '  FROM TIPO_COMBUSTIVEL'
      ' WHERE ID = :ID')
    Left = 296
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryValorLitroVALOR_LITRO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALOR_LITRO'
      Calculated = True
    end
  end
  object updAbastecimento: TFDUpdateSQL
    Connection = FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO ABASTECIMENTO '
      '            (DT_ABASTECIMENTO, VALOR, LITROS, ICMS, BOMBA)'
      '     VALUES (:DT_ABASTECIMENTO, :VALOR, :LITROS, :ICMS, :BOMBA)')
    Left = 40
    Top = 176
  end
  object qryAbastecimento: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvRefreshMode, uvCheckRequired]
    UpdateObject = updAbastecimento
    SQL.Strings = (
      'SELECT *'
      '  FROM ABASTECIMENTO')
    Left = 40
    Top = 136
    object qryAbastecimentoDT_ABASTECIMENTO: TDateField
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
      Required = True
    end
    object qryAbastecimentoVALOR: TSingleField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryAbastecimentoLITROS: TSingleField
      FieldName = 'LITROS'
      Origin = 'LITROS'
      Required = True
    end
    object qryAbastecimentoICMS: TSingleField
      FieldName = 'ICMS'
      Origin = 'ICMS'
      Required = True
    end
    object qryAbastecimentoBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'BOMBA'
      Required = True
    end
  end
  object qryTipoCombustivel: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      '  FROM TIPO_COMBUSTIVEL')
    Left = 40
    Top = 8
    object qryTipoCombustivelID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTipoCombustivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qryTipoCombustivelVALOR_LITRO: TSingleField
      FieldName = 'VALOR_LITRO'
      Origin = 'VALOR_LITRO'
      Required = True
    end
    object qryTipoCombustivelICMS: TSingleField
      FieldName = 'ICMS'
      Origin = 'ICMS'
      Required = True
    end
  end
  object updTipoCombustivel: TFDUpdateSQL
    Connection = FDConnection1
    ModifySQL.Strings = (
      'UPDATE TIPO_COMBUSTIVEL'
      '   SET VALOR_LITRO = :VALOR_LITRO'
      ' WHERE ID = :ID')
    Left = 40
    Top = 56
  end
end
