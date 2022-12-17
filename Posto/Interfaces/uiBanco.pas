unit uiBanco;

interface

uses
  uiBomba, uiTanque, uiTipoCombustivel;

  type IBanco = interface
    function CarregarTipoCombustivel : ITipoCombustivel;
  end;
implementation

end.
