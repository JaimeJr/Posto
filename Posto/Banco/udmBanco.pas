unit udmBanco;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uiTipoCombustivel,
  uiBomba;

type
  TdmPosto = class(TDataModule)
    FDConnection1: TFDConnection;
    qryNovoID: TFDQuery;
    qryNovoIDNOVOID: TLargeintField;
    qryValorLitro: TFDQuery;
    qryValorLitroVALOR_LITRO: TFloatField;
    updAbastecimento: TFDUpdateSQL;
    qryAbastecimento: TFDQuery;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryAbastecimentoVALOR: TSingleField;
    qryAbastecimentoLITROS: TSingleField;
    qryAbastecimentoICMS: TSingleField;
    qryAbastecimentoBOMBA: TIntegerField;
    qryTipoCombustivel: TFDQuery;
    updTipoCombustivel: TFDUpdateSQL;
    qryTipoCombustivelDESCRICAO: TStringField;
    qryTipoCombustivelVALOR_LITRO: TSingleField;
    qryTipoCombustivelICMS: TSingleField;
    qryTipoCombustivelID: TIntegerField;
  private
    { Private declarations }
  public
    function VerificarNovoIDAbastecimento : Integer;
    procedure NovoAbastecimento(dtAbastecimento : TDateTime;
                                valor : Real;
                                litros : Real;
                                ICMS : Real;
                                Bomba : IBomba);

    { Public declarations }
  end;

var
  dmPosto: TdmPosto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPosto }

procedure TdmPosto.NovoAbastecimento(dtAbastecimento: TDateTime; valor, litros, ICMS: Real; Bomba: IBomba);
var
  qryInsert : TFDQuery;
begin
  qryInsert := TFDQuery.Create(nil);
  qryInsert.Connection := FDConnection1;

  qryInsert.SQL.Add('INSERT INTO ABASTECIMENTO                                       ');
  qryInsert.SQL.Add('            (DT_ABASTECIMENTO, VALOR, LITROS, ICMS, BOMBA)      ');
  qryInsert.SQL.Add('     VALUES (:DT_ABASTECIMENTO, :VALOR, :LITROS, :ICMS, :BOMBA) ');

  try
    qryInsert.ParamByName('DT_ABASTECIMENTO').Value := dtAbastecimento;
    qryInsert.ParamByName('VALOR').Value := valor;
    qryInsert.ParamByName('LITROS').Value := litros;
    qryInsert.ParamByName('ICMS').Value := ICMS;
    qryInsert.ParamByName('BOMBA').Value := Bomba.ID;

    qryInsert.ExecSQL;
    FDConnection1.Commit;
  except on E: Exception do
    begin
      qryInsert.Cancel;
      FDConnection1.Rollback;
      raise;
    end;    
  end;
end;

function TdmPosto.VerificarNovoIDAbastecimento: Integer;
begin
  qryNovoID.Open;
  Result := qryNovoIDNOVOID.AsInteger;
end;

end.
