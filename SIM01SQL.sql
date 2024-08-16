/*1*/
select T.descricao as Turma, T.dia, T.horario, Pe.cpf, Pe.nome as Professor from turma as T
	inner join professor as P on P.codPessoa = T.codPessoa
    inner join pessoa as Pe on Pe.codPessoa = T.codPessoa
    where P.codPessoa = Pe.codPessoa
    group by T.descricao
    order by T.descricao;

/*2*/
select Pe.CPF,Pe.nome as Professor, Po.dataContratacao, count(A.codPessoa) as "Quantidade de alunos" from pessoa as Pe
    inner join aluno as A on A.codPessoa = Pe.codPessoa
	inner join professor as Po on Po.codPessoa = A.codPessoaProfessor
    group by A.codPessoaProfessor;
    
/*3*/
select distinct Pe.cpf, Pe.nome, Al.dataMatricula from pessoa as Pe
	inner join aluno as Al on Al.codPessoa = Pe.codPessoa
    inner join mensalidade as Me on Me.codPessoa = Al.codPessoa
    where Me.dataPagamento is null and Me.dataVencimento < now()
    group by Al.codPessoa
    having count(Al.codPessoa) > 1
    order by Al.codPessoa; 
    
/*4*/
select month(Me.dataPagamento) as Mes, year(Me.dataPagamento) as Ano, 
count(Me.codMensalidade) as Quantidade, sum(Me.valor) as Total from mensalidade as Me
where Me.dataPagamento is not null
group by month(Me.dataPagamento), year(Me.dataPagamento)
order by month(Me.dataPagamento) desc, year(Me.dataPagamento) desc;    
/*---------------------------------------------------------------------------------------------------------*/    
SELECT MONTH(dataVencimento) AS Mes, YEAR(dataVencimento) AS Ano, COUNT(codMensalidade) AS Quantidade,
SUM(valor) AS Total
FROM Mensalidade
WHERE
dataPagamento IS NOT NULL
GROUP BY MONTH(dataVencimento), YEAR(dataVencimento)
ORDER BY YEAR(dataVencimento), MONTH(dataVencimento);

/*5*/
alter table avaliacao add column IMC numeric(9,2);
update avaliacao 
set IMC = peso / (altura*altura) where altura > 0 and peso is not null and altura is not null;
    
/*6*/
select T.descricao, T.dia, T.horario, Md.descricao, T.vagas, count(Al.codPessoa) as "QTDA de alunos" from turma as T
	inner join modalidade as Md on Md.codModalidade = T.codModalidade
    inner join turmaaluno as Al on Al.codTurma = T.codTurma
	group by Al.codTurma;
        
/*7*/
select Me.dataVencimento, Me.dataPagamento, Me.valor as "Valor Pago" from mensalidade as Me
			where Me.dataPagamento > Me.dataVencimento
            group by Me.codMensalidade
            order by Me.codMensalidade;

/*8*/
select Pe.CPF, Pe.nome, MAX(Av.dataAvaliacao), Av.peso, Av.altura from avaliacao as Av
	inner join pessoa as Pe on Pe.codPessoa = Av.codPessoa
    inner join aluno as Al on Al.codPessoa = Pe.codPessoa
    group by Pe.codPessoa
    order by Pe.nome;
    

        
        