unit uExcecoes;

interface
  uses SysUtils;

  type
    EPostoException = class(Exception);

    ERelatorioException = class(EPostoException);

    EAbastecerException = class(EPostoException);
    ELitroInvalidoException = class(EPostoException);
    EValorInvalidoException = class(EAbastecerException);

implementation

end.
