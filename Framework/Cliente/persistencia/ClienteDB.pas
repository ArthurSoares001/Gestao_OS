unit ClienteDB;

interface

uses
  Constantes, Filtro, Cliente, System.Classes;  // Adicione System.Classes aqui

type
  IClienteDB = interface
    procedure Inserir(Cliente: TCliente);
    procedure Alterar(Cliente: TCliente);
    function Procurar(Cliente: TCliente): TCliente;
    procedure Deletar(Cliente: TCliente);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
