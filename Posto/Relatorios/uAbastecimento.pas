unit uAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLReport, udmBanco, RLParser;

type
  TfrmRelAbastecimento = class(TForm)
    rlrAbastecimento: TRLReport;
    qryAbastecimento: TFDQuery;
    rlbCabecalho: TRLBand;
    rlbDetalhes: TRLBand;
    dsAbastecimento: TDataSource;
    RLBand2: TRLBand;
    rllTitulo: TRLLabel;
    rllData: TRLLabel;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryAbastecimentoBOMBA: TIntegerField;
    qryAbastecimentoTANQUE: TStringField;
    qryAbastecimentoVALOR: TFloatField;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    rleValorTotal: TRLExpressionParser;
    RLBand1: TRLBand;
    RLDBText4: TRLDBText;
    rldBomba: TRLDBText;
    rldTanque: TRLDBText;
    rldDtAbastecimento: TRLDBText;
    rllValorTotal: TRLLabel;
  private
    { Private declarations }
    procedure PreencherValorTotal;
  public
    procedure CarregarRelatório;
    { Public declarations }
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation

uses
  uExcecoes;



{$R *.dfm}

{ TfrmRelAbastecimento }

procedure TfrmRelAbastecimento.CarregarRelatório;
begin
  qryAbastecimento.Open;

  if qryAbastecimento.IsEmpty then
    raise ERelatorioException.Create('Nenhum registro encontrado!');

  PreencherValorTotal;
end;

procedure TfrmRelAbastecimento.PreencherValorTotal;
var
  valorTotal : Real;
begin
  valorTotal := 0;
  qryAbastecimento.First;

  while not qryAbastecimento.Eof do
  begin
    valorTotal := valorTotal + qryAbastecimentoVALOR.AsFloat;
    qryAbastecimento.Next;
  end;

  qryAbastecimento.First;

  rllValorTotal.Caption := 'R$ ' + FloatToStr(valorTotal);
end;

end.
