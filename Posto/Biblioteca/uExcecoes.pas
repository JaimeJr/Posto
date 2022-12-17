unit uExcecoes;

interface
  uses SysUtils;

  type
    EPostoException = class(Exception);

    EAbastecerException = class(EPostoException);
    ELitroInvalidoException = class(EPostoException);
    EValorInvalidoException = class(EAbastecerException);

implementation

end.
