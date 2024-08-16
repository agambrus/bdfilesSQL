/*1*/
select C.sexo ,count(C.codCliente) as cliente from cliente as C  group by C.sexo;

/*2*/
select max(timestampdiff(year, C.dataNascimento, curdate())) as idade from cliente as C; 

/*3*/
select C.siglaEstado, count(P.codCliente) as qtda from cidade as C  
	inner join cliente as P on P.codCidade = C.codCidade
    group by C.siglaEstado;
    
/*4*/
select date_format(C.dataNascimento, "%b") as Mes, count(date_format(C.dataNascimento, "%b")) as Soma from cliente as C group by month(C.dataNascimento);

/*5*/
select C.nome, C.siglaEstado, count(P.codCliente) as qtda from cidade as C  
	inner join cliente as P on P.codCidade = C.codCidade
	group by C.codCidade; 
    
/*6*/
select date_format(C.dataNascimento, "%M") as Mes, count(*) as Quantidade from cliente as C where month(curdate()) = month(C.dataNascimento) group by C.dataNascimento;

/*7*/
select C.cpf as CPF, C.nome as Cliente, sum(NTP.quantidade) as "Qtda de produtos" from cliente as C 
	inner join notafiscal as NT on NT.codCliente = C.codCliente
    inner join notafiscalproduto as NTP on NTP.codNotaFiscal = NT.codNotaFiscal
    where NT.codCliente = C.codCliente
    group by C.codCliente
    order by sum(NTP.quantidade) desc;
    
/*8*/
select month(NT.dataEmissao) as Mes, sum(NTP.valor * NTP.quantidade) as "Valor Total" from notafiscal as NT 
		inner join notafiscalproduto as NTP on NTP.codNotaFiscal = NT.codNotaFiscal
        where NTP.codNotaFiscal = NT.codNotaFiscal
        group by month(NT.dataEmissao)
        order by month(Nt.dataEmissao) asc;
        
/*9*/
select CAT.descricao as Categoria, sum(NTP.quantidade * NTP.valor) as "Valor Total" from categoria as CAT
	inner join produto as P on P.codCategoria = CAT.codCategoria
    inner join notafiscalproduto as NTP on NTP.codProduto = P.codProduto
    where CAT.codCategoria = P.codCategoria
    group by CAT.codCategoria
    order by CAT.codCategoria;
    
/*10*/   
select P.descricao as Produto, sum(NTP.quantidade * NTP.valor) as "Valor Total" from produto as P
		inner join notafiscalproduto as NTP on NTP.codProduto = P.codProduto
        group by P.descricao
        having sum(NTP.quantidade * NTP.valor) > 9000
        order by sum(NTP.quantidade * NTP.valor) desc;
        
/*11*/
select * from notafiscalproduto;
select P.descricao, sum(NTP.quantidade) as Quantidade from produto as P
		inner join notafiscalproduto as NTP on NTP.codProduto = P.codProduto
        where NTP.codProduto = P.codProduto
		group by P.descricao
		order by sum(NTP.quantidade) desc limit 2;
        
/*12*/
select monthname((C.dataNascimento)), count(month(C.dataNascimento)) as total from cliente as C
		group by month(C.dataNascimento)
		having count(month(C.dataNascimento)) > 1
		order by month(C.dataNascimento) asc; 
            
 SET GLOBAL sql_mode = (SELECT REPLACE(@@GLOBAL.sql_mode, 'ONLY_FULL_GROUP_BY', ''));       
    