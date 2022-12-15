unit uAbastecer;

interface
  uses
    uiBomba;

  type TAbastercer = class
    private
     procedure GravarAbastecimento;
    public
      procedure Abastecer(litros : Extended); virtual;
  end;

implementation
  uses
    dmBanco;
{ TAbastercer }

procedure TAbastercer.Abastecer(litros: Extended);
begin

end;

procedure TAbastercer.GravarAbastecimento;
begin

end;

end.
