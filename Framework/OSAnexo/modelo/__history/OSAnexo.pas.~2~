unit OSAnexo;

interface

uses OrObject, SysUtils, Classes;

type
   TOSAnexo = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         os: TOrObject;
         nomeArquivo: string;
         tipoMime: string;
         tamanhoBytes: Int64;
         armazenamento: string;
         caminhoChastos: string;
         dtUpload: TDateTime;
         usuarioUpload: string;
      public
         procedure setId(id: Integer); override;
         procedure setOs(os: TOrObject);
         procedure setNomeArquivo(nomeArquivo: string);
         procedure setTipoMime(tipoMime: string);
         procedure setTamanhoBytes(tamanhoBytes: Int64);
         procedure setArmazenamento(armazenamento: string);
         procedure setCaminhoChave(caminhoChave: string);
         procedure setDtUpload(dtUpload: TDateTime);
         procedure setUsuarioUpload(usuarioUpload: string);

         function getId: Integer; override;
         function getOs: TOrObject;
         function getNomeArquivo: string;
         function getTipoMime: string;
         function getTamanhoBytes: Int64;
         function getArmazenamento: string;
         function getCaminhoChave: string;
         function getDtUpload: TDateTime;
         function getUsuarioUpload: string;

         function validar: Boolean; override;
      end;

implementation

uses Constantes, OS;

constructor TOSAnexo.Create;
begin
  setId(NULL_INTEGER);
  setOs(TOS.Create);
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
  os.Free;
  inherited;
end;

//---------------- gets
function TOSAnexo.getId: Integer;
begin
  Result := id;
end;

function TOSAnexo.getOs: TOrObject;
begin
  Result := os;
end;

function TOSAnexo.getNomeArquivo: string;
begin
  Result := nomeArquivo;
end;

function TOSAnexo.getTipoMime: string;
begin
  Result := tipoMime;
end;

function TOSAnexo.getTamanhoBytes: Int64;
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

//---------------- sets
procedure TOSAnexo.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TOSAnexo.setOs(os: TOrObject);
begin
  self.os := os;
end;

procedure TOSAnexo.setNomeArquivo(nomeArquivo: string);
begin
  self.nomeArquivo := nomeArquivo;
end;

procedure TOSAnexo.setTipoMime(tipoMime: string);
begin
  self.tipoMime := tipoMime;
end;

procedure TOSAnexo.setTamanhoBytes(tamanhoBytes: Int64);
begin
  self.tamanhoBytes := tamanhoBytes;
end;

procedure TOSAnexo.setArmazenamento(armazenamento: string);
begin
  self.armazenamento := armazenamento;
end;

procedure TOSAnexo.setCaminhoChave(caminhoChave: string);
begin
  self.caminhoChave := caminhoChave;
end;

procedure TOSAnexo.setDtUpload(dtUpload: TDateTime);
begin
  self.dtUpload := dtUpload;
end;

procedure TOSAnexo.setUsuarioUpload(usuarioUpload: string);
begin
  self.usuarioUpload := usuarioUpload;
end;

function TOSAnexo.validar: Boolean;
begin
  Result := False;

  if not Assigned(getOs) or ((getOs as TOS).getId = NULL_INTEGER) then
    raise Exception.Create('Campo OS é obrigatório!');

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
