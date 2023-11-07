----------------------------------------------------------------------------------------------------------------
-- Demonstração de View
----------------------------------------------------------------------------------------------------------------
-- Criação e Execução de Views
select top 10 * from Sales.Orders
select top 10 * from Sales.Customers
select top 10 * from Sales.OrderDetails
select top 10 * from Production.Products

-- drop view RetornarPedidoCliente
create view RetornarPedidoCliente
as
select	O.orderid as 'Fatura'
		, O.orderdate as 'Data do Pedido'
		, C.contactname as 'Nome do Cliente'
		, P.productname as 'Produto'
		, OD.qty as 'Quantidade'
		, OD.unitprice 'Valor por Unidade'
		, (OD.qty * OD.unitprice) as 'Total do Produto'
from	Sales.Orders as O inner join Sales.Customers as C on O.custid = C.custid
						  inner join Sales.OrderDetails as OD on O.orderid = OD.orderid			
						  inner join Production.Products as P on OD.productid = P.productid
go

select * from sys.views

select * from RetornarPedidoCliente where [Total do Produto] >= 1000


sp_helptext RetornarPedidoCliente
----------------------------------------------------------------------------------------------------------------














----------------------------------------------------------------------------------------------------------------
-- Demonstração de Função Escalar
----------------------------------------------------------------------------------------------------------------
-- drop function dbo.RegresoDeLosMeses

create function dbo.RegresoDeLosMeses (@mes tinyint)
returns varchar(20)
as
begin
	declare @RegresoDeLosMeses varchar(20)

	-- Preencher variável somente se o dia estiver correto
	select @RegresoDeLosMeses = case	@mes
										when 1 then 'Enero'
										when 2 then 'Febrero'
										when 3 then 'Marzo'
										when 4 then 'Abril'
										when 5 then 'Mayo'
										when 6 then 'Junio'
										when 7 then 'Julio'
										when 8 then 'Agosto'
										when 9 then 'Septiembre'
										when 10 then 'Octubre'
										when 11 then 'Noviembre'
										when 12 then 'Diciembre'
								end

	return @RegresoDeLosMeses
end
go

	
select 	dbo.RegresoDeLosMeses(month(getdate()))

select 	dbo.RegresoDeLosMeses(1), dbo.RegresoDeLosMeses(12)
---------------------------------------------------------------------------------------------------------------
















----------------------------------------------------------------------------------------------------------------
-- Demonstração de Função Tabular
----------------------------------------------------------------------------------------------------------------

--------------------------------------------
-- INLINE TABLE-VALUED FUNCTION
--------------------------------------------
-- Drop function dbo.RetornarInfoPedido
create function dbo.RetornarInfoPedido (@orderId as smallint)
returns table
as
return
(
	select	O.orderid as 'Número do Pedido'
			, O.orderdate as 'Data'
			, C.contactname as 'Cliente'
			, P.productname as 'Produto'
			, OD.qty as 'Quantidade'
			, OD.unitprice as 'Valor do Produto'
	from	Sales.Orders as O 	inner join Sales.OrderDetails as OD on O.orderid = OD.orderid
								inner join Production.Products as P on OD.productid = P.productid
								inner join Sales.Customers as C on O.custid = C.custid
	where	O.orderId = @orderId
)
go

select top 10 * from Sales.Orders

select * from dbo.RetornarInfoPedido(10255)
--------------------------------------------




















----------------------------------------------------------------------------------------------------------------
-- Demonstração de Procedure
----------------------------------------------------------------------------------------------------------------
-- Drop table VeiculoGlobal 
create table VeiculoGlobal 	(idVeiculo tinyint primary key, Veiculo varchar(20), Fabricante varchar(20), Modelo varchar(20), Compra date)
select * from VeiculoGlobal

-- drop procedure dbo.TesteTemporaria
-----------------------------------------------------------------------------------------------------
-- Descrição: Para ambiente de testes, cria uma tabela temporária baseada nos veículos que tiveram 
--			  compra dentro da faixa de datas fornecidas	
-- Parâmetros: @dataCompraInicial - Obrigatório, representa início da faixa de datas para a compra
--			   @dataCompraFinal - Opcional, representa o final do período de compra	
-- Criador:		Sand Onofre						Data: 20150308
-- Alterações:	Sand Onofre						Data: 20200509

-- Exemplo de uso: exec TesteTemporaria '20130101', NULL
-----------------------------------------------------------------------------------------------------
create procedure dbo.TesteTemporaria @dataCompraInicial date, @dataCompraFinal date 
as
begin
	-- Eliminando informações anteriores
	truncate table VeiculoGlobal

	--Inserir na tabela temporária com Informações necessárias para teste
	insert	VeiculoGlobal (idVeiculo, Veiculo, Fabricante, Modelo, Compra)
	select	V.idVeiculo, V.descricao, F.nome, M.descricao, v.dataCompra  
	from	Veiculo as V inner join Fabricante as F on V.idFabricante = F.idFabricante
						 inner join Modelo as M on V.idModelo = M.idModelo
	where	V.datacompra between @dataCompraInicial and @dataCompraFinal
end
go

select * from Veiculo

exec dbo.TesteTemporaria '20100101', '20120101'

select * from VeiculoGlobal

select * from sys.procedures
sp_helptext 'TesteTemporaria'

drop table VeiculoGlobal

---------------------------------------------------------------------------------------------------------------
