unit uTipoCombustivel;

interface
  uses
    uiTipoCombustivel;

  type TTipoCombustivel = class(TInterfacedObject, ITipoCombustivel)
    private
      FID : Integer;
      FDescricao : String;
      FValorLitro : Real;

      function ID(value : Integer) : ITipoCombustivel; overload;
      function Descricao(value : string) : ITipoCombustivel; overload;
      function ValorLitro(value : Real) : ITipoCombustivel; overload;

    public
      function ID : Integer; overload;
      function Descricao : string; overload;
      function ValorLitro : Real; overload;

      class function Carregar(ID : Integer) : TTipoCombustivel;
  end;


implementation

uses
  udmBanco, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

{ TTipoCombustivel }
function TTipoCombustivel.Descricao(value: string): ITipoCombustivel;
begin
  Result := Self;
  FDescricao := value;
end;

class function TTipoCombustivel.Carregar(ID: Integer): TTipoCombustivel;
begin
  dmPosto.CarregarTipoCombustivel();
end;

function TTipoCombustivel.Descricao: string;
begin

end;

function TTipoCombustivel.ID(value: Integer): ITipoCombustivel;
begin
  Result := Self;
  FID := value;
end;

function TTipoCombustivel.ID: Integer;
begin

end;

function TTipoCombustivel.ValorLitro(value: Real): ITipoCombustivel;
begin
  Result := Self;
  FValorLitro := value;
end;

function TTipoCombustivel.ValorLitro: Real;
begin

end;

end.
