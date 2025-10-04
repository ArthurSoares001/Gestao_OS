unit Constantes;

interface                                                        

type

    TBoletoTipo = (tbBB, tbCEF11, tbBradesco, tbACbr);
    TImpressorasFiscal = (ifDaruma, ifBematech, ifYanco, ifQuattro, ifElgin, ifACbr);
    TBancoDados = (bdOracle, bdInterbase, bdPostgreSQL);
    TStatusAtualizacao = (stVerificar, stBaixar, stAtualizar);
    TStatusInterface = (stConsultar, stIncluir, stExcluir, stAlterar, stAcertar);
    TLinhasPorPolegadas = (lppSeis, lppOito);
    TCaracteresPorPolegadas = (cppDez, cppDoze, cppDezessete, cppVinte);
    TTipoConta = (tcAtivo, tcPassivo, tcReceita, tcDespesa, tcFixo, tcVariavel);
    TTipoMovimentoCaixa = (tmEntrada, tmSaida);
    TResponsavelEmissaoBoleto = (reCliente, reBanco, reBancoReemite, reBancoNaoEmite);
    TLayoutBoleto = (lbPadrao, lbCarne, lbFatura);
    TTipoImpressao = (tpImpressora, tpPDF, tpHTML);
    arrString = array of string;
    TIAT  = (Truncando, Arredondando);
    TIPPT = (Proprio, Terceiro);
    TSexo = (Masculino, Feminino);
    TDiaSemana = (dsIndefinido, dsDomingo, dsSegunda, dsTerca, dsQuarta, dsQuinta, dsSexta, dsSabado);
    TStatusCTe = (stCTeDigitada, stCTeFinalizada, stCTeCancelada, stCTeProcessamento, stCTeTodas);
    TStatusMDFe = (stMDFeDigitada, stMDFeFinalizada, stMDFeCancelada, stMDFeProcessamento, stMDFeEncerrada, stMDFeTodas);
    TStatusDFe = (stDFeDigitado, stDFeFinalizado, stDFeCancelado, stDFeProcessamento, stDFeRejeitado);
    TStatusFinanceiroBoleto = (stOk, stSemFinanceiro, stSemParcela, stSemPedido, stNaoLiquidado);
    TStatusGNRE = (stGNREDigitada, stGNREFinalizada, stGNRECancelada, stGNREProcessamento, stGNREEncerrada, stGNRETodas);
    TTipoNFRef = (refNFe, refNF, refNFP, refCTe, refECF);
    TTipoDFe = (infNenhum, infNFe, infCTe, InfNFSe, infMDFe, infNFCe, infOutros);
    TStatusNFCe = (stNFCeDigitada, stNFCeFinalizada, stNFCeCancelada, stNFCeProcessamento, stNFCeContigencia);
    TTipoRequisicao = (trDep1, trDep2, trDep1Dep2, trAvaria, trVencidos, trArmazem, trIndefinido);
    TOperacaoCrud = (ocIncluir, ocAlterar, ocExcluir, ocConsultar, ocRecuperar);
    TTipoLancamento = (tlFinanceiro, tlManual, tlPedido, tlTicket);
    TTipoCaracteristicaAnimal = (tcaRaca, tcaEspecie, tcaPelagem, tcaIndefinido);
    TStatusTicket = (stAberto, stVisto, stFinalizado, stCancelado, stIndefinido);
    TTipoRastreabilidadeLote = (trlProducao, trlCompra, trlVenda, trlReqEntrada, trlReqSaida);
    TTipoDespesaReceitaConta = (tdrFixa, tdrVariavel, tdrInvestimento, tdrOperacional, tdrNaoOperacional, tdrIndefinido);
    TTipoCRUD = (tpcIncluir, tpcConsultar, tpcAlterar, tpcExcluir);
    TTipoMensagem = (tpInfo, tpErro, tpAtencao, tpSucesso);
    TCstType = (ctInvalid, ctICMS, ctIPI, ctPIS, ctCOFINS, ctDEVOLUCAO);

