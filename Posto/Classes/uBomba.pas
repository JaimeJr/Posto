unit uBomba;

interface

uses
  uiBomba, uiTanque, uiAbastecer, uAbastecer;

  type TBomba = class(TInterfacedObject, IBomba)
   private
     FID : Integer;
     FTanque : ITanque;
    public
      function ID(value : Integer) : IBomba; overload;
      function ID : Integer; overload;

      function Tanque(value : ITanque) : IBomba; overload;
      function Tanque : ITanque; overload;

      procedure Abastecer(litros : Real);

      class function New : IBomba;

      constructor Create;
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
  valorAbastecido : Real;
begin
  novoAbastecimento := TAbastecer.
                         New.
                           Bomba(Self).
                           DT_Abastecimento(Now).
                           Litro(litros).
                           ICMS(13);

  novoAbastecimento.GravarAbastecimento;
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
