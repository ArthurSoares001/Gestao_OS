unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    cnico1: TMenuItem;
    Produto1: TMenuItem;
    OS1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure cnico1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure OS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
uses
  Biblioteca, FormClienteControle, FormTecnicoControle, FormProdutoControle,
  FormOSControle;

{$R *.dfm}

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
  AbreForm(TfrmClienteControle, frmClienteControle);
end;

procedure TFrmPrincipal.cnico1Click(Sender: TObject);
begin
  AbreForm(TfrmTecnicoControle, frmTecnicoControle);
end;

procedure TFrmPrincipal.OS1Click(Sender: TObject);
begin
  AbreForm(TFrmOSControle, frmOSControle);
end;

procedure TFrmPrincipal.Produto1Click(Sender: TObject);
begin
  AbreForm(TfrmProdutoControle, frmProdutoControle);
end;

end.
