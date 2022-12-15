unit uiBomba;

interface
  uses
    uiTanque;

  type IBomba = interface
    ['{3D9CAB02-3268-4F0E-8F7D-5452F4EBBED9}']
    function ID(value : Extended) : IBomba; overload;
    function ID : Extended; overload;

    function Tanque(value : ITanque) : IBomba; overload;
    function Tanque : ITanque; overload;
  end;
implementation

end.
