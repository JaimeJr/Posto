unit uPrincipal;

interface

uses
  uiTanque, uiBomba, uiTipoCombustivel, uTanque, uBomba, uTipoCombustivel,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPosto = class(TForm)
    pnlFundo: TPanel;
    pnlGasolina: TPanel;
    pnlRelatorio: TPanel;
    btnRelatorio: TButton;
    edtPrecoLitroGas: TLabeledEdit;
    Panel4: TPanel;
    Panel3: TPanel;
    btnAbastecerT1B2: TButton;
    pnlBomba2: TPanel;
    btnAbastecerT1B1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    pnlOleoDiesel: TPanel;
    edtPrecoLitroOleo: TLabeledEdit;
    Panel2: TPanel;
    Panel5: TPanel;
    btnBombaGasUm: TButton;
    edtLitrosOleoUm: TLabeledEdit;
    Panel6: TPanel;
    btnBombaGasDois: TButton;
    edtLitrosOleoDois: TLabeledEdit;
    btnAtualizarOleo: TButton;
    btnAtualizarGasolina: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBombaGasUmClick(Sender: TObject);
    procedure btnBombaGasDoisClick(Sender: TObject);
  private
    { Private declarations }
    FGasolina : ITipoCombustivel;
    FOleoDiesel : ITipoCombustivel;

    FTanqueOleo     : ITanque;
    FTanqueGasolina : ITanque;

    FBombaGasUm     : IBomba;
    FBombaGasDois   : IBomba;

    FBombaOleoUm    : IBomba;
    FBombaOleoDois  : IBomba;

    procedure CarregarTipoCombustivel;
    procedure CarregarTanque;
    procedure CarregarBomba;
    procedure CarregarClasses;

  public
    { Public declarations }
  end;

var
  frmPosto: TfrmPosto;

implementation

uses
  udmBanco;

{$R *.dfm}

{ TfrmPosto }

procedure TfrmPosto.btnBombaGasDoisClick(Sender: TObject);
begin
  FBombaOleoDois.Abastecer(StrToFloat(edtLitrosOleoDois.Text));
end;

procedure TfrmPosto.btnBombaGasUmClick(Sender: TObject);
begin
  FBombaOleoUm.Abastecer(StrToFloat(edtLitrosOleoUm.Text));
end;

procedure TfrmPosto.CarregarBomba;
begin
  FBombaOleoUm := TBomba.
                    New.
                      Carregar(2, FTanqueOleo);

  FBombaOleoDois := TBomba.
                      New.
                        Carregar(4, FTanqueOleo);

  FBombaGasUm := TBomba.
                   New.
                     Carregar(1, FTanqueGasolina);

  FBombaGasDois := TBomba.
                     New.
                       Carregar(3, FTanqueGasolina);
end;

procedure TfrmPosto.CarregarClasses;
begin
  CarregarTipoCombustivel;
  CarregarTanque;
  CarregarBomba;
end;

procedure TfrmPosto.CarregarTanque;
begin
  FTanqueOleo     := TTanque.
                       New.
                         Carregar(2, FOleoDiesel);

  FTanqueGasolina := TTanque.
                       New.
                         Carregar(1, FGasolina);
end;

procedure TfrmPosto.CarregarTipoCombustivel;
begin
  FGasolina := TTipoCombustivel.
                 New.
                   Carregar(1);

  FOleoDiesel := TTipoCombustivel.
                   New.
                     Carregar(2);

  edtPrecoLitroGas.Text := FloatToStr(FGasolina.ValorLitro);
  edtPrecoLitroOleo.Text := FloatToStr(FOleoDiesel.ValorLitro);
end;

procedure TfrmPosto.FormCreate(Sender: TObject);
begin
  CarregarClasses;
end;

end.
