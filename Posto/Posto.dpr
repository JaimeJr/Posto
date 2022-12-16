program Posto;

uses
  Vcl.Forms,
  uPrincipal in 'Forms\uPrincipal.pas' {Form1},
  uiTipoCombustivel in 'Interfaces\uiTipoCombustivel.pas',
  uiTanque in 'Interfaces\uiTanque.pas',
  uiBomba in 'Interfaces\uiBomba.pas',
  uAbastecer in 'Classes\uAbastecer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPosto, frmPosto);
  Application.Run;
end.
