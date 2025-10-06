unit frameSalvaCancela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfraSalvaCancela = class(TFrame)
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    form: TForm;
  public
    { Public declarations }
    procedure iniciar(form: TForm);
  end;

implementation

{$R *.dfm}
uses Biblioteca;

{ TfraSalvaCancela }

procedure TfraSalvaCancela.btnCancelarClick(Sender: TObject);
begin
  with form do
  begin
    close;
    ModalResult := mrCancel;
  end;
end;

procedure TfraSalvaCancela.btnSalvarClick(Sender: TObject);
begin
  with form do
  begin
    close;
    ModalResult := mrOk;
  end;
end;

procedure TfraSalvaCancela.iniciar(form: TForm);
begin
  self.form := form;
  UsarArredondarView(pnlSalvar);
  UsarArredondarView(pnlCancelar);
end;

end.
