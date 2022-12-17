program Posto;

uses
  Vcl.Forms,
  uPrincipal in 'Forms\uPrincipal.pas' {Form1},
  uiTipoCombustivel in 'Interfaces\uiTipoCombustivel.pas',
  uiTanque in 'Interfaces\uiTanque.pas',
  uiBomba in 'Interfaces\uiBomba.pas',
  udmBanco in 'Banco\udmBanco.pas' {dmPosto: TDataModule},
  uBomba in 'Classes\uBomba.pas',
  uAbastecer in 'Classes\uAbastecer.pas',
  uiAbastecer in 'Interfaces\uiAbastecer.pas',
  uExcecoes in 'Biblioteca\uExcecoes.pas',
  uTanque in 'Classes\uTanque.pas',
  uTipoCombustivel in 'Classes\uTipoCombustivel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPosto, frmPosto);
  Application.CreateForm(TdmPosto, dmPosto);
  Application.Run;
end.
