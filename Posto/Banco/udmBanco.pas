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
    qryAbastecimentoID: TIntegerField;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryAbastecimentoVALOR: TSingleField;
    qryAbastecimentoLITROS: TSingleField;
    qryAbastecimentoICMS: TSingleField;
    qryAbastecimentoBOMBA: TIntegerField;
  private
    { Private declarations }
  public
    function VerificarNovoIDAbastecimento : Integer;
    function CarregarTipoCombustivel(ID : Integer) : ITipoCombustivel;
    procedure NovoAbastecimento(ID : Integer ;
                                dtAbastecimento : TDateTime;
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

function TdmPosto.CarregarTipoCombustivel(ID : Integer): ITipoCombustivel;
begin

end;

procedure TdmPosto.NovoAbastecimento(ID: Integer;
  dtAbastecimento: TDateTime; valor, litros, ICMS: Real; Bomba: IBomba);
begin
  try
    qryAbastecimento.Append;

    qryAbastecimentoDT_ABASTECIMENTO.AsDateTime := dtAbastecimento;
    qryAbastecimentoVALOR.AsFloat := valor;
    qryAbastecimentoLITROS.AsFloat := litros;
    qryAbastecimentoICMS.AsFloat := ICMS;
    qryAbastecimentoBOMBA.AsInteger := Bomba.ID;

    qryAbastecimento.ApplyUpdates;
    qryAbastecimento.CommitUpdates;
    FDConnection1.Commit;
  except
    qryAbastecimento.Cancel;
    FDConnection1.Rollback;
  end;
end;

function TdmPosto.VerificarNovoIDAbastecimento: Integer;
begin
  qryNovoID.Open;
  Result := qryNovoIDNOVOID.AsInteger;
end;

end.
