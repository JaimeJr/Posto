unit uBomba;

interface

uses
  uiBomba, uiTanque, uiAbastecer, uAbastecer;

  type TBomba = class(TInterfacedObject, IBomba)
   private
     FID : Integer;
     FTanque : ITanque;

     function ID(value : Integer) : IBomba; overload;
     function Tanque(value : ITanque) : IBomba; overload;
   public
     function ID : Integer; overload;
     function Tanque : ITanque; overload;

     procedure Abastecer(litros : Real);

     class function New : IBomba;

     constructor Create;

     function Carregar(bombaID : Integer ; tanque : ITanque) : IBomba;
  end;

implementation
uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.SysUtils, udmBanco;

{ TBomba }

procedure TBomba.Abastecer(litros: Real);
var
  novoAbastecimento : IAbastecer;
begin
  novoAbastecimento := TAbastecer.
                         New.
                           Bomba(Self).
                           DT_Abastecimento(Now).
                           Litro(litros).
                           ICMS(FTanque.TipoCombustivel.ICMS);

  novoAbastecimento.GravarAbastecimento;
end;

function TBomba.Carregar(bombaID: Integer ; tanque : ITanque): IBomba;
var
  qryCarregar : TFDQuery;
begin
  qryCarregar := TFDQuery.Create(nil);
  try
    qryCarregar.Connection := dmPosto.FDConnection1;
    qryCarregar.SQL.Add('SELECT *                ');
    qryCarregar.SQL.Add('  FROM BOMBA            ');
    qryCarregar.SQL.Add(' WHERE ID = :ID         ');
    qryCarregar.ParamByName('ID').AsInteger := bombaID;
    qryCarregar.Open;

    qryCarregar.First;

    Result := ID(qryCarregar.FieldByName('ID').AsInteger).
              Tanque(tanque);

  finally
    qryCarregar.Free;
  end;
end;

constructor TBomba.Create;
begin
  inherited;
end;

function TBomba.ID(value: Integer): IBomba;
begin
  Result := Self;
  FID := value;
end;

function TBomba.ID: Integer;
begin
  Result := FID;
end;

class function TBomba.New: IBomba;
begin
  Result := Self.Create;
end;

function TBomba.Tanque(value: ITanque): IBomba;
begin
  Result := Self;
  FTanque := value;
end;

function TBomba.Tanque: ITanque;
begin
  Result := FTanque;
end;

end.
