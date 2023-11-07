/*
No banco de dados Concessionaria, extraia os seguintes SELECTs:

1. Na tabela Veículo, encontre a média (com casas decimais) para todos 
os valores de veículos que foram comprados entre os anos de 2003 e 2006.
*/
select * from Veiculo

select avg(valor) as Media from Veiculo where year(dataCompra) between 2003 and 2006


/*
2. Utilizando funções de arredondamento, faça com que a média encontrada na query anterior tenha (executar um SELECT por vez para cada uma das 
--  solicitações abaixo) :
2a. Tenha duas casas decimais
2b.  Seja truncado para o inteiro menor que a média encontrada
2c.  Seja truncado para o inteiro maior que a média encontrada
*/
select avg(valor) as Media from Veiculo where year(dataCompra) between 2003 and 2006

select avg(valor) as Media 
		, round(avg(valor), 2) as Media2a 
		, floor(avg(valor)) as Media2b
		, ceiling(avg(valor)) as Media2b
from Veiculo 
where year(dataCompra) between 2003 and 2006




/*
3. Faça um SELECT que traga a data de compra no formato de nosso idioma, ou seja, DD/MM/YYYY.
*/
select dataCompra, convert(varchar(10), dataCompra, 103) as 'Data Formato Brasil' from Veiculo


/*
4. Na tabela de VendasAnuais, faça a soma das quantidades 
   para cada mês ímpar do ano de 2004.
*/
select * from VendasAnuais
select * from Ano
select * from Mes


select  Ano, Mes
		, sum(qtd) as 'Soma das Quantidades'
from	VendasAnuais as VA	inner join Ano as A on VA.idAnodaVenda = A.idAno
							inner join Mes as M on VA.idMesdaVenda = M.idMes
where	Ano = 2004
		and Mes in (1, 3, 5, 7, 9, 11) -- Mes % 2 = 1
group by Ano, Mes


select  sum(qtd) as 'Soma das Quantidades'
from	VendasAnuais as VA	inner join Ano as A on VA.idAnodaVenda = A.idAno
							inner join Mes as M on VA.idMesdaVenda = M.idMes
where	Ano = 2004
		and Mes in (1, 3, 5, 7, 9, 11) -- Mes % 2 = 1




/*
5. Faça uma query similar a anterior, trazendo agora a soma das quantidades para cada ano 
e trimestre.
*/
select  Ano
		, case
				when Mes between 1 and 3 then '1o. Trimestre'
				when Mes between 4 and 6 then '2o. Trimestre'
				when Mes between 7 and 9 then '3o. Trimestre'
				when Mes between 10 and 12 then '4o. Trimestre'
			end
			as Trimestre
		, sum(qtd) as 'Soma das Quantidades'
from	VendasAnuais as VA	inner join Ano as A on VA.idAnodaVenda = A.idAno
							inner join Mes as M on VA.idMesdaVenda = M.idMes
group by Ano
		, case
				when Mes between 1 and 3 then '1o. Trimestre'
				when Mes between 4 and 6 then '2o. Trimestre'
				when Mes between 7 and 9 then '3o. Trimestre'
				when Mes between 10 and 12 then '4o. Trimestre'
			end
order by ano, Trimestre
