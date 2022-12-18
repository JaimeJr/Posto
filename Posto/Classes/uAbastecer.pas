unit uAbastecer;

interface

uses
  uiAbastecer, uiBomba;
  type TAbastecer = class(TInterfacedObject, IAbastecer)
    private
      FBomba : IBomba;
      FDT_Abastecimento : TDateTime;
      FValor : Real;
      FLitro : Real;
      FICMS : Real;
      function Valor(value : Real) : IAbastecer; overload;
    public
      function Bomba(value : IBomba) : IAbastecer; overload;
      function Bomba : IBomba; overload;

      function DT_Abastecimento(value : TDateTime) : IAbastecer; overload;
      function DT_Abastecimento : TDateTime; overload;

      function Valor : Real; overload;

      function Litro(value : Real) : IAbastecer; overload;
      function Litro : Real; overload;

      function ICMS(value : Real) : IAbastecer; overload;
      function ICMS : Real; overload;

      class function New : IAbastecer;

      constructor Create;

      procedure GravarAbastecimento;
  end;
implementation
  uses udmBanco, uExcecoes;

{ TAbastecer }

function TAbastecer.Bomba(value: IBomba): IAbastecer;
begin
  Result := Self;
  FBomba := value;
end;

function TAbastecer.Bomba: IBomba;
begin
  Result := FBomba;
end;

constructor TAbastecer.Create;
begin
  inherited;
end;

function TAbastecer.DT_Abastecimento: TDateTime;
begin
  Result := FDT_Abastecimento;
end;

function TAbastecer.DT_Abastecimento(value: TDateTime): IAbastecer;
begin
  Result := Self;
  FDT_Abastecimento := value;
end;

procedure TAbastecer.GravarAbastecimento;
begin
  FValor := FLitro * FBomba.Tanque.TipoCombustivel.ValorLitro;
  FValor := FValor * (1 + (FICMS / 100));

  dmPosto.NovoAbastecimento(FDT_Abastecimento, FValor, FLitro, FICMS, FBomba);
end;

function TAbastecer.ICMS(value: Real): IAbastecer;
begin
  Result := Self;
  FICMS := value;
end;

function TAbastecer.ICMS: Real;
begin
  Result := FICMS;
end;

function TAbastecer.Litro: Real;
begin
  Result := FLitro;
end;

class function TAbastecer.New: IAbastecer;
begin
  Result := Self.Create;
end;

function TAbastecer.Litro(value: Real): IAbastecer;
  procedure ValidarLitro;
  begin
    if value <= 0 then
      raise ELitroInvalidoException.Create('Quantidade informada deve ser maior que zero!');
  end;
begin
  try
    Result := Self;
    ValidarLitro;
    FLitro := value;
  except
    raise;
  end;
end;

function TAbastecer.Valor(value: Real): IAbastecer;
  procedure ValidarValor;
  begin
    if value <= 0 then
      raise EValorInvalidoException.Create('Quantidade informada deve ser maior que zero!');
  end;
begin
  try
    Result := Self;
    ValidarValor;
    FValor := value;
  except
    raise;
  end;
end;

function TAbastecer.Valor: Real;
begin
  Result := FValor;
end;

end.
