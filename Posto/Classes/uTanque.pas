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

      constructor Create;
  end;

implementation

{ TTanque }

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
