-- Utilizando Funções de agregação, solucione as seguintes questões:
select *  from VendasAnuais 

-- 1. Qual o número de registros existentes na tabela VendasAnuais ?
select count(*) as 'Qtd registros' from VendasAnuais -- 1332


-- 2. Qual o acumulado da quantidade de vendas Totais até o momento  ?
select top 10 * from VendasAnuais

select sum(qtd) as 'Acumulado da Quantidade de Vendas' from VendasAnuais -- 664794


-- 3. Quais as quantidades de vendas Totais até o momento para: 
-- menor venda, média de vendas e a maior venda ?
select	min(qtd) as 'Menor Qtd Vendida', avg(qtd) as 'Média de Qtd Vendida', max(qtd) as 'Maior Qtd Vendida' 
from	VendasAnuais -- 1496999


-- 4. Extraia a soma das vendas anuais por ano em ordem descendente
select top 10 * from VendasAnuais
select * from Ano

select	Ano, sum(qtd) as 'Soma das Quantidades Vendidas' 
from	VendasAnuais inner join Ano on idAno = idAnodaVenda
group by Ano
order by ano desc -- 664794 / 664794

select 16801
+ 22505
+ 29274
+ 36308
+ 57101
+ 62946
+ 66007
+ 98668
+ 119411
+ 155773


-- 5. Traga a soma das vendas anuais para o 
-- veículo/modelo CG 125 STD 
-- (as informações do veículo devem constar na query)
select top 3 * from VendasAnuais
select top 300 * from Veiculo -- idVeiculo1
select top 10 * from Modelo


select	descricao as 'Descrição do Veículo', idModelo, sum(qtd) as 'Soma das quantidades Vendidas' 
from	VendasAnuais as VA inner join Veiculo as V on VA.idVeiculo = V.idVeiculo
where	descricao = 'CG 125' and idModelo = 7
group by descricao, idModelo


select	V.descricao as 'Descrição do Veículo'
		, M.descricao as 'Descrição do Modelo'
		, sum(qtd) as 'Total de quantidade Vendida' 
from	VendasAnuais as VA	inner join Veiculo as V on VA.idVeiculo = V.idVeiculo
							inner join Modelo as M on V.idModelo = M.idModelo
where	V.descricao = 'CG 125' and M.descricao = 'STD'
group by V.descricao, M.descricao



-- 6.Traga as primeiras datas (ANOS) de FABRICAÇÃO de todos os veículos e modelos, 
--ordenados pelo nome do fabricante (ascendente), ano (descendente), 
--Veículo (ascendente) e Modelo (descendente). Toda as informações solicitadas, inclusive ordenação, devem constar na query.
select top 1 * from Veiculo
select top 1 * from Ano
select top 1 * from Modelo
select top 1 * from Fabricante

select	F.nome as 'Nome do Fabricante'
		, V.descricao as 'Descrição do Veículo'
		, M.descricao as 'Descrição do Modelo'
		, min(A.ano) as 'Menor Ano/Data Fabricacao'
from	Veiculo as V	inner join Ano as A on V.idAnoFabricacao = A.idAno
						inner join Modelo as M on V.idModelo = M.idModelo
						inner join Fabricante as F on F.idFabricante = V.idFabricante
group by F.nome 
		, V.descricao
		, M.descricao
order by F.nome asc
		, min(A.ano) desc
		, V.descricao asc
		, M.descricao desc


-- 7. Extraia a menor, maior, média e o total de vendas de cada mês no 
--  ano de 2000, em ordem ascendente.
select * from VendasAnuais
select * from Ano
select * from Mes

select	Ano
		, Mes
		, min(qtd) as 'Menor quantidade Vendida' 
		, avg(qtd) as 'Média de quantidade Vendida' 
		, max(qtd) as 'Maior quantidade Vendida' 
		, sum(qtd) as 'Total de Vendas'
from	VendasAnuais	inner join Ano on idAno = idAnodaVenda
						inner join Mes on idMesdaVenda = idMes
where	Ano = 2000
group by Ano
		, Mes
order by Ano asc
		, Mes


-- 8. Retorne a mesma consulta anterior, mas somente os 
-- registros que tiverem média de vendas superior a 500.
select	Ano
		, Mes
		, min(qtd) as 'Menor quantidade Vendida' 
		, avg(qtd) as 'Média de quantidade Vendida' 
		, max(qtd) as 'Maior quantidade Vendida' 
from	VendasAnuais inner join Ano on idAno = idAnodaVenda
					inner join Mes on idMesdaVenda = idMes
where	Ano = 2000
group by Ano
		, Mes
having avg(qtd) > 500
order by Ano
		, Mes