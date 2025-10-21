program GestaoOS;

uses
  Vcl.Forms,
  FormPrincipal in 'FormPrincipal.pas' {FrmPrincipal},
  Cliente in 'Framework\Cliente\modelo\Cliente.pas',
  Biblioteca in 'Framework\Comunm\Biblioteca.pas',
  Constantes in 'Framework\Comunm\Constantes.pas',
  MotivoCancelamento in 'Framework\MotivoCancelamento\modelo\MotivoCancelamento.pas',
  OS in 'Framework\OS\modelo\OS.pas',
  OSAnexo in 'Framework\OSAnexo\modelo\OSAnexo.pas',
  OSEquipe in 'Framework\OSEquipe\modelo\OSEquipe.pas',
  OSEvento in 'Framework\OSEvento\modelo\OSEvento.pas',
  OSItem in 'Framework\OSItem\modelo\OSItem.pas',
  Produto in 'Framework\Produto\modelo\Produto.pas',
  PrioridadeOS in 'Framework\PrioridadeOS\modelo\PrioridadeOS.pas',
  StatusOS in 'Framework\StatusOS\modelo\StatusOS.pas',
  Tecnico in 'Framework\Tecnico\modelo\Tecnico.pas',
  FormCliente in 'Framework\Cliente\visao\FormCliente.pas' {FrmCliente},
  frameformLabel in 'Framework\Comunm\visao\frameformLabel.pas' {fraformLabel: TFrame},
  FormClienteControle in 'Framework\Cliente\visao\FormClienteControle.pas' {FrmClienteControle},
  frameRodaPeControle in 'Framework\Comunm\visao\frameRodaPeControle.pas' {fraRodaPeControle: TFrame},
  frameSalvaCancela in 'Framework\Comunm\visao\frameSalvaCancela.pas' {fraSalvaCancela: TFrame},
  ClientePostgreSQL in 'Framework\Cliente\persistencia\ClientePostgreSQL.pas',
  DataModule in 'Framework\Comunm\DataModule.pas' {DMConexao: TDataModule},
  ClienteDB in 'Framework\Cliente\persistencia\ClienteDB.pas',
  Filtro in 'Framework\Comunm\Filtro.pas',
  TecnicoPostgreSQL in 'Framework\Tecnico\persistencia\TecnicoPostgreSQL.pas',
  TecnicoDB in 'Framework\Tecnico\persistencia\TecnicoDB.pas',
  FormTecnicoControle in 'Framework\Tecnico\visao\FormTecnicoControle.pas' {FrmTecnicoControle},
  FormTecnico in 'Framework\Tecnico\visao\FormTecnico.pas' {FrmTecnico},
  ProdutoPostgreSQL in 'Framework\Produto\persistencia\ProdutoPostgreSQL.pas',
  ProdutoDB in 'Framework\Produto\persistencia\ProdutoDB.pas',
  FormProdutoControle in 'Framework\Produto\visao\FormProdutoControle.pas' {FrmProdutoControle},
  FormProduto in 'Framework\Produto\visao\FormProduto.pas' {FrmProduto},
  OSPostgreSQL in 'Framework\OS\persistencia\OSPostgreSQL.pas',
  OSDB in 'Framework\OS\persistencia\OSDB.pas',
  FormOSControle in 'Framework\OS\visao\FormOSControle.pas' {FrmOSControle},
  FormOS in 'Framework\OS\visao\FormOS.pas' {FrmOS},
  StatusOSPostgreSQL in 'Framework\StatusOS\persistencia\StatusOSPostgreSQL.pas',
  StatusOSDB in 'Framework\StatusOS\persistencia\StatusOSDB.pas',
  PrioridadeOSPostgreSQL in 'Framework\PrioridadeOS\persistencia\PrioridadeOSPostgreSQL.pas',
  PrioridadeOSDB in 'Framework\PrioridadeOS\persistencia\PrioridadeOSDB.pas',
  frameCabecalhoControle in 'Framework\Comunm\visao\frameCabecalhoControle.pas' {fraCabecalhoControle: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
