unit PrioridadeOSDB;

interface

uses
  Constantes, Filtro, PrioridadeOS, System.Classes;  // Adicione System.Classes aqui

type
  IPrioridadeOSDB = interface
    procedure Inserir(PrioridadeOS: TPrioridadeOS);
    procedure Alterar(PrioridadeOS: TPrioridadeOS);
    function Procurar(PrioridadeOS: TPrioridadeOS): TPrioridadeOS;
    procedure Deletar(PrioridadeOS: TPrioridadeOS);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
