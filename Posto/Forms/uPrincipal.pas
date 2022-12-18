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
    btnAbastecerGasUm: TButton;
    pnlBomba2: TPanel;
    btnAbastecerGasDois: TButton;
    edtLitrosGasDois: TLabeledEdit;
    edtLitrosGasUm: TLabeledEdit;
    pnlOleoDiesel: TPanel;
    edtPrecoLitroOleo: TLabeledEdit;
    Panel2: TPanel;
    Panel5: TPanel;
    btnAbastecerOleoUm: TButton;
    edtLitrosOleoUm: TLabeledEdit;
    Panel6: TPanel;
    btnAbastecerOleoDois: TButton;
    edtLitrosOleoDois: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAbastecerOleoUmClick(Sender: TObject);
    procedure btnAbastecerOleoDoisClick(Sender: TObject);
    procedure btnAbastecerGasUmClick(Sender: TObject);
    procedure btnAbastecerGasDoisClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
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

    procedure GerarRelatorio;

  public
    { Public declarations }
  end;

var
  frmPosto: TfrmPosto;

implementation

uses
  udmBanco, uAbastecimento;

{$R *.dfm}

{ TfrmPosto }

procedure TfrmPosto.btnAbastecerGasDoisClick(Sender: TObject);
begin
  FBombaGasDois.Abastecer(StrToFloat(edtLitrosGasDois.Text));
end;

procedure TfrmPosto.btnAbastecerGasUmClick(Sender: TObject);
begin
  FBombaGasUm.Abastecer(StrToFloat(edtLitrosGasUm.Text));
end;

procedure TfrmPosto.btnAbastecerOleoDoisClick(Sender: TObject);
begin
  FBombaOleoDois.Abastecer(StrToFloat(edtLitrosOleoDois.Text));
end;

procedure TfrmPosto.btnAbastecerOleoUmClick(Sender: TObject);
begin
  FBombaOleoUm.Abastecer(StrToFloat(edtLitrosOleoUm.Text));
end;

procedure TfrmPosto.btnRelatorioClick(Sender: TObject);
begin
  GerarRelatorio;
end;

procedure TfrmPosto.CarregarBomba;
begin
  FBombaOleoUm := TBomba.
                    New.
                      Carregar(1, FTanqueOleo);

  FBombaOleoDois := TBomba.
                      New.
                        Carregar(2, FTanqueOleo);

  FBombaGasUm := TBomba.
                   New.
                     Carregar(3, FTanqueGasolina);

  FBombaGasDois := TBomba.
                     New.
                       Carregar(4, FTanqueGasolina);
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

procedure TfrmPosto.GerarRelatorio;
var
  frmRelatorio : TfrmRelAbastecimento;
begin
  try
    frmRelatorio := TfrmRelAbastecimento.Create(Self);
    frmRelatorio.CarregarRelatório;
    frmRelatorio.rlrAbastecimento.Print;
  finally
    FreeAndNil(frmRelatorio);
  end;
end;

end.
