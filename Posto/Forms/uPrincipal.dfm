object frmPosto: TfrmPosto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Posto'
  ClientHeight = 304
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 304
    Align = alClient
    TabOrder = 0
    object pnlGasolina: TPanel
      AlignWithMargins = True
      Left = 381
      Top = 1
      Width = 377
      Height = 261
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Gasolina'
      TabOrder = 1
      VerticalAlignment = taAlignTop
      object edtPrecoLitro: TLabeledEdit
        Left = 128
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Pre'#231'o por Litro'
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 134
        Width = 377
        Height = 127
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 193
          Height = 127
          Align = alLeft
          Caption = 'Bomba 1'
          TabOrder = 0
          VerticalAlignment = taAlignTop
          object btnAbastecerT1B2: TButton
            Left = 62
            Top = 88
            Width = 75
            Height = 25
            Caption = 'Abastecer'
            TabOrder = 1
          end
          object LabeledEdit2: TLabeledEdit
            Left = 48
            Top = 53
            Width = 121
            Height = 21
            EditLabel.Width = 26
            EditLabel.Height = 13
            EditLabel.Caption = 'Litros'
            TabOrder = 0
          end
        end
        object pnlBomba2: TPanel
          Left = 193
          Top = 0
          Width = 184
          Height = 127
          Align = alClient
          Caption = 'Bomba 2'
          TabOrder = 1
          VerticalAlignment = taAlignTop
          object btnAbastecerT1B1: TButton
            Left = 62
            Top = 88
            Width = 75
            Height = 25
            Caption = 'Abastecer'
            TabOrder = 1
          end
          object LabeledEdit1: TLabeledEdit
            Left = 31
            Top = 53
            Width = 121
            Height = 21
            EditLabel.Width = 26
            EditLabel.Height = 13
            EditLabel.Caption = 'Litros'
            TabOrder = 0
          end
        end
      end
    end
    object pnlRelatorio: TPanel
      Left = 1
      Top = 262
      Width = 764
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnRelatorio: TButton
        Left = 342
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Relat'#243'rio'
        TabOrder = 0
      end
    end
    object pnlOleoDiesel: TPanel
      Left = 1
      Top = 1
      Width = 377
      Height = 261
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Ol'#233'o Diesel'
      TabOrder = 0
      VerticalAlignment = taAlignTop
      object LabeledEdit3: TLabeledEdit
        Left = 128
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Pre'#231'o por Litro'
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 134
        Width = 377
        Height = 127
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 193
          Height = 127
          Align = alLeft
          Caption = 'Bomba 1'
          TabOrder = 0
          VerticalAlignment = taAlignTop
          object Button1: TButton
            Left = 62
            Top = 88
            Width = 75
            Height = 25
            Caption = 'Abastecer'
            TabOrder = 1
          end
          object LabeledEdit4: TLabeledEdit
            Left = 48
            Top = 53
            Width = 121
            Height = 21
            EditLabel.Width = 26
            EditLabel.Height = 13
            EditLabel.Caption = 'Litros'
            TabOrder = 0
          end
        end
        object Panel6: TPanel
          Left = 193
          Top = 0
          Width = 184
          Height = 127
          Align = alClient
          Caption = 'Bomba 2'
          TabOrder = 1
          VerticalAlignment = taAlignTop
          object Button2: TButton
            Left = 62
            Top = 88
            Width = 75
            Height = 25
            Caption = 'Abastecer'
            TabOrder = 1
          end
          object LabeledEdit5: TLabeledEdit
            Left = 31
            Top = 53
            Width = 121
            Height = 21
            EditLabel.Width = 26
            EditLabel.Height = 13
            EditLabel.Caption = 'Litros'
            TabOrder = 0
          end
        end
      end
    end
  end
end
