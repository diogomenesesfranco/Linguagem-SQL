-- Funções de Agregação: AVG, MIN, MAX
select * from Sales.Orders;

select AVG(shipaddress) from Sales.Orders 
select MIN(shipaddress), MAX(shipaddress) from Sales.Orders 

select * from Sales.OrderDetails;

SELECT 	AVG(unitprice) AS avg_price, 
		MIN(qty)AS min_qty, 
		MAX(discount) AS max_discount
FROM	Sales.OrderDetails;


-- Funções de Agregação e DISTINCT: COUNT
select * from Sales.Orders order by custid

SELECT  COUNT(custid) AS all_custs,
	    COUNT(DISTINCT custid) AS unique_custs
FROM	Sales.Orders

select	count(*) NúmeroDeLinhas
		, count(shippeddate) NúmeroDeLinhasColunaComNulos 
from	Sales.Orders


select	min(freight) minFrete, max(freight) maxFrete, avg(freight) medFrete
		, count(*) qtdFrete 
from	Sales.Orders 
where	year(orderdate) = 2006


select * from Sales.OrderDetails;

select	SUM(unitPrice) Soma, AVG(unitPrice) Média, COUNT(*) NumRegistros, 
		MIN(unitPrice) Mínimo, MAX(unitPrice) Máximo
from	Sales.OrderDetails



-----------------------------------------------------------------------
-- NULLs são ignorados pelas funções
-----------------------------------------------------------------------
-- drop table TB_NULL
CREATE TABLE TB_NULL
(
	ID tinyint identity(1,1),
	Valor smallmoney,
	Desconto smallmoney
)
insert TB_NULL VALUES (10, 5)
insert TB_NULL VALUES (null, 10)
insert TB_NULL VALUES (20, null)
insert TB_NULL VALUES (20, null)
insert TB_NULL VALUES (null, null)
insert TB_NULL VALUES (6, 1)

select ID, Valor, Desconto from TB_NULL

SELECT SUM(VALOR), count(valor), count(*), SUM(VALOR)/count(*) * 1.0 from TB_NULL



select	COUNT(valor) QTD_Valor, 
		COUNT(Desconto) QTD_Desconto, 
		COUNT(*) QTD_LinhasTabela 
from	TB_NULL 

select	AVG(valor) as [Média do Valor], 
		AVG(ISNULL(Valor, 0)) as [Média Correta do Valor], 
		COUNT(*) as QTD_LinhasTabela 
from	TB_NULL 

drop table TB_NULL
-----------------------------------------------------------------------




-----------------------------------------------------------------------
-- GROUP BY - Filtrando a consulta por agrupamento
-----------------------------------------------------------------------
select * from Sales.Orders
select * from Sales.OrderDetails

select	OrderID, MAX(unitPrice) 
from	Sales.OrderDetails
group by OrderID


select * from Sales.OrderDetails

select	OrderID
		, MAX(unitPrice) 'MAX do Pedido'
		, COUNT(*) Qtd_Produtos 
from	Sales.OrderDetails
group by OrderID


select * from Sales.OrderDetails

select	OrderID
		, SUM(unitPrice * qty) 'Total por Pedido'
from	Sales.OrderDetails
group by OrderID


select * from Sales.OrderDetails

select	ProductID
		, SUM(qty) 'QTD do Produto'
		,  SUM(unitPrice * qty) 'Total por Pedido'
from	Sales.OrderDetails
group by ProductID
order by 'Total por Pedido' desc
		, SUM(qty) desc


-- Group by
select * from Sales.Orders

select	year(orderdate) as Ano, min(freight) minFrete, max(freight) maxFrete, count(*) qtdFrete 
from	Sales.Orders 
group by year(orderdate)
order by minFrete


select	year(orderdate) as Ano, month(orderdate) as Mes, min(freight) minFrete, max(freight) maxFrete, count(*) qtdFrete 
from	Sales.Orders 
group by year(orderdate), month(orderdate)
order by Ano, Mes
-----------------------------------------------------------------------




-----------------------------------------------------------------------
-- HAVING - Filtrando a consulta por agrupamento
-----------------------------------------------------------------------
select	ProductID
		, SUM(Qty) 'QTD do Produto'
		,  SUM(unitPrice * qty) 'Total por Pedido'
from	Sales.OrderDetails
group by ProductID
having	SUM(Qty) >= 1000
order by SUM(unitPrice * qty) desc, SUM(qty) desc


select * from Sales.Orders
select * from Sales.Customers

SELECT	c.contactname as 'Nome do Contato'
		, COUNT(*) AS 'Qtd de Pedidos'
FROM	Sales.Customers AS c JOIN Sales.Orders AS o ON c.custid = o.custid
GROUP BY c.contactname
HAVING COUNT(*) > 3;

select * from Sales.OrderDetails
select * from Production.Products

SELECT	p.productname as 'Nome do Produto Vendido'
		, sum(qty) AS 'Quantidade Total de Unidades Vendidas'
FROM	Production.Products AS p JOIN Sales.OrderDetails  AS od ON p.productid = od.productid
WHERE	p.productname like 'Product A%' or p.productname like 'Product B%'
GROUP BY p.productname
HAVING	sum(qty) >= 600
ORDER BY 'Quantidade Total de Unidades Vendidas' desc
-----------------------------------------------------------------------