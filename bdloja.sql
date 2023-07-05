# Ex 1
SELECT c.designacao as "Categoria", p.descricao as "Produtos", c.idcategoria as "CatID", p.idcategoria as "ProdCatID", p.stock
FROM produtos p INNER JOIN categorias c ON p.idcategoria=c.idcategoria
order by p.stock DESC;

# Ex 2
SELECT c.designacao as "Categoria", p.descricao as "Produtos", c.idcategoria as "CatID", p.idcategoria as "ProdCatID", p.stock
FROM produtos p INNER JOIN categorias c ON p.idcategoria=c.idcategoria
Where p.descricao like '%multimedia%'
order by p.stock asc;

#Ex 3 
SELECT c.nome, c.idcliente as CliID, v.idcliente as VdCliID, v.datavenda, v.total, v.idvenda
from vendas v inner join clientes c ON v.idcliente=c.idcliente
where c.idcliente=80;

#Ex 4

SELECT l.idvenda, l.idproduto as lvProdID, p.idproduto as ProdID, p.descricao, l.precounitario, l.quantidade, l.subtotal
from linhasvenda l inner join produtos p on l.idproduto=p.idproduto
where l.idvenda=136;

#Ex 5

SELECT l.idvenda, l.idproduto as lvProdID, p.idproduto as ProdID, p.descricao, l.precounitario, l.quantidade, l.subtotal
from linhasvenda l inner join produtos p on l.idproduto=p.idproduto
where l.idvenda=180;

#Ex 6

SELECT l.idvenda, l.idproduto as lvProdID, p.idproduto as ProdID, p.descricao, l.precounitario, l.quantidade, l.subtotal
from linhasvenda l inner join produtos p on l.idproduto=p.idproduto
where l.idvenda=180 and precounitario > 100;