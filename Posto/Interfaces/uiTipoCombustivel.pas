unit uiTipoCombustivel;

interface
  type ITipoCombustivel = interface
    ['{C571BC4E-5C70-42C6-B6FB-1B3501E71FC2}']
    function ID(value : Integer) : ITipoCombustivel; overload;
    function ID : Integer; overload;

    function Descricao(value : string) : ITipoCombustivel; overload;
    function Descricao : string; overload;

    function ValorLitro(value : Real) : ITipoCombustivel; overload;
    function ValorLitro : Real; overload;

    procedure CarregarDados;
  end;
implementation

end.
