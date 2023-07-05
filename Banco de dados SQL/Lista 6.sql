select count(*) as 'Número total de clientes'
from clientes;

#Exercicio 2

Select avg(preco) as 'média faturado'
from  produtos;

# Ex 6
Select round(min(preco),2) as menor, round(max(preco),2) as maior
from produtos;
#Ex 7 (Corrigir)

SELECT round(min(stock),0) as menor_quant_stock, round(max(stock),0) as maior_quant_stock, round (avg(stock),0) as media_qt_stock
FROM produtos
where idcategoria='33';

#Ex 8
select sum(l.subtotal) as 'total faturado em janeiro de 2018'
from linhasvenda l inner join produtos p on (l.idproduto=p.idproduto)
					inner join vendas v on l.idvenda=v.idvenda
where p.descricao like '%tinteiro%'
and date_format(v.datavenda, '%Y-%m')  like'2018-01';

#Ex 10

Select idcategoria, count(*) as 'número total de produtos'
from produtos
group by idcategoria
order by count(*) DESC;

#Ex 11
select c.designacao, count(*) as 'Número total de produtos'
from produtos p inner join categorias c on p.idcategoria=c.idcategoria
GROUP BY c.designacao
order by count(*) desc;

#Ex 12

select c.designacao, sum(stock) as 'quant em stock'
from produtos p inner join categorias c on p.idcategoria=c.idcategoria
GROUP BY c.designacao
order by sum(stock) desc; 

#Ex 13
select c.designacao, sum(quantidade) as 'quant de produtos'
from produtos p inner join categorias c on p.idcategoria=c.idcategoria
		inner join linhasvenda l on l.idproduto=p.idproduto
GROUP BY c.designacao
order by sum(quantidade) desc;

#Ex 14
select c.designacao, sum(quantidade) as 'quant de venda'
from produtos p inner join categorias c on p.idcategoria=c.idcategoria
				inner join linhasvenda l on l.idproduto=p.idproduto
GROUP BY c.designacao
HAVING sum(quantidade) >300;

#EX 15

SELECT sum(l.subtotal) as 'total faturado'
FROM produtos p inner join categorias c on p.idcategoria=c.idcategoria
				inner join linhasvenda l on l.idproduto=p.idproduto
WHERE c.designacao='Portátil'

