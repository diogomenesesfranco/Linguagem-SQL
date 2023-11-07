-----------------------------------------------------------------------------------------------------
-- DEMONSTRAÇÃO FUNCTIONS BUILT-IN II 
-----------------------------------------------------------------------------------------------------

-- DATA
select getdate()

select year(getdate()) as 'Ano', month(getdate()) as 'Mês', day(getdate()) as 'Dia'

select datepart(yy, getdate()) as 'Ano', datepart(mm, getdate()) as 'Mês', datepart(dd, getdate()) as 'Dia'
select datepart(week, getdate()) as 'Semana', datepart(dayofyear, getdate()) as 'Dia do Ano'


select datediff(dd, '20200501', getdate()) as DiffDias, datediff(hour, '20200501', getdate()) as DiffHoras

select dateadd(dd, 1, getdate()) as Amanhã, dateadd(yy, -10 , getdate()) as '10 anos atrás'





-- NUMÉRICAS
select	abs(1), abs(-1)

select rand(), power(5, 7), sqrt(24.99)

select ceiling(25), ceiling(25.1), ceiling(25.9)
select ceiling(-25), ceiling(-25.1), ceiling(-25.9)

select floor(25), floor(25.1), floor(25.9)
select floor(-25), floor(-25.1), floor(-25.9)

select round(748.58, 0) as r0, round(748.58, 1) as r1, round(748.58, 2) as r2
select round(748.58, -1) as rm1, round(748.58, -2) as rm2





-- CONVERSÃO
select 10 + 'Maria' -- Erro de conversão

select cast(10 as varchar(2)) + 'Maria' 
select convert(varchar(2), 10) + 'Maria' 

select cast(getdate() as varchar(20)) 
select convert(varchar(20), getdate()) 

select convert(varchar(20), getdate(), 103) -- Formato Britânico/Francês
select convert(varchar(20), getdate(), 112) -- Formato ISO