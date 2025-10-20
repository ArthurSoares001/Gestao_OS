unit OSAnexo;

interface

uses
  OrObject, SysUtils, Classes;

type
  TOSAnexo = class(TOrObject)
  private
    id: Integer;
    osId: Integer;
    nomeArquivo: string;
    tipoMime: string;
    tamanhoBytes: Integer;
    armazenamento: string;
    caminhoChave: string;
    dtUpload: TDateTime;
    usuarioUpload: string;
  public
    constructor Create;
    destructor Destroy; override;

    // Sets
    procedure setId(id: Integer); override;
    procedure setOsId(osId: Integer);
    procedure setNomeArquivo(nomeArquivo: string);
    procedure setTipoMime(tipoMime: string);
    procedure setTamanhoBytes(tamanhoBytes: Integer);
    procedure setArmazenamento(armazenamento: string);
    procedure setCaminhoChave(caminhoChave: string);
    procedure setDtUpload(dtUpload: TDateTime);
    procedure setUsuarioUpload(usuarioUpload: string);

    // Gets
    function getId: Integer; override;
    function getOsId: Integer;
    function getNomeArquivo: string;
    function getTipoMime: string;
    function getTamanhoBytes: Integer;
    function getArmazenamento: string;
    function getCaminhoChave: string;
    function getDtUpload: TDateTime;
    function getUsuarioUpload: string;

    // Validação
    function validar: Boolean; override;
  end;

implementation

uses
  Constantes;

{ TOSAnexo }

constructor TOSAnexo.Create;
begin
  inherited Create;
  setId(NULL_INTEGER);
  setOsId(NULL_INTEGER);
  setNomeArquivo('');
  setTipoMime('');
  setTamanhoBytes(0);
  setArmazenamento('');
  setCaminhoChave('');
  setDtUpload(Now);
  setUsuarioUpload('');
end;

destructor TOSAnexo.Destroy;
begin
  inherited;
end;

// ======================== GETS ========================

function TOSAnexo.getId: Integer;
begin
  Result := id;
end;

function TOSAnexo.getOsId: Integer;
begin
  Result := osId;
end;

function TOSAnexo.getNomeArquivo: string;
begin
  Result := nomeArquivo;
end;

function TOSAnexo.getTipoMime: string;
begin
  Result := tipoMime;
end;

function TOSAnexo.getTamanhoBytes: Integer;
begin
  Result := tamanhoBytes;
end;

function TOSAnexo.getArmazenamento: string;
begin
  Result := armazenamento;
end;

function TOSAnexo.getCaminhoChave: string;
begin
  Result := caminhoChave;
end;

function TOSAnexo.getDtUpload: TDateTime;
begin
  Result := dtUpload;
end;

function TOSAnexo.getUsuarioUpload: string;
begin
  Result := usuarioUpload;
end;

// ======================== SETS ========================

procedure TOSAnexo.setId(id: Integer);
begin
  inherited;
  Self.id := id;
end;

procedure TOSAnexo.setOsId(osId: Integer);
begin
  Self.osId := osId;
end;

procedure TOSAnexo.setNomeArquivo(nomeArquivo: string);
begin
  Self.nomeArquivo := nomeArquivo;
end;

procedure TOSAnexo.setTipoMime(tipoMime: string);
begin
  Self.tipoMime := tipoMime;
end;

procedure TOSAnexo.setTamanhoBytes(tamanhoBytes: Integer);
begin
  Self.tamanhoBytes := tamanhoBytes;
end;

procedure TOSAnexo.setArmazenamento(armazenamento: string);
begin
  Self.armazenamento := armazenamento;
end;

procedure TOSAnexo.setCaminhoChave(caminhoChave: string);
begin
  Self.caminhoChave := caminhoChave;
end;

procedure TOSAnexo.setDtUpload(dtUpload: TDateTime);
begin
  Self.dtUpload := dtUpload;
end;

procedure TOSAnexo.setUsuarioUpload(usuarioUpload: string);
begin
  Self.usuarioUpload := usuarioUpload;
end;

// ======================== VALIDAR ========================

function TOSAnexo.validar: Boolean;
begin
  Result := False;

  if (getOsId = NULL_INTEGER) then
    raise Exception.Create('Campo OSId é obrigatório!');

  if Trim(getNomeArquivo) = '' then
    raise Exception.Create('Campo Nome do Arquivo é obrigatório!');

  if Length(Trim(getNomeArquivo)) > 200 then
    raise Exception.Create('Campo Nome do Arquivo não pode exceder 200 caracteres!');

  if (Trim(getTipoMime) <> '') and (Length(Trim(getTipoMime)) > 60) then
    raise Exception.Create('Campo Tipo MIME não pode exceder 60 caracteres!');

  if getTamanhoBytes < 0 then
    raise Exception.Create('Campo Tamanho em Bytes não pode ser negativo!');

  if Trim(getArmazenamento) = '' then
    raise Exception.Create('Campo Armazenamento é obrigatório!');

  if Length(Trim(getArmazenamento)) > 20 then
    raise Exception.Create('Campo Armazenamento não pode exceder 20 caracteres!');

  if Trim(getCaminhoChave) = '' then
    raise Exception.Create('Campo Caminho/Chave é obrigatório!');

  if Length(Trim(getCaminhoChave)) > 300 then
    raise Exception.Create('Campo Caminho/Chave não pode exceder 300 caracteres!');

  if getDtUpload = 0 then
    raise Exception.Create('Campo Data de Upload é obrigatório!');

  if (Trim(getUsuarioUpload) <> '') and (Length(Trim(getUsuarioUpload)) > 60) then
    raise Exception.Create('Campo Usuário de Upload não pode exceder 60 caracteres!');

  Result := True;
end;

end.

