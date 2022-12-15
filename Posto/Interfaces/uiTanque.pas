unit uiTanque;

interface
  uses
    uiTipoCombustivel;

  type ITanque = interface
    ['{A276C3A9-E7ED-469F-849B-DEE00C5CF1BB}']
    function ID(value : Extended) : ITanque; overload;
    function ID : Extended; overload;

    function TipoCombustivel(value : ITipoCombustivel) : ITanque; overload;
    function TipoCombustivel : ITipoCombustivel; overload;
  end;

implementation

end.
