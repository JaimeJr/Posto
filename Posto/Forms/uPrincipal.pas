unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPosto = class(TForm)
    pnlFundo: TPanel;
    pnlGasolina: TPanel;
    pnlRelatorio: TPanel;
    btnRelatorio: TButton;
    edtPrecoLitro: TLabeledEdit;
    Panel4: TPanel;
    Panel3: TPanel;
    btnAbastecerT1B2: TButton;
    pnlBomba2: TPanel;
    btnAbastecerT1B1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    pnlOleoDiesel: TPanel;
    LabeledEdit3: TLabeledEdit;
    Panel2: TPanel;
    Panel5: TPanel;
    Button1: TButton;
    LabeledEdit4: TLabeledEdit;
    Panel6: TPanel;
    Button2: TButton;
    LabeledEdit5: TLabeledEdit;
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
