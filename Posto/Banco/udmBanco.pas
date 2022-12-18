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
    qryTipoCombustivel: TFDQuery;
    updTipoCombustivel: TFDUpdateSQL;
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
begin
  
  try
    if not qryAbastecimento.Active then
      qryAbastecimento.Open;

    qryAbastecimento.Append;

    qryAbastecimentoDT_ABASTECIMENTO.AsDateTime := dtAbastecimento;
    qryAbastecimentoVALOR.AsFloat := valor;
    qryAbastecimentoLITROS.AsFloat := litros;
    qryAbastecimentoICMS.AsFloat := ICMS;
    qryAbastecimentoBOMBA.AsInteger := Bomba.ID;

    qryAbastecimento.ApplyUpdates;
    qryAbastecimento.CommitUpdates;
    FDConnection1.Commit; 
  except on E: Exception do    
    begin  
      qryAbastecimento.Cancel;
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
