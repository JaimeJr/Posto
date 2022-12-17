unit uiAbastecer;

interface
  uses
     uiBomba;
   type IAbastecer = interface
     ['{C4B203C8-2D54-4D41-88A6-2640675C9FEC}']
     function Bomba(value : IBomba) : IAbastecer; overload;
     function Bomba : IBomba; overload;

     function DT_Abastecimento(value : TDateTime) : IAbastecer; overload;
     function DT_Abastecimento : TDateTime; overload;

     function Valor(value : Real) : IAbastecer; overload;
     function Valor : Real; overload;

     function Litro(value : Real) : IAbastecer; overload;
     function Litro : Real; overload;

     function ICMS(value : Real) : IAbastecer; overload;
     function ICMS : Real; overload;

     procedure GravarAbastecimento;
   end;
implementation

end.
