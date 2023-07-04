select l.idproduto, p.idproduto, p.descricao, AS c.designacao, l.precounitario
from linhasvenda l inner join produtos p on lidproduto=p.idproduto
					inner join categorias c on p.idcategoria=p.idproduto;
                    
##########################################################################

#EX 11

select p.descricao, p.idproduto,l.idproduto
from produtos p left join linhasvenda l on l.idproduto=p.idproduto
where l.idproduto is null
order by p.descricao asc;

#Ex 12

select c.nome as Nome, ifnull(v.idcliente, '<Sem Compras>') as ESTADO
from clientes c left join vendas v on c.idcliente=v.idcliente
where v.idcliente is NULL
order by nome asc;

#Ex 12 Resolução 2 
select c.nome as Nome, ifnull(v.idcliente, '<Sem Compras>') as ESTADO
from vendas v right join clientes c on v.idcliente=c.idcliente
where v.idcliente is NULL
order by nome asc;
# EX 13
select cl.idcategoria, cl.designacao, cl.idcategoriapai, c2.designacao
from categorias cl left join categorias c2 on cl.idcategoria=c2.idcategoria;

#Ex 13 resolução sem valores null na idcategoriapai
select cl.idcategoria, cl.designacao, cl.idcategoriapai, c2.idcategoria, c2.designacao
from categorias cl join categorias c2 on (cl.idcategoria=c2.idcategoria);












