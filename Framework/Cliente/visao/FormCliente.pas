unit FormCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  frameformLabel, Vcl.Mask, frameSalvaCancela;

type
  TFrmCliente = class(TForm)
    PnlCliente: TPanel;
    lblIeRg: TLabel;
    lblTipo: TLabel;
    lblNomeRazao: TLabel;
    lblTelefone1: TLabel;
    lblTelefone2: TLabel;
    lblEmail: TLabel;
    lblCep: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblPontoDeReferencia: TLabel;
    fraformLabel1: TfraformLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    MemoObs: TMemo;
    CmbTipoPessoa: TComboBox;
    EdtTelPrincipal: TMaskEdit;
    MaskEdit1: TMaskEdit;
    ChkAtivo: TCheckBox;
    fraSalvaCancela1: TfraSalvaCancela;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

end.
