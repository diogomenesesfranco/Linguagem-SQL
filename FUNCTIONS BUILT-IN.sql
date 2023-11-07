-----------------------------------------------------------------------------------------------------
-- DEMONSTRAÇÃO FUNCTIONS BUILT-IN I 
-----------------------------------------------------------------------------------------------------

-- SUBSTRING
select substring('Sistemas de Informação', 13, 10) as Extrai

declare @texto as varchar(30) = 'Covid-19'
select substring(@texto, 1, 5), substring(@texto, 7, 2) as PartCity


-- LEFT / RIGHT
select	Cidade
		, left(cidade, 3) as Left3Cidade
		, right(cidade, 3) as Right3Cidade
		, substring(cidade, 1, 5) as Subst5Cidade 
from	Fabricante

-- UPPER / LOWER
select Cidade, lower(cidade) as LowerCidade, upper(cidade) as UpperCidade from Fabricante

-- RTRIM e LTRIM
select	'       Sistemas    de    Informação      ' as Texto_Original
		, rtrim('       Sistemas    de    Informação      ') as Retira_Espacos_Direita
		, ltrim('       Sistemas    de    Informação      ') as Retira_Espacos_Esquerda
		, rtrim(ltrim('       Sistemas    de    Informação      ')) as Retira_Espacos_Esquerda




-- SPACE, REPLICATE, REVERSE
select	idFabricante , Cidade, UF, Contato
		, cidade + space(5) + UF as ColunaComSpace
		, replicate(idFabricante, 9) as ColunaComReplicate
		, reverse(contato) as ColunaComReverse
from	Fabricante


-- CHARINDEX e LEN
select	contato
		, charindex(' ', contato) as [Posição do Espaço] 
		, charindex('H', contato) as [Posição do H] 
		, len(contato) as [Número de Caractere]
from	Fabricante




-- CASE (1a. e 2a. forma)
select	UF
		, case UF	
				when 'SP' then 'Região Sudeste'
				when 'RJ' then 'Região Sudeste'
				when 'ES' then 'Região Sudeste'
				when 'MG' then 'Região Sudeste'
				when 'SC' then 'Região Sul'
				when 'RS' then 'Região Sul'
				when 'PR' then 'Região Sul'
				else 'Demais Regiões' 
			end as Case1aForma
		, case 	
				when UF in ('SP', 'RJ', 'ES', 'MG') then 'Região Sudeste'
				when UF in ('SC', 'RS', 'PR') then 'Região Sul'
				else 'Demais Regiões' 
			end as Case2aForma
from	Fabricante
-----------------------------------------------------------------------------------------------------