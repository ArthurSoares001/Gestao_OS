unit FormTecnicoControle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, frameRodaPeControle, frameCabecalhoControle,
  frameformLabel, Filtro, Data.DB, Vcl.DBGrids, TecnicoPostgreSQL;

type
  TFrmTecnicoControle = class(TForm)
    fraformLabel1: TfraformLabel;
    fraRodaPeControle1: TfraRodaPeControle;
    stgDados: TStringGrid;
    fraCabecalhoControle1: TfraCabecalhoControle;
    procedure FormCreate(Sender: TObject);
    procedure stgDadosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure fraRodaPeControle1spdEditarClick(Sender: TObject);
    procedure fraRodaPeControle1spdExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraRodaPeControle1spdImprimirClick(Sender: TObject);
    procedure stgDadosDblClick(Sender: TObject);
    procedure fraRodaPeControle1spdExcelClick(Sender: TObject);
    procedure frameCabecalhoControle1edtDescricaoChange(Sender: TObject);
    procedure fraCabecalhoControle1btnNovoClick(Sender: TObject);
    procedure fraCabecalhoControle1spdProcurarClick(Sender: TObject);
  private
    filtro: TFiltro;
    TecnicoDB: TTecnicoPostgreSQL;
    ListaTecnicos: TList;
    procedure atualizarGrid;
    procedure atualizarInterface;
    procedure chamarFormTecnico;
    procedure FreeListaTecnicos;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrmTecnicoControle: TFrmTecnicoControle;

implementation

uses
  Constantes, Biblioteca, DataModule, Tecnico, FormTecnico;

{$R *.dfm}

{ TFrmTecnicoControle }

constructor TFrmTecnicoControle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TecnicoDB := TTecnicoPostgreSQL.Create;
  ListaTecnicos := TList.Create;
end;

destructor TFrmTecnicoControle.Destroy;
begin
  FreeListaTecnicos;
  ListaTecnicos.Free;
  TecnicoDB.Free;
  inherited Destroy;
end;

procedure TFrmTecnicoControle.FreeListaTecnicos;
var
  I: Integer;
begin
  for I := 0 to ListaTecnicos.Count - 1 do
    TObject(ListaTecnicos[I]).Free;
  ListaTecnicos.Clear;
end;

procedure TFrmTecnicoControle.atualizarInterface;
begin
  organizarTabOrder(Self);
  Position := poScreenCenter;
  stgDados.Options := stgDados.Options + [goRowSelect];
  stgDados.ScrollBars := ssBoth;
  KeyPreview := True;
  ShowHint := True;
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  fraCabecalhoControle1.GBPeriodo.Visible := false;
  fraCabecalhoControle1.GroupBox1.Visible := false;
end;

procedure TFrmTecnicoControle.chamarFormTecnico;
var
  Tecnico : TTecnico;
begin
  if (stgDados.Row - 1 < 0) or (stgDados.Row - 1 >= ListaTecnicos.Count) then
    Exit;

  Tecnico := TTecnico(ListaTecnicos[stgDados.Row - 1]);
  frmTecnico := TfrmTecnico.Create(Self);
  try
    frmTecnico.setStatusInterface(stAlterar);
    frmTecnico.setTecnico(Tecnico);
    if frmTecnico.ShowModal = mrOk then
    begin
      if frmTecnico.getTecnico.validar then
      begin
        TecnicoDB.Alterar(frmTecnico.getTecnico);
        atualizarGrid;
      end;
    end;
  finally
    FreeAndNil(frmTecnico);
  end;
end;

procedure TFrmTecnicoControle.FormCreate(Sender: TObject);
begin
  fraformLabel1.iniciar('Técnico - Controle', Self);
  fraCabecalhoControle1.iniciar(Self);
  fraRodaPeControle1.iniciar(NULL_STRING, Self, stgDados);
  filtro := TFiltro.Create;
  atualizarInterface;
end;

procedure TFrmTecnicoControle.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    fraCabecalhoControle1btnNovoClick(Self)
  else if Key = VK_F3 then
    fraCabecalhoControle1spdProcurarClick(Self)
  else if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmTecnicoControle.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = KEY_ENTER then
  begin
    Key := KEY_TAB;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmTecnicoControle.FormShow(Sender: TObject);
begin
  limparInterface(Self);
  atualizarGrid;
end;

procedure TFrmTecnicoControle.fraCabecalhoControle1btnNovoClick(Sender: TObject);
var
  Tecnico: TTecnico;
begin
  Tecnico := TTecnico.Create;
  try
     frmTecnico := TfrmTecnico.Create(Self);
    try
      frmTecnico.setStatusInterface(stIncluir);
      frmTecnico.setTecnico(Tecnico);
      if frmTecnico.ShowModal = mrOk then
      begin
      //  if frmTecnico.getTecnico.validar then
      //  begin
          TecnicoDB.Inserir(frmTecnico.getTecnico);
          atualizarGrid;
     //   end;
      end;
    finally
      FreeAndNil(frmTecnico);
    end;
  finally
    Tecnico.Free;
  end;
end;

procedure TFrmTecnicoControle.fraCabecalhoControle1spdProcurarClick(
  Sender: TObject);
