unit frameformLabel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Constantes;

type
  TfraformLabel = class(TFrame)
    pnLabel: TPanel;
    lblTitulo: TLabel;
    spdAlterar: TSpeedButton;
    spdConsultar: TSpeedButton;
    spdIncluir: TSpeedButton;
    spdSair: TSpeedButton;
    procedure spdSairClick(Sender: TObject);
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    form: TForm;
  public
    { Public declarations }
    procedure iniciar(titulo: String; form: Tform);
    procedure setStatusInterface(statusInterface: TStatusInterface);
  end;

implementation

{$R *.dfm}

{ TfraformLabel }

procedure TfraformLabel.iniciar(titulo: String; form: Tform);
begin
  lblTitulo.Caption := titulo;
  self.form := form;
  spdConsultar.Visible := false;
  spdIncluir.Visible := false;
  spdAlterar.Visible := false;

  spdIncluir.Hint := 'Incluindo';
  spdAlterar.Hint := 'Alterando';
  spdConsultar.Hint := 'Consultando';
  spdSair.Hint := 'Sair';
end;

procedure TfraformLabel.lblTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //ReleaseCapture;
  //TWinControl(Sender).perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfraformLabel.setStatusInterface(statusInterface: TStatusInterface);
begin
  spdConsultar.Visible := statusInterface = stConsultar;
  spdIncluir.Visible := statusInterface = stIncluir;
  spdAlterar.Visible := statusInterface = stAlterar;
end;

procedure TfraformLabel.spdSairClick(Sender: TObject);
begin
  form.Close;
end;

end.
