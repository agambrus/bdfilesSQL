/*1*/
select * from cidade as c where c.populacao > 1000 AND  c.siglaEstado = 'MG' order by c.nome ASC;

/*2*/
select * from funcionario as f
where month(f.dataNascimento) in (12) and f.nome like "D%";

/*3*/
SELECT f.nome, f.sexo, f.dataContratacao from funcionario as f
where year(f.dataContratacao) between 2000 and 2010 order by f.dataContratacao DESC;

/*4*/
SELECT * FROM funcionario as f where month(f.dataNascimento) not in (1) and month(f.dataNascimento) not in (7);

/*5*/
select * from funcionario as f where f.nome not like "D%" order by f.nome asc;
 
/*6*/ 
select * from funcionario as f where isnull(f.dataDemissao) order by f.salario desc limit 5; 

/*7*/
select departamento.codDepartamento, departamento.codFuncionarioGerente, departamento.descricao, funcionario.nome from departamento inner join Funcionario on departamento.codFuncionarioGerente = funcionario.codFuncionario order by descricao asc;

/*8*/
select f.nome, f.sexo, f.salario, f.codCidadeNasceu, f.codCidadeMora from funcionario as f where f.codCidadeMora != f.codCidadeNasceu order by f.nome asc;

/*9*/
select distinct funcionario.nome from funcionario 
	inner join projetofuncionario on funcionario.codFuncionario = projetofuncionario.codFuncionario;

/*10*/    
select distinct funcionario.nome from funcionario
	inner join departamento on funcionario.codFuncionario = departamento.codFuncionarioGerente
    inner join projetofuncionario on funcionario.codFuncionario = projetofuncionario.codFuncionario;

/*11*/    
select funcionario.nome, projeto.descricao, valorHora, cargaHoraria, (valorHora * cargahoraria) as Bonus from funcionario 
    inner join projetofuncionario on funcionario.codFuncionario = projetofuncionario.codFuncionario
    inner join projeto on projetofuncionario.codProjeto = projeto.codProjeto
    where (valorHora * cargaHoraria > 9000) order by funcionario.nome;

/*12*/
select *, timestampdiff(YEAR, funcionario.dataNascimento, '2024-08-02') as idade from funcionario 