begin
  filtro.novaInstancia;
  filtro.setDescricao(fraCabecalhoControle1.edtDescricao.Text);
  atualizarGrid;
end;

procedure TFrmTecnicoControle.frameCabecalhoControle1edtDescricaoChange(Sender: TObject);
begin
  fraCabecalhoControle1.edtDescricaoChange(Sender);
end;

procedure TFrmTecnicoControle.fraRodaPeControle1spdEditarClick(Sender: TObject);
begin
  chamarFormTecnico;
end;

procedure TFrmTecnicoControle.fraRodaPeControle1spdExcelClick(Sender: TObject);
begin
  fraRodaPeControle1.spdExcelClick(Sender);
end;

procedure TFrmTecnicoControle.fraRodaPeControle1spdExcluirClick(Sender: TObject);
var
  Tecnico: TTecnico;
begin
  if (stgDados.Row - 1 < 0) or (stgDados.Row - 1 >= ListaTecnicos.Count) then
    Exit;

  if Application.MessageBox(PChar(MSG_CONFIRMA_EXCLUSAO), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Tecnico := TTecnico(ListaTecnicos[stgDados.Row - 1]);
    TecnicoDB.Deletar(Tecnico);
    atualizarGrid;
  end;
end;

procedure TFrmTecnicoControle.fraRodaPeControle1spdImprimirClick(Sender: TObject);
begin {
  var rptTecnico := TrptTecnico.Create(Self);
  try
    rptTecnico.imprimir(ListaTecnicos);
  finally
    FreeAndNil(rptTecnico);
  end;   }
end;

procedure TFrmTecnicoControle.stgDadosDblClick(Sender: TObject);
begin
  chamarFormTecnico;
end;

procedure TFrmTecnicoControle.stgDadosDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  strTemp: string;
  grid: TStringGrid;
begin
  grid := stgDados;
  grid.ColWidths[0] := Trunc(grid.Width * 0.06); // Ativo
  grid.ColWidths[1] := Trunc(grid.Width * 0.08); // Id
  grid.ColWidths[2] := Trunc(grid.Width * 0.30); // Nome
  grid.ColWidths[3] := Trunc(grid.Width * 0.15); // Telefone
  grid.ColWidths[4] := Trunc(grid.Width * 0.20); // Especialidade
  grid.ColWidths[5] := Trunc(grid.Width * 0.20); // Email
  with (Sender as TStringGrid) do
  begin
    strTemp := Cells[ACol, ARow];
    if ACol = ColCount - 1 then
      strTemp := strTemp + StringOfChar(' ', 5);

    Canvas.Font.Style := [];
    Canvas.Font.Color := clBlack;
    Canvas.Brush.Color := clWindow;

    if ARow = 0 then
    begin
      Canvas.Font.Style := [fsBold];
      Canvas.Brush.Color := clBtnFace;
    end
    else
    begin
      if ARow = Row then
      begin
        Canvas.Font.Color := clWhite;
        Canvas.Brush.Color := clHighlight;
      end
      else
      begin
        if ARow mod 2 = 0 then
          Canvas.Brush.Color := clInfoBk
        else
          Canvas.Brush.Color := clWhite;
      end;
      if Cells[0, ARow] = 'N' then
        Canvas.Brush.Color := $007090FF;
    end;
    Canvas.FillRect(Rect);
    if ACol in [2, 4] then
      DrawText(Canvas.Handle, PChar(' ' + strTemp), -1, Rect, DT_SINGLELINE or DT_VCENTER or DT_LEFT)
    else
      DrawText(Canvas.Handle, PChar(' ' + strTemp + ' '), -1, Rect, DT_SINGLELINE or DT_VCENTER or DT_CENTER);
  end;
end;

procedure TFrmTecnicoControle.atualizarGrid;
var
  Tecnico: TTecnico;
  I: Integer;
begin
  processando(Self);
  try
    FreeListaTecnicos;
    stgDados.RowCount := 2;
    stgDados.Rows[1].Clear;
    stgDados.Cells[0, 0] := 'Ativo';
    stgDados.Cells[1, 0] := 'Id';
    stgDados.Cells[2, 0] := 'Nome';
    stgDados.Cells[3, 0] := 'Telefone';
    stgDados.Cells[4, 0] := 'Especialidade';
    stgDados.Cells[5, 0] := 'Email';

    ListaTecnicos := TecnicoDB.ProcurarTodos(filtro, 0);

    if ListaTecnicos.Count > 0 then
    begin
      stgDados.RowCount := ListaTecnicos.Count + 1;
      for I := 0 to ListaTecnicos.Count - 1 do
      begin
        Tecnico := TTecnico(ListaTecnicos[I]);
        stgDados.Cells[0, I + 1] := booleanToChar(Tecnico.getAtivo);
        stgDados.Cells[1, I + 1] := IntToStr(Tecnico.getId);
        stgDados.Cells[2, I + 1] := Tecnico.getNome;
        stgDados.Cells[3, I + 1] := Tecnico.getTelefone;
        stgDados.Cells[4, I + 1] := Tecnico.getEspecialidade;
        stgDados.Cells[5, I + 1] := Tecnico.getEmail;
      end;
    end;
    fraRodaPeControle1.setRegistro(ListaTecnicos.Count);
  finally
    processoFinalizado(Self);
  end;
end;

end.
