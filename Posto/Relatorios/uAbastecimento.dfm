object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmRelAbastecimento'
  ClientHeight = 1124
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlrAbastecimento: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = rleValorTotal
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 27
      BandType = btHeader
      object rllTitulo: TRLLabel
        Left = 264
        Top = 5
        Width = 171
        Height = 16
        Caption = 'Relat'#243'rio de Abastecimentos'
      end
    end
    object rlbDetalhes: TRLBand
      Left = 38
      Top = 65
      Width = 718
      Height = 26
      BandType = btColumnHeader
      object rllData: TRLLabel
        Left = 6
        Top = 4
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel1: TRLLabel
        Left = 149
        Top = 4
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel2: TRLLabel
        Left = 238
        Top = 6
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object RLLabel3: TRLLabel
        Left = 326
        Top = 4
        Width = 34
        Height = 16
        Caption = 'Valor'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 112
      Width = 718
      Height = 27
      BandType = btColumnFooter
      object RLLabel4: TRLLabel
        Left = 6
        Top = 12
        Width = 71
        Height = 16
        Caption = 'Valor total: '
      end
      object rllValorTotal: TRLLabel
        Left = 326
        Top = 8
        Width = 72
        Height = 16
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 91
      Width = 718
      Height = 21
      AutoSize = True
      object RLDBText4: TRLDBText
        Left = 326
        Top = 5
        Width = 72
        Height = 16
        DataField = 'VALOR'
        DataSource = dsAbastecimento
        Text = 'R$: '
      end
      object rldBomba: TRLDBText
        Left = 238
        Top = 5
        Width = 52
        Height = 16
        DataField = 'BOMBA'
        DataSource = dsAbastecimento
        Text = ''
      end
      object rldTanque: TRLDBText
        Left = 149
        Top = 5
        Width = 57
        Height = 16
        DataField = 'TANQUE'
        DataSource = dsAbastecimento
        Text = ''
      end
      object rldDtAbastecimento: TRLDBText
        Left = 6
        Top = 5
        Width = 137
        Height = 16
        DataField = 'DT_ABASTECIMENTO'
        DataSource = dsAbastecimento
        Text = ''
      end
    end
  end
  object qryAbastecimento: TFDQuery
    Connection = dmPosto.FDConnection1
    SQL.Strings = (
      
        'SELECT DT_ABASTECIMENTO, B.ID AS BOMBA, TC.DESCRICAO AS TANQUE, ' +
        'ROUND(SUM(AB.VALOR), 2) AS VALOR'
      '  FROM ABASTECIMENTO AB'
      ' INNER JOIN BOMBA B ON B.ID = AB.BOMBA '
      ' INNER JOIN TANQUE T ON T.ID = B.TANQUE '
      ' INNER JOIN TIPO_COMBUSTIVEL TC ON TC.ID = T.TIPO_COMBUSTIVEL'
      ' GROUP BY DT_ABASTECIMENTO, T.ID, B.ID, TC.DESCRICAO')
    Left = 840
    Top = 8
    object qryAbastecimentoDT_ABASTECIMENTO: TDateField
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
      Required = True
    end
    object qryAbastecimentoBOMBA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryAbastecimentoTANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryAbastecimentoVALOR: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 840
    Top = 56
  end
  object rleValorTotal: TRLExpressionParser
    Expression = 'SUM(VALOR)'
    Left = 840
    Top = 112
  end
end
