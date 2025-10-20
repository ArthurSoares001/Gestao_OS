unit PrioridadeOS;

interface

uses OrObject, SysUtils, Classes;

type
   TPrioridadeOS = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         codigo: string;
         slaHoras: Integer;
      public
         procedure setId(id: Integer); override;
         procedure setCodigo(codigo: string);
         procedure setSlaHoras(slaHoras: Integer);

         function getId: Integer; override;
         function getCodigo: string;
         function getSlaHoras: Integer;

         function validar: Boolean; override;
         procedure ocopy(AObject: TOrObject); override;
      end;

implementation

uses Constantes;

constructor TPrioridadeOS.Create;
begin
  setId(NULL_INTEGER);
  setCodigo('');
  setSlaHoras(24);
end;

destructor TPrioridadeOS.Destroy;
begin
  inherited;
end;

//---------------- gets
function TPrioridadeOS.getId: Integer;
begin
  Result := id;
end;

function TPrioridadeOS.getCodigo: string;
begin
  Result := codigo;
end;

function TPrioridadeOS.getSlaHoras: Integer;
begin
  Result := slaHoras;
end;

//---------------- sets
procedure TPrioridadeOS.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TPrioridadeOS.setCodigo(codigo: string);
begin
  self.codigo := codigo;
end;

procedure TPrioridadeOS.setSlaHoras(slaHoras: Integer);
begin
  self.slaHoras := slaHoras;
end;

function TPrioridadeOS.validar: Boolean;
begin
  Result := False;

  if Trim(getCodigo) = '' then
    raise Exception.Create('Campo Código é obrigatório!');

  if Length(Trim(getCodigo)) > 20 then
    raise Exception.Create('Campo Código não pode exceder 20 caracteres!');

  if getSlaHoras <= 0 then
    raise Exception.Create('Campo SLA Horas deve ser maior que zero!');

  Result := True;
end;

procedure TPrioridadeOS.ocopy(AObject: TOrObject);
begin
  inherited ocopy(AObject);
  with AObject as TPrioridadeOS do
  begin
    self.id := getId;
    self.codigo := getCodigo;
    self.slaHoras := getSlaHoras;
  end;
end;

end.
