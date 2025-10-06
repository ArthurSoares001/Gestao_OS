unit OSEquipe;

interface

uses OrObject, SysUtils, Classes;

type
   TOSEquipe = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         os: TOrObject;
         tecnico: TOrObject;
         horasAlocadas: Double;
         data: TDate;
      public
         procedure setId(id: Integer); override;
         procedure setOs(os: TOrObject);
         procedure setTecnico(tecnico: TOrObject);
         procedure setHorasAlocadas(horasAlocadas: Double);
         procedure setData(data: TDate);

         function getId: Integer; override;
         function getOs: TOrObject;
         function getTecnico: TOrObject;
         function getHorasAlocadas: Double;
         function getData: TDate;


         function validar: Boolean; override;
      end;

implementation

uses Constantes, OS, Tecnico;

constructor TOSEquipe.Create;
begin
  setId(NULL_INTEGER);
  setOs(TOS.Create);
  setTecnico(nil);
  setHorasAlocadas(0);
  setData(0);
end;

destructor TOSEquipe.Destroy;
begin
  os.Free;
  if Assigned(tecnico) then
    tecnico.Free;
  inherited;
end;

//---------------- gets
function TOSEquipe.getId: Integer;
begin
  Result := id;
end;

function TOSEquipe.getOs: TOrObject;
begin
  Result := os;
end;

function TOSEquipe.getTecnico: TOrObject;
begin
  Result := tecnico;
end;

function TOSEquipe.getHorasAlocadas: Double;
begin
  Result := horasAlocadas;
end;

function TOSEquipe.getData: TDate;
begin
  Result := data;
end;

//---------------- sets
procedure TOSEquipe.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TOSEquipe.setOs(os: TOrObject);
begin
  self.os := os;
end;

procedure TOSEquipe.setTecnico(tecnico: TOrObject);
begin
  self.tecnico := tecnico;
end;

procedure TOSEquipe.setHorasAlocadas(horasAlocadas: Double);
begin
  self.horasAlocadas := horasAlocadas;
end;

procedure TOSEquipe.setData(data: TDate);
begin
  self.data := data;
end;

function TOSEquipe.validar: Boolean;
begin
  Result := False;

  if (getOs.getId = NULL_INTEGER) then
    raise Exception.Create('Campo OS é obrigatório!');

  if (getTecnico.getId = NULL_INTEGER) then
    raise Exception.Create('Campo Técnico é obrigatório!');

  if getHorasAlocadas < 0 then
    raise Exception.Create('Campo Horas Alocadas não pode ser negativo!');

  if getData = 0 then
    raise Exception.Create('Campo Data é obrigatório!');

  Result := True;
end;

end.
