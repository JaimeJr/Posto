unit uTipoCombustivel;

interface
  uses
    uiTipoCombustivel;

  type TTipoCombustivel = class(TInterfacedObject, ITipoCombustivel)
    private
      FID : Integer;
      FDescricao : String;
      FValorLitro : Real;
      FICMS : Real;

      function ID(value : Integer) : ITipoCombustivel; overload;
      function Descricao(value : string) : ITipoCombustivel; overload;
      function ValorLitro(value : Real) : ITipoCombustivel; overload;
      function ICMS(value : Real) : ITipoCombustivel; overload;

    public
      function ID : Integer; overload;
      function Descricao : string; overload;
      function ValorLitro : Real; overload;
      function ICMS : Real; overload;

      function Carregar(tipoID : Integer) : ITipoCombustivel;

      class function New : ITipoCombustivel;
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

class function TTipoCombustivel.New : ITipoCombustivel;
begin
  Result := Self.Create;
end;

function TTipoCombustivel.Carregar(tipoID: Integer): ITipoCombustivel;
var
  qryCarregar : TFDQuery;
begin
  qryCarregar := TFDQuery.Create(nil);
  try
    qryCarregar.Connection := dmPosto.FDConnection1;
    qryCarregar.SQL.Add('SELECT *                ');
    qryCarregar.SQL.Add('  FROM TIPO_COMBUSTIVEL ');
    qryCarregar.SQL.Add(' WHERE ID = :ID         ');
    qryCarregar.ParamByName('ID').AsInteger := tipoID;
    qryCarregar.Open;

    qryCarregar.First;

    Result := ID(qryCarregar.FieldByName('ID').AsInteger).
              Descricao(qryCarregar.FieldByName('DESCRICAO').AsString).
              ValorLitro(qryCarregar.FieldByName('VALOR_LITRO').AsFloat).
              ICMS(qryCarregar.FieldByName('ICMS').AsFloat);

  finally
    qryCarregar.Free;
  end;
end;

function TTipoCombustivel.Descricao: string;
begin
  Result := FDescricao;
end;

function TTipoCombustivel.ID(value: Integer): ITipoCombustivel;
begin
  Result := Self;
  FID := value;
end;

function TTipoCombustivel.ICMS: Real;
begin
  Result := FICMS;
end;

function TTipoCombustivel.ICMS(value: Real): ITipoCombustivel;
begin
  Result := Self;
  FICMS := value;
end;

function TTipoCombustivel.ID: Integer;
begin
  Result := FID;
end;

function TTipoCombustivel.ValorLitro(value: Real): ITipoCombustivel;
begin
  Result := Self;
  FValorLitro := value;
end;

function TTipoCombustivel.ValorLitro: Real;
begin
  Result := FValorLitro;
end;

end.
