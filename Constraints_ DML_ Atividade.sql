------------------------------------------------------------------------------------------------------------------
-- Com a base criada, execute as seguintes modificações:
------------------------------------------------------------------------------------------------------------------

--1. Altere as colunas DESCRICAO para um campo variável de 30 caracteres, obrigatório.
sp_help Veiculo
sp_help Modelo

alter table Veiculo alter column Descricao varchar(30) not null
alter table Modelo alter column Descricao varchar(30) not null

--2. Insira o campo string variável de tamanho 20, de nome StatusVeiculo na tabela Veiculo.
alter table Veiculo add StatusVeiculo varchar(20)
select * from Veiculo

--3. Elimine a coluna CONTATO da tabela Fabricante.
alter table Fabricante drop column Contato
select * from Fabricante

--4. Altere a tabela Veiculo para que a coluna StatusVeiculo tenha como valor padrão o texto ATIVO.
alter table Veiculo add constraint dfVeiculoStatus default 'Ativo' for StatusVeiculo 

--5. Altere a tabela Vendas Anuais para que a coluna QTD aceite valores entre 1 e 10000.
select * from VendasAnuais where qtd not between 1 and 10000

delete from VendasAnuais where qtd not between 1 and 10000

alter table VendasAnuais add constraint ckVendasAnuaisQtd check (qtd between 1 and 10000)

--6. Insira os anos de 2016 até o ano corrente na tabela Ano.
select * from Ano
insert into Ano (ano) values (2016), (2017), (2018), (2019), (2020), (2021), (2022)        

--7. Insira os modelos LST, KS e RS na tabela Modelo
select * from Modelo
insert into Modelo (descricao) values ('LST'), ('KS'), ('RS') -- 10, 11, 12

--8. Altere a tabela Mes, adicionando a coluna descricaoMes, de texto variável capaz de caber a 
--   maior das descrições dos meses. Em seguida os meses na respectiva tabela
select * from Mes
select len('fevereiro') -- 9

alter table Mes add descricaoMes varchar(9)

--9. Atualize a tabela Mês, colocando as descrições respectivas na coluna criada, de acordo com o valor do mês que é apresentado na coluna mês.
Insert Mes (mes) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12) 

update Mes set descricaoMes = 'Janeiro' where mes = 1
update Mes set descricaoMes = 'Fevereiro' where mes = 2
update Mes set descricaoMes = 'Março' where mes = 3
update Mes set descricaoMes = 'Abril' where mes = 4
update Mes set descricaoMes = 'Maio' where mes = 5
update Mes set descricaoMes = 'Junho' where mes = 6
update Mes set descricaoMes = 'Julho' where mes = 7
update Mes set descricaoMes = 'Agosto' where mes = 8
update Mes set descricaoMes = 'Setembro' where mes = 9
update Mes set descricaoMes = 'Outubro' where mes = 10
update Mes set descricaoMes = 'Novembro' where mes = 11
update Mes set descricaoMes = 'Dezembro' where mes = 12


--10. Insira ao menos 3 Fabricantes (Triumph, KTM e Kymco) com informações reais para os campos da tabela
select * from Fabricante

insert into Fabricante (Nome, endereco, cidade, UF, telefone) values
  ('Triumph', 'Rua Celta, 125', 'Sao Paulo', 'ES', '36454128')
, ('KTM', 'Rua Juí, 20', 'Sao Paulo', 'SP', '44456200')
, ('Kymco', 'Av. Delta, 150', 'Rio de Janeiro', 'RJ', '77785511') 
-- 10, 11, 12

--11. Insira ao menos 3 registros (Tiger Explorer, ECX 450, Dowtown) na Tabela Veículo, 
--    com valores reais para os campos de valor, dataCompra e variando as informações de modelo, 
--    ano e Fabricante com os INSERTS que foram feitos anteriormente.
select * from Veiculo

-- Modelo ('LST'), ('KS'), ('RS') -- 10, 11, 12
-- Fabricante Triumph, KTM e Kynco -- 10, 11, 12
insert into Veiculo (descricao, valor, dataCompra, idModelo, idFabricante, idAnoFabricacao) values
('Tiger Explorer', 53488, '20191020', 10, 10, 20)
, ('ECX 450', 45899, '20190901', 11, 11, 20)
, ('Downtown', 22650, '20190820', 12, 12, 20)

-- 112, 113, 114
--12. Para cada Veiculo inserido, insira ao menos 2 registros na tabela VendasAnuais 
-- para o Ano e Veículo inseridos, variando o mês e qtd.
select * from Veiculo
select * from VendasAnuais
select * from Ano
select * from Mes

insert VendasAnuais (qtd, idVeiculo, idAnodaVenda, idMesdaVenda) values
(102, 112, 17, 15), (87, 112, 17, 18)
, (90, 113, 18, 15), (48, 113, 18, 18)
, (235, 114, 19, 24), (3, 114, 19, 21)
-- 6666
-- 6667
-- 6668
-- 6669
-- 6670
-- 6671

--13. Atualize o modelo LST para GTX
select * from Modelo where idModelo = 10
update Modelo set Descricao = 'GTX' where idModelo = 10
-- ou
update Modelo set Descricao = 'GTX' where Descricao = 'LST'

--14. Escolha um dos veículos inseridos e monte a sequência de comandos para eliminar o registro (mais de uma tabela), de forma que 
--    o banco de dados não gere erro na deleção.
select * from Veiculo where idVeiculo = 113 -- ECX 450
select * from VendasAnuais where idVeiculo = 113

delete from VendasAnuais where idVendas in (1336, 1337) 
delete from Veiculo where idVeiculo = 557
