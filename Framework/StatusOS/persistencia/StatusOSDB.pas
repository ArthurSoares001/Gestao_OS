unit StatusOSDB;

interface

uses
  Constantes, Filtro, StatusOS, System.Classes;  // Adicione System.Classes aqui

type
  IStatusOSDB = interface
    procedure Inserir(StatusOS: TStatusOS);
    procedure Alterar(StatusOS: TStatusOS);
    function Procurar(StatusOS: TStatusOS): TStatusOS;
    procedure Deletar(StatusOS: TStatusOS);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
