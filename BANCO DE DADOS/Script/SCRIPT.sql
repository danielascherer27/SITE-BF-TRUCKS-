CREATE TABLE Marca (
  idMarca INTEGER  NOT NULL  ,
  NomeMarca VARCHAR(45)  NOT NULL  ,
  StatusMarca VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idMarca));


CREATE TABLE Grupo (
  idGrupo INTEGER  NOT NULL  ,
  NomeGrupo VARCHAR(45)  NOT NULL  ,
  StatusGrupo VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idGrupo));


CREATE TABLE Estado (
  idEstado INTEGER  NOT NULL  ,
  NomeEstado VARCHAR(45)  NOT NULL  ,
  SiglaEstado CHAR(2)  NOT NULL  ,
  StatusEstado VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idEstado));


CREATE TABLE Cidade (
  idCidade INTEGER  NOT NULL  ,
  idEstado INTEGER  NOT NULL  ,
  NomeCidade VARCHAR(45)  NOT NULL  ,
  StatusCidade VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idCidade)  ,
INDEX Cidade_FKIndex2(idEstado),
  FOREIGN KEY(idEstado)
    REFERENCES Estado(idEstado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Fornecedor (
  idFornecedor INTEGER  NOT NULL  ,
  idCidade INTEGER  NOT NULL  ,
  NomeFornecedor VARCHAR(45)  NOT NULL  ,
  CEP VARCHAR(15)  NOT NULL  ,
  Endereco VARCHAR(45)  NOT NULL  ,
  Email VARCHAR(30)  NOT NULL  ,
  Telefone VARCHAR(15)  NOT NULL  ,
  CNPJ VARCHAR(20)  NOT NULL  ,
  IE VARCHAR(15)  NOT NULL  ,
  StatusFornecedor VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idFornecedor)  ,
INDEX Fornecedor_FKIndex1(idCidade),
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Produto (
  idProduto INTEGER  NOT NULL  ,
  idGrupo INTEGER  NOT NULL  ,
  idMarca INTEGER  NOT NULL  ,
  NomeProduto VARCHAR(45)  NOT NULL  ,
  ImagemProduto BLOB  NOT NULL  ,
  DescricaoProduto VARCHAR(45)  NOT NULL  ,
  QTD INTEGER  NOT NULL  ,
  PrecoCusto FLOAT  NULL  ,
  PrecoVenda FLOAT  NULL  ,
  PercentualLucro FLOAT  NULL  ,
  AnoFabricacao    INTEGER  NULL  ,
  StatusProduto VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idProduto)  ,
INDEX Produto_FKIndex2(idGrupo)  ,
INDEX Produto_FKIndex3(idMarca),
  FOREIGN KEY(idGrupo)
    REFERENCES Grupo(idGrupo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idMarca)
    REFERENCES Marca(idMarca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Funcionario (
  idFuncionario INTEGER  NOT NULL  ,
  idCidade INTEGER  NOT NULL  ,
  NomeFuncionario VARCHAR(45)  NOT NULL  ,
  CEP VARCHAR(15)  NOT NULL  ,
  Endereco VARCHAR(45)  NOT NULL  ,
  Email VARCHAR(30)  NOT NULL  ,
  Telefone VARCHAR(15)  NOT NULL  ,
  CPF VARCHAR(15)  NOT NULL  ,
  RG VARCHAR(20)  NULL  ,
  DataNascimento DATE  NOT NULL  ,
  Sexo CHAR(1)  NOT NULL  ,
  Escolaridade VARCHAR(20)  NULL  ,
  EstadoCivil VARCHAR(20)  NULL  ,
  Salario FLOAT  NULL  ,
  StatusFuncionario VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idFuncionario)  ,
INDEX Funcionario_FKIndex1(idCidade),
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Cliente (
  idCliente INTEGER  NOT NULL  ,
  idCidade INTEGER  NOT NULL  ,
  NomeCliente VARCHAR(45)  NOT NULL  ,
  CEP VARCHAR(15)  NOT NULL  ,
  Endereco VARCHAR(45)  NOT NULL  ,
  Email VARCHAR(30)  NOT NULL  ,
  Telefone VARCHAR(15)  NOT NULL  ,
  CPF VARCHAR(15)  NOT NULL  ,
  RG VARCHAR(15)  NULL  ,
  DataNascimento DATE  NOT NULL  ,
  Sexo CHAR(1)  NOT NULL  ,
  Renda FLOAT  NULL  ,
  EstadoCivil VARCHAR(20)  NULL  ,
  StatusCliente VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idCliente)  ,
INDEX Cliente_FKIndex1(idCidade),
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Descarte (
  idDescarte INTEGER  NOT NULL  ,
  idProduto INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  MotivoDescarte VARCHAR(75)  NOT NULL  ,
  DataDescarte DATE  NOT NULL  ,
  QTDDescarte INTEGER  NOT NULL    ,
PRIMARY KEY(idDescarte)  ,
INDEX Descarte_FKIndex1(idFuncionario)  ,
INDEX Descarte_FKIndex2(idProduto),
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idProduto)
    REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Login (
  idLogin INTEGER  NOT NULL  ,
  idCliente INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  UsarioLogin VARCHAR(20)  NOT NULL  ,
  SenhaLogin VARCHAR(6)  NOT NULL  ,
  StatusLogin VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idLogin)  ,
INDEX Login_FKIndex1(idCliente)  ,
INDEX Login_FKIndex2(idFuncionario),
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Pedido (
  idPedido INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  idCliente INTEGER  NOT NULL  ,
  idFornecedor INTEGER  NOT NULL  ,
  DataPedido DATE  NOT NULL  ,
  HoraPedido FLOAT  NOT NULL  ,
  TipoPedido VARCHAR(20)  NOT NULL  ,
  ValorPedido FLOAT  NOT NULL  ,
  StatusPedido VARCHAR(12)  NOT NULL    ,
PRIMARY KEY(idPedido)  ,
INDEX Pedido_FKIndex1(idCliente)  ,
INDEX Pedido_FKIndex2(idFornecedor)  ,
INDEX Pedido_FKIndex3(idFuncionario),
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idFornecedor)
    REFERENCES Fornecedor(idFornecedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ContaAPagar (
  idContaAPagar INTEGER  NOT NULL  ,
  idPedido INTEGER  NOT NULL  ,
  DataContaAPagar DATE  NOT NULL  ,
  HoraContaAPagar FLOAT  NOT NULL  ,
  ValorContasPagar FLOAT  NOT NULL  ,
  QTDContaAPagar     INTEGER  NOT NULL  ,
  StatusContaAPagar VARCHAR(8)  NOT NULL    ,
PRIMARY KEY(idContaAPagar)  ,
INDEX ContasAPagar_FKIndex1(idPedido),
  FOREIGN KEY(idPedido)
    REFERENCES Pedido(idPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ContaAReceber (
  idContaAReceber INTEGER  NOT NULL  ,
  idPedido INTEGER  NOT NULL  ,
  DataContaReceber DATE  NOT NULL  ,
  HoraContaReceber FLOAT  NOT NULL  ,
  TipoContaReceber VARCHAR(15)  NOT NULL  ,
  ValorContaReceber FLOAT  NOT NULL  ,
  QTDContaReceber INTEGER  NOT NULL  ,
  StatusContaReceber VARCHAR(8)  NOT NULL    ,
PRIMARY KEY(idContaAReceber)  ,
INDEX ContasAReceber_FKIndex1(idPedido),
  FOREIGN KEY(idPedido)
    REFERENCES Pedido(idPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ItemPedido (
  idItemPedido INTEGER  NOT NULL  ,
  idProduto INTEGER  NOT NULL  ,
  idPedido INTEGER  NOT NULL  ,
  ValorItemPedido FLOAT  NOT NULL  ,
  QTDItemPedido INTEGER  NOT NULL  ,
  TotalItemPedido FLOAT  NOT NULL    ,
PRIMARY KEY(idItemPedido)  ,
INDEX ItemPedido_FKIndex1(idPedido)  ,
INDEX ItemPedido_FKIndex2(idProduto),
  FOREIGN KEY(idPedido)
    REFERENCES Pedido(idPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idProduto)
    REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ParcelaAPagar (
  idParcelaAPagar INTEGER  NOT NULL  ,
  idContaAPagar INTEGER  NOT NULL  ,
  NumeroParcelaAPagar FLOAT  NOT NULL  ,
  ValorParcelaAPagar FLOAT  NOT NULL  ,
  DataVencimentoParcelaAPagar DATE  NOT NULL  ,
  StatusParcelaAPagar VARCHAR(8)  NOT NULL    ,
PRIMARY KEY(idParcelaAPagar)  ,
INDEX ParcelaAPagar_FKIndex1(idContaAPagar),
  FOREIGN KEY(idContaAPagar)
    REFERENCES ContaAPagar(idContaAPagar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ParcelaAReceber (
  idParcelaAReceber INTEGER  NOT NULL  ,
  idContaAReceber INTEGER  NOT NULL  ,
  NumeroParcelaAReceber INTEGER  NOT NULL  ,
  ValorParcelaAReceber FLOAT  NOT NULL  ,
  DataVencimentoParcelaAReceber DATE  NOT NULL  ,
  StatusParcelaAReceber VARCHAR(8)  NOT NULL    ,
PRIMARY KEY(idParcelaAReceber)  ,
INDEX ParcelaAReceber_FKIndex1(idContaAReceber),
  FOREIGN KEY(idContaAReceber)
    REFERENCES ContaAReceber(idContaAReceber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Recebimento (
  idRecebimento INTEGER  NOT NULL  ,
  idParcelaAReceber INTEGER  NOT NULL  ,
  DataRecebimento DATE  NOT NULL  ,
  ValorRecebimento FLOAT  NOT NULL  ,
  JurosRecebimento FLOAT  NULL  ,
  DescontoRecebimento FLOAT  NULL  ,
  ValorFinalRecebimento FLOAT  NOT NULL    ,
PRIMARY KEY(idRecebimento)  ,
INDEX Recebimento_FKIndex1(idParcelaAReceber),
  FOREIGN KEY(idParcelaAReceber)
    REFERENCES ParcelaAReceber(idParcelaAReceber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Pagamento (
  idPagamento INTEGER  NOT NULL  ,
  idParcelaAPagar INTEGER  NOT NULL  ,
  DataPagamento DATE  NOT NULL  ,
  ValorPagamento FLOAT  NOT NULL  ,
  JurosPagamento FLOAT  NULL  ,
  DescontoPagamento FLOAT  NULL  ,
  ValorFinalPagamento FLOAT  NOT NULL    ,
PRIMARY KEY(idPagamento)  ,
INDEX Pagamento_FKIndex1(idParcelaAPagar),
  FOREIGN KEY(idParcelaAPagar)
    REFERENCES ParcelaAPagar(idParcelaAPagar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE MovimentoDeCaixa (
  idMovimentoDeCaixa INTEGER  NOT NULL  ,
  idRecebimento INTEGER  NOT NULL  ,
  idPagamento INTEGER  NOT NULL  ,
  Descricao VARCHAR(45)  NOT NULL  ,
  DataAbertura DATE  NOT NULL  ,
  DataFechamento DATE  NOT NULL  ,
  ValorEntrada FLOAT  NOT NULL  ,
  ValorSaida FLOAT  NOT NULL  ,
  SaldoCaixa FLOAT  NOT NULL  ,
  StatusCaixa VARCHAR(7)  NOT NULL    ,
PRIMARY KEY(idMovimentoDeCaixa, idRecebimento)  ,
INDEX MovimentoDeCaixa_FKIndex1(idRecebimento)  ,
INDEX MovimentoDeCaixa_FKIndex2(idPagamento),
  FOREIGN KEY(idRecebimento)
    REFERENCES Recebimento(idRecebimento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idPagamento)
    REFERENCES Pagamento(idPagamento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