const
    ARQ_INI    = 'config.ini';
    CR         = #13#10;

    FALSO      = 0;
    VERDADEIRO = 1;

    ZERO       = 0;
    HUM        = 1;

    SUCESSO    = 0;

    EDT_SO_NUMERO = ['0'..'9', #8];

    MSG_CONFIRMAR               = 'Deseja Confirmar?';
    MSG_CONFIRMACAO             = 'Confirmado com sucesso!';
    MSG_REQUISICAO_CADASTRADA   = 'Requisi��o cadastrada com sucesso!';
    MSG_REMESSA_GERADA          = 'Remessa gerada com sucesso!';
    MSG_CANCELAR                = 'Confirma o cancelamento?';
    MSG_CANCELADO               = 'Cancelado com sucesso!';
    MSG_CANCELAR_REQUISICAO     = 'Confirma o cancelamento da requisi��o?';
    MSG_ENCERRAR                = 'Confirma o encerramento?';
    MSG_ATUALIZAR               = 'Confirma a atualiza��o do cadastro?';
    MSG_EXCLUIR                 = 'Confirma a exclus�o do cadastro?';
    MSG_EXCLUIR_PGTO            = 'Deseja excluir este pagamento?';
    MSG_ITEM_NA_LISTAX          = 'Item j� consta na lista.';
    MSG_ITEM_NAO_CONSTA_LISTA   = 'Item N�O consta na lista!';
    MSG_ITEM_NA_LISTA_ATUALIZAR = 'Item j� consta na lista. Deseja atualizar?';
    MSG_ITEM_NAO_PODE_ATUALIZAR = 'Pedido Finalizado, Item n�o pode ser atualizado!';
    MSG_REQUISITO_N_ATUALIZA    = 'Este requisito n�o pode ser atualizado!';
    MSG_IMAGEM_JA_CADASTRADA    = 'Imagem j� cadastrada!';
    MSG_NENHUMA_CONTA_INFORMADA = 'Nenhuma conta informada!';
    MSG_INFORMAR_FORNECEDOR     = 'Nenhum fornecedor informado!';
    MSG_INFORMAR_TIPO           = 'Nenhum tipo informado!';
    MSG_ESTOQUE_INSUFICIENTE    = 'Estoque insuficiente para esta opera��o!';
    MSG_NENHUM_ITEM_NA_LISTA    = 'Nenhum item consta na lista.';
    MSG_NENHUMA_PRESCRICAO      = 'N�o h� prescri��o para este Item!';
    MSG_MENOS_DE_15_CARACTERES  = 'Justificativa com menos de 15 caracteres!';
    MSG_FALTA_DADOS             = 'Preencha todos os dados essenciais!';
    MSG_NAO_ENCONTRADO          = 'Informa��o n�o encontrada!';
    MSG_ERRO_VENDEDOR           = 'Vendedor n�o Informado.';
    MSG_ERRO_CLIENTE            = 'Cliente n�o Informado.';
    MSG_ERRO_PLANO_PGTO         = 'Plano de Pagamento n�o Informado.';
    MSG_ERRO_QTD_ESTOQUE        = 'Quantidade maior do que a dispon�vel em estoque!';
    MSG_CANCELA_IMPRESSAO       = 'N�o existe informa��o para ser impressa.';
    MSG_NAO_EXCLUIR             = 'Exclus�o n�o permitida!';
    MSG_CONFIRMAR_IMPRESSAO     = 'Confirma a impress�o?';
    MSG_PARCELA_NAO_ENCONTRADA  = 'N�o existe(m) parcela(s) em aberto deste cliente!';
    MSG_NAO_CONFERE             = 'Quantidade n�o confere. Informe a quantidade novamente.';
    MSG_CONFIRMADO              = 'Produto j� confirmado.';
    MSG_REQUISICAO_CANCELADA    = 'Requisi��o j� cancelada!';
    MSG_REQUISICAO_N_CONFIRMADA = 'Requisi��o n�o foi confirmada!';
    MSG_REQUISICAO_N_CANCELA    = 'Requisi��o n�o pode ser cancelada!';
    MSG_NAO_ATUALIZAR           = 'Atualiza��o n�o permitida!';
    MSG_CODIGO_NAO_ENCONTRADO   = 'C�digo n�o encontrado. Verifique se o c�digo esta correto.';
    MSG_PRODUTO_NAO_ENCONTRADO  = 'Produto n�o encontrado!';
    MSG_IMPRIMIR_PROLABORE      = 'Imprimir a retirada do prolabore?';
    MSG_EXPORTAR                = 'Deseja realmente exportar o arquivo?';
    MSG_ATUALIZADO_SUCESSO      = 'Dados atualizados com sucesso.';
    MSG_ARQ_GERADO              = 'Arquivo gerado com sucesso.';
    MSG_JA_EXISTE               = 'C�digo j� existe.';
    MSG_ARQ_GERADO_ERRO         = 'Erro, problema ao gerar arquivo.';
    MSG_IMPRIMIR_RELATORIO      = 'Deseja imprimir relat�rio?';
    MSG_DESCONTO_NOTA_FISCAL    = 'Deseja dar desconto no valor total da nota?';
    MSG_VALOR_MAXIMO_DESCONTO   = 'O Maximo de Desconto � : ';
    MSG_MAXIMO_DESCONTO         = 'O Desconto Maximo � de: ';
    MSG_NAO_SELECIONADO         = 'Item n�o selecionado';
    MSG_NAO_ADICIONADO          = 'Item n�o Adicionado!';
    MSG_NAO_HA_DADOS            = 'N�o h� dados para este relatorio!';
    MSG_PRODUCAO_INICIADA       = 'Produ��o j� iniciada!';
    MSG_AVARIA_NAO_ENCONTRADA   = 'Produto n�o consta na lista de avaria.';
    MSG_QTD_AVARIA_ERROR        = 'Quantidade indicada n�o consta na lista de avaria.';
    MSG_CREDITO_INSUFICIENTE    = 'Limite de cr�dito insuficiente para compra';
    MSG_CONFIRMAR_ENTREGA       = 'Confirma a entrega?';
    MSG_NEGATIVAR_ENTREGA       = 'Confirma o retorno da entrega?';
    MSG_INATIVO                 = 'O cadastro est� inativo!';
    MSG_SENHA_ADMINISTRADOR     = 'Esta opera��o s� podera ser realizada mediante a senha do administrador! Deseja continuar?';
    MSG_SENHA_INVALIDA          = 'Senha inv�lida!';
    MSG_PEDIDO_FATURADO         = 'Pedido faturado com sucesso!';
    MSG_PEDIDO_JA_FATURADO      = 'Pedido j� faturado!';
    MSG_PEDIDO_CANCELADO        = 'Pedido foi cancelado!';
    MSG_PEDIDO_CANCELADO_NOTA   = 'Pedido e Nota foram cancelados!';
    MSG_PEDIDO_JA_CANCELADO_OU_FATURADO  = 'Pedido j� Cancelado ou Faturado!';
    MSG_COMPRA_JA_CANCELADA_OU_FATURADA  = 'Compra j� Cancelada ou Faturada!';
    MSG_PEDIDO_JA_CANCELADO_OU_DEVOLVIDO = 'Pedido j� Cancelado ou Devolvido!';
    MSG_PEDIDO_AINDA_NAO_FATURADO = 'Pedido ainda n�o faturado, corrija!';
    MSG_VALOR_INEXISTENTE       = 'Valor informado � inexistente!';
    MSG_VALOR_NEGATIVO          = 'O valor n�o pode ser negativo!';
    MSG_INFORME_VALOR           = 'Informe primeiro um valor de venda v�lido!';
    MSG_INFORME_VALOR_VALIDO    = 'Valor fora do limite. Informe valor v�lido!';
    MSG_NAO_CONSTA_NA_LISTA     = 'Informa��o n�o consta na lista.';
    MSG_SYS_BLOQ                = '(Erro 4004: SysBloq) Por favor, entrar em contato com o suporte do sistema!';
    MSG_CONFIRMA_GERAR_BOLETO   = 'Deseja realmete gerar este(s) boleto(s)?';
    MSG_BOLETO_JA_FOI_GERADO    = 'J� existe(m) boleto(s) para este documento.';
    MSG_USUARIO_SEM_PERMISSAO   = 'Usu�rio sem permiss�o para esta opera��o.';
    MSG_NENHUMA_ACAO_REALIZADA  = 'Nenhuma a��o realizada(TESTE)!';
    MSG_ERRO_CARREGAMENTO       = 'Nenhum dado carregado!';
    HINT_PROCURAR_CODIGO        = 'Digite o c�digo ou tecle F3 para procurar';
    HINT_PROCURAR_NUMERO        = 'Digite o numero ou tecle F3 para procurar';
    MSG_NADA_ALTERADO           = 'Nada foi alterado';
    MSG_NAO_CONFIGURADO         = 'A��o n�o configurada!';
    MSG_NOT_VALIDAR_LOTE        = 'N�o � possivel validar lote enquanto tiver notas na aba de Processamento.';
    MSG_NOT_TRANSMITIR_LOTE     = 'N�o � possivel transmitir lote enquanto tiver notas na aba de Processamento.';
    MSG_CONFIRMA_EXCLUSAO       = 'Deseja realmente excluir esta informa��o?';
    MSG_CONFIRMA_NAO_CADASTRO   = 'Tudo ser� perdido! Deseja realmente sair?';
    MSG_CONFIRMA_FATURAMENTO    = 'Deseja realmente faturar este pedido?';
    MSG_CONFIRMA_CANCELAMENTO   = 'Deseja cancelar?';
    MSG_CONFIRMA_EXTORNO        = 'Deseja realmente estornar o lan�amento?';
    MSG_CONFIRMA_DEVOLUCAO      = 'Deseja realmente devolver todos os itens?';
    MSG_CONFIRMA_REMOCAO        = 'Deseja realmente remover este item?';
    MSG_CONFIRMA_CLIENTE        = 'Deseja selecionar este cliente?';
    MSG_CONFIRMA_CADASTRO_REQ   = 'Deseja realizar esse procedimento?';
    MSG_CLONAR_OBJETO           = 'Deseja realmente clonar este cadastro?';
    MSG_FATURAR                 = 'Deseja faturar esta compra?';
    MSG_CANCELAR_COMPRA         = 'Deseja cancelar esta compra?';
    MSG_NOTA_DEVOLUCAO          = 'Deseja gerar nota de Devolu��o?';
    MSG_LISTA_DFE_VAZIA         = 'A lista de DF-es esta vazia!';
    MSG_LISTA_VAZIA             = 'A lista esta vazia!';
    MSG_DFE_NAO_SELECIONADO     = 'O tipo do DF-e n�o foi selecionado!';
    MSG_TROCAR_PLANO_PGTO       = 'Todos os itens ser�o recalculados com o desconto do novo plano de pagamento! Deseja continuar?';
    MSG_RECALCULAR_DESCONTO     = 'O desconto dos itens ser�o recalculados! Deseja continuar?';
    MSG_NFE_NAO_ENCONTRADA      = 'Nfe N�o Foi Encontrada!';
    MSG_NFE_JA_FOI_EMITIDA      = 'J� existe(m) nota(s) para este documento.';
    MSG_NFE_EMITIDA_POS_24H     = 'Nota(s) emitida a mais de 24h.';
    MSG_NFCE_EMITIDA_POS_1H     = 'Cupom Fiscal emitido a mais de 1h.';
    MSG_CAMPOS_NAO_PREENCHIDOS  = 'Campos n�o preechidos corretamente. Preencha todos os campos corretamente!';
    MSG_JUSTIFICATIVA           = 'A Justificativa n�o pode ter menos de 15 caracteres!';
    MSG_CONF_EMAIL_NAO_ENCONTRADA = 'Configura��o do e-mail n�o encontrada! Voc� deve parametrizar antes de continuar!';
    MSG_EMAIL_NAO_INFORMADO     = 'E-mail do destinat�rio n�o informado!';
    MSG_EMAIL_ENVIADO_SUCESSO   = 'E-mail enviado com sucesso!';
    MSG_XML_EXPORTADO_CAMINHO   = 'Encaminhado para:';
    MSG_EXCEL_IMPORTADO_SUCESSO = 'Dados do Excel importados com sucesso!';
    MSG_INFORMACAO_CADASTRADA   = 'Informa��o cadastrada com sucesso!';
    MSG_BOLETO_GERADO_SUCESSO   = 'Boleto(s) gerado(s) com sucesso!';
    MSG_NOTA_GERADA_SUCESSO     = 'Nota(s) gerado(s) com sucesso!';
    MSG_PEDIDO_NAO_FATURADO     = 'Pedido ainda n�o foi faturado!';
    MSG_ESCOLHA_UM_ITEM         = 'Voc� deve escolher um item na lista!';
    MSG_ESCOLHA_CONFIG_BOLETO   = 'Voc� deve escolher uma config. de boleto!';
    MSG_CAIXA_ABERTO            = 'O Caixa Esta Aberto! Deseja fechar o Caixa?';
    MSG_CAIXA_FECHADO           = 'O Caixa Esta Fechado! Deseja Abrir o Caixa?';
    MSG_CONSULTA_SEM_DADOS      = 'N�o h� dados nesta consulta!';
    MSG_LANCAMENTO_INVALIDO     = 'O Caixa Esta Fechado!';
    MSG_ERRO_CONTA_NAO_INFORMADA = 'Conta n�o informada!';
    MSG_ERRO_NAT_NAO_INFORMADA  = 'Natureza Opera��o n�o informada!';
    MSG_ERRO_VALOR_IGUAL_ZERO   = 'O Valor n�o pode ser igual a 0!';
    MSG_ERRO_VALOR_INVALIDO     = 'Total n�o pode ser 0 ou Negativo!';
    MSG_ERRO_ACRESCIMO_VALOR    = 'Proibido o acrescimo do valor Inicial do Item!  $';
    MSG_ERRO_CPF_CNPJ_INVALIDO  = 'CPF ou CNPJ inv�lido!';
    MSG_ERRO_IE_INVALIDO        = 'Incri��o Estadual inv�lida!';
    MSG_ERRO_ID_USADO           = 'Id/C�digo j� usado!';
    MSG_ERRO_CEP_INVALIDO       = 'CEP inv�lido!';
    MSG_ERRO_EMAIL_INVALIDO     = 'E-mail inv�lido!';
    MSG_ERRO_CONTA_INVALIDA     = 'Conta Invalida! N�o est� no Plano de Pagamento!';
    MSG_ERRO_CONTA_JA_INFORMADA = 'Conta j� informada!';
    MSG_ERRO_CONTA_INVALIDA_VALOR_ZERO = 'Conta Invalida! Use uma conta informada no plano de pagamento ou valor diferente de 0!';
    MSG_ERRO_FALTA_VALOR_PAGTO  = 'Esta faltando valor para completar o pagamento!';
    MSG_ERRO_VALOR_MAIOR_TOTAL  = 'Valor pago maior do que o Total a Pagar!';
    MSG_ERRO_SENHA_NAO_CONFERE  = 'A segunda senha n�o confere com a primeira!';
    MSG_ERRO_IMAGEM             = 'Arquivo de imagem n�o encontrado!';
    MSG_CNPJ_DIFERENTE          = 'CNPJ da NFE difere do CNPJ da empresa!';
    MSG_ERRO_SEM_MOTIVO         = 'Motivo n�o preenchido!!';
    MSG_ERRO_LANCANTO_ESTORNADO = 'Op��o bloqueada! O lan�amento j� foi estornado!!';
    MSG_ERRO_INFORME_MOTIVO     = 'Voc� deve informar o motivo!';
    MSG_ERRO_MOTIVO_CURTO       = 'Motivo muito curto!';
    MSG_SAIR                    = 'Deseja Realmente Sair?';
    MSG_ERRO_GTIN_INVALIDO      = 'C�digo de Barras / GTIN inv�lido!';
    MSG_ERRO_NCM_INVALIDO       = 'Codigo NCM Invalido!';
    MSG_ERRO_CST_INVALIDO       = 'CST inv�lido!';
    MSG_ERRO_PERCENTUAL_INVALIDO = 'Percentual inv�lido!';
    MSG_ERRO_STATUS_INCLUIR     = 'Erro Status do pedido diferente de Incluir!';
    MSG_CONFIRMA_CADASTRO       = 'Item Cadastrado com Sucesso!';

    MT_ERRO        = 'Erro';
    MT_ALERTA      = 'Alerta';
    MT_INFORMACAO  = 'Informa��o';
    MT_CONFIRMACAO = 'Confirma��o';

    SB_ADICIONAR = '+';
    SB_REMOVER   = '-';

    NULL_INTEGER  = -1;
    NULL_STRING   = '';
    NULL_DATETIME = 0;

    POS_NAO_ENCONTRADA = -1;

    TAMANHO_CPF = 11;

    RPT_NOVA_PAGINA = 4;

    //Constantes do TEF
    INTPOS_001       = 'Intpos.001';
    REQ_INTPOS_001   = 'C:\TEF_DIAL\REQ\Intpos.001';
    RESP_INTPOS_001  = 'C:\TEF_DIAL\RESP\Intpos.001';

    //Path Retornor MapaResumo
    PATH_RETORNO_ECF = 'C:\Retorno.txt';

    UM_MINUTO = 0.000695;

    ACERTO_PARCIAL    = 0;
    DEVOLUCAO_TOTAL   = 1;
    FALTA_TOTAL       = 2;
    AVARIA_TOTAL      = 3;

    CONTRA_BARRA      = '\';

    DELIMITADOR       = '|';


   //Boleto
   ENTRADA_CONFIRMADA = 02;
   ENTRADA_REJEITADA = 03;
   LIQUIDACAO = 06;
   BAIXA = 09;
   TARIFA_MANUTENCAO = 28;
   INSTRUCAO_REJEITADA = 26;
   REMESSA_CARTORIO = 23;
   ALTERACAO_VENCIMENTO = 14;
   RETIRADA_CARTORIO = 24;
   LIQUIDACAO_POS_BAIXA = 17;
   BAIXADO_CONFORME_INST_AGENCIA = 10;

   VALOR_MAX_INTEIRO = 2147483647;
   VALOR_MIN_INTEIRO = -2147483647; 
   KEY_ENTER = #13;
   KEY_TAB = #0;
   KEY_ESC = #27;
   KEY_F12 = #123; //#134
   TAMANHO_LISTA_MOTIVO_ACERTO = 27;

   //Impressora de etiqueta ELGIN
   BPLB_OK                = 0;      //sucesso
   BPLB_COMERROR          = -1;     //erro de comunicacao
   BPLB_PARAERROR         = -2;     //erro de parametro
   BPLB_FILEOPENERROR     = -3;     //erro ao abrir o arquivo
   BPLB_FILEREADERROR     = -4;     //erro ao ler o arquivo
   BPLB_FILEWRITEERROR    = -5;     //erro ao escrever o arquivo
   BPLB_FILEERROR         = -6;     //arquivo de fonte nao legivel
   BPLB_NUMBEROVER        = -7;     //o tamanho dos dados e maior que o da configuracao
   BPLB_IMAGETYPEERROR    = -8;     //format da imagem invalido
   BPLB_DRIVERERROR       = -9;     //erro de driver
   BPLB_LOADDLLERROR      = -10;    //erro no carregamento do arquivo de dll
   BPLB_LOADFUNCTIONERROR = -11;    //erro no carregamento da funcao de dll
   BPLB_READINIFILEERROR  = -12;    //erro ao ler o arquivo de inicializacao
   BPLB_TIMEOUTERROR      = -13;    //erro no tempo

   COM_PORT         = 0;
   LPT_PORT         = 1;
   NIBBLE_PORT      = 2;
   USB_API_PORT     = 3;
   USB_CLASS_PORT   = 4;
   DRIVER_PORT      = 5;
   CHAVE_ATIVACAO   = '115566NF';
   MIL = 1000;
   CEM = 100;
   SEM_GTIN = 'SEM GTIN';

   COR_FOCO = $00BFFFFF;
   COR_NOT_NULL = $007090FF;

   DFE_TODOS = 6;
   TP_NFE = 'NFE';
   TP_CTE = 'CTE';

   F1    = 112;
   F2    = 113;
   F3    = 114;
   F12   = 123;
   ESC   = 27;
   T1    = 49;
   T2    = 50;

   CST_ICMS: array[0..9] of string = ('00', '10', '20', '30', '40', '41', '50', '51', '60', '70');
   CST_IPI: array[0..9] of string = ('00', '01', '02', '03', '04', '05', '49', '50', '51', '99');
   CST_PIS_COFINS: array[0..10] of string = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '99');

implementation

end.
