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
  frameCabecalhoControle in 'Framework\Comunm\visao\frameCabecalhoControle.pas' {fraCabecalhoControle: TFrame},
  frameRodaPeControle in 'Framework\Comunm\visao\frameRodaPeControle.pas' {fraRodaPeControle: TFrame},
  frameSalvaCancela in 'Framework\Comunm\visao\frameSalvaCancela.pas' {fraSalvaCancela: TFrame},
  ClientePostgreSQL in 'Framework\Cliente\persistencia\ClientePostgreSQL.pas',
  DataModule in 'Framework\Comunm\DataModule.pas' {DMConexao: TDataModule},
  ClienteDB in 'Framework\Cliente\persistencia\ClienteDB.pas',
  Filtro in 'Framework\Comunm\Filtro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
