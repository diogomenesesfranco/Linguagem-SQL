
create table Modelo
(
	idModelo tinyint identity (1,1)
	,Descricao varchar(50) not null
	,constraint pk_modelo primary key (idModelo)
);
go

create table Fabricante
(
	idFabricante tinyint identity (1,1)
	,Nome varchar(50) not null
	,Cidade varchar(50) not null
	,Endereco varchar(100) null
	,UF char(2) null
	,Telefone char(20)null
	,Contato varchar(50) not null
	,constraint pk_fabricante primary key (idFabricante)
);
go

create table Ano
(
	idAno tinyint identity(1,1)
	,Ano smallint not null
	,constraint pk_ano primary key (idAno)
);
go

create table Mes
(
	idMes tinyint identity(15,3)
	,Mes tinyint not null
	,constraint pk_mes primary key (idMes)
);

create table Veiculo
(
	idVeiculo smallint identity(1,1)
	,Descricao varchar(50) not null
	,Valor decimal(9,2) not null
	,dataCompra date not null
	,idModelo tinyint null
	,idFabricante tinyint null
	,idAnoFabricacao tinyint null
	,constraint pk_Veiculo primary key (idVeiculo)
	,constraint fkVeiculo_Modelo foreign key (idModelo) references Modelo(idModelo)
	,constraint fkVeiculo_Fabricante foreign key (idFabricante) references Fabricante(idFabricante)
	,constraint fkVeiculo_AnoFabricacao  foreign key (idAnoFabricacao) references Ano(idAno)
);
go

create table VendasAnuais
(
	idVendas smallint identity(1,1)
	,Qtd smallint not null
	,idVeiculo smallint null
	,idAnoVenda tinyint null
	,idMesdaVenda tinyint null
	,constraint pk_VendasAnuais primary key (idVendas)
	,constraint fkVendasAnuais_Veiculo foreign key (idVeiculo) references Veiculo(idVeiculo)
	,constraint fkVendasAnuais_AnoVenda foreign key (idAnoVenda) references Ano(idAno)
	,constraint fkVendasAnuais_MesdaVenda foreign key (idMesdaVenda) references Mes(idMes)
);
go

select * from Fabricante
select * from Modelo
select * from Ano
select * from Mes
select * from VendasAnuais
select * from Veiculo
select * from Ano