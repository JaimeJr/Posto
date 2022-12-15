unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPosto = class(TForm)
    pnlFundo: TPanel;
    Button2: TButton;
    btnAbastecerT1B1: TButton;
    btnAbastecerT1B2: TButton;
    Button3: TButton;
    btnRelatorio: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPosto: TfrmPosto;

implementation

{$R *.dfm}

end.
