unit OSEvento;

interface

uses
  OrObject, SysUtils, Classes;

type
   TOSEvento = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         os: TOrObject;
         dataHora: TDateTime;
         usuario: string;
         tipoEvento: string;
         descricao: string;
         depara: string;
      public
         procedure setId(id: Integer); override;
         procedure setOs(os: TOrObject);
         procedure setDataHora(dataHora: TDateTime);
         procedure setUsuario(usuario: string);
         procedure setTipoEvento(tipoEvento: string);
         procedure setDescricao(descricao: string);
         procedure setDepara(depara: string);

         function getId: Integer; override;
         function getOs: TOrObject;
         function getDataHora: TDateTime;
         function getUsuario: string;
         function getTipoEvento: string;
         function getDescricao: string;
         function getDepara: string;

         function validar: Boolean; override;
      end;

implementation

uses
  Constantes, OS;

constructor TOSEvento.Create;
begin
  setId(NULL_INTEGER);
  setOs(TOS.Create);
  setDataHora(Now);
  setUsuario('');
  setTipoEvento('');
  setDescricao('');
  setDepara('');
end;

destructor TOSEvento.Destroy;
begin
  os.Free;
  inherited;
end;

//---------------- gets
function TOSEvento.getId: Integer;
begin
  Result := id;
end;

function TOSEvento.getOs: TOrObject;
begin
  Result := os;
end;

function TOSEvento.getDataHora: TDateTime;
begin
  Result := dataHora;
end;

function TOSEvento.getUsuario: string;
begin
  Result := usuario;
end;

function TOSEvento.getTipoEvento: string;
begin
  Result := tipoEvento;
end;

function TOSEvento.getDescricao: string;
begin
  Result := descricao;
end;

function TOSEvento.getDepara: string;
begin
  Result := depara;
end;

//---------------- sets
procedure TOSEvento.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TOSEvento.setOs(os: TOrObject);
begin
  self.os := os;
end;

procedure TOSEvento.setDataHora(dataHora: TDateTime);
begin
  self.dataHora := dataHora;
end;

procedure TOSEvento.setUsuario(usuario: string);
begin
  self.usuario := usuario;
end;

procedure TOSEvento.setTipoEvento(tipoEvento: string);
begin
  self.tipoEvento := tipoEvento;
end;

procedure TOSEvento.setDescricao(descricao: string);
begin
  self.descricao := descricao;
end;

procedure TOSEvento.setDepara(depara: string);
begin
  self.depara := depara;
end;

function TOSEvento.validar: Boolean;
begin
  Result := False;

  if (getOs.getId = NULL_INTEGER) then
    raise Exception.Create('Campo OS é obrigatório!');

  if getDataHora = 0 then
    raise Exception.Create('Campo Data/Hora é obrigatório!');

  if Trim(getTipoEvento) = '' then
    raise Exception.Create('Campo Tipo de Evento é obrigatório!');

  if Length(Trim(getTipoEvento)) > 30 then
    raise Exception.Create('Campo Tipo de Evento não pode exceder 30 caracteres!');

  if (Trim(getUsuario) <> '') and (Length(Trim(getUsuario)) > 60) then
    raise Exception.Create('Campo Usuário não pode exceder 60 caracteres!');

  if Length(Trim(getDepara)) > 80 then
    raise Exception.Create('Campo De/Para não pode exceder 80 caracteres!');

  Result := True;
end;

end.
