unit uTanque;

interface

uses
  uiTanque, uiTipoCombustivel;

  type TTanque = class(TInterfacedObject, ITanque)
    private
      FID : Integer;
      FTipoCombustivel : ITipoCombustivel;

      function ID(value : Integer) : ITanque; overload;
      function TipoCombustivel(value : ITipoCombustivel) : ITanque; overload;
    public
      function ID : Integer; overload;
      function TipoCombustivel : ITipoCombustivel; overload;

      class function New :  ITanque;

      function Carregar(tanqueID : Integer ; tipoCombustivel : ITipoCombustivel) : ITanque;

      constructor Create;
  end;

implementation

uses
  udmBanco, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
{ TTanque }

function TTanque.Carregar(tanqueID: Integer; tipoCombustivel: ITipoCombustivel): ITanque;
var
  qryCarregar : TFDQuery;
begin
  qryCarregar := TFDQuery.Create(nil);
  try
    qryCarregar.Connection := dmPosto.FDConnection1;
    qryCarregar.SQL.Add('SELECT *                ');
    qryCarregar.SQL.Add('  FROM TANQUE           ');
    qryCarregar.SQL.Add(' WHERE ID = :ID         ');
    qryCarregar.ParamByName('ID').AsInteger := tanqueID;
    qryCarregar.Open;

    qryCarregar.First;

    Result := ID(qryCarregar.FieldByName('ID').AsInteger).
              TipoCombustivel(tipoCombustivel);

  finally
    qryCarregar.Free;
  end;
end;

constructor TTanque.Create;
begin
  inherited;
end;

function TTanque.ID(value: Integer): ITanque;
begin
  Result := Self;
  FID := value;
end;

function TTanque.ID: Integer;
begin
  Result := FID;
end;

class function TTanque.New: ITanque;
begin
  Result := Self.Create;
end;

function TTanque.TipoCombustivel(value: ITipoCombustivel): ITanque;
begin
  Result := Self;
  FTipoCombustivel := value;
end;

function TTanque.TipoCombustivel: ITipoCombustivel;
begin
  Result := FTipoCombustivel;
end;

end.
