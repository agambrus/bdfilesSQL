create schema joaopedro;

CREATE TABLE Exemplar(
	numero INT,
    situacao VARCHAR(225),
    codigo INT,
    PRIMARY KEY(numero)    
);

CREATE TABLE Emprestimo(
	dataRetirada DATE,
    dataDevolucao DATE,
    id INT,
    codigoAl INT,
    numero INT,
    PRIMARY KEY(id)
);

CREATE TABLE Aluno(
	codigoAl INT,
    nome VARCHAR(255),
    dataNascimento DATE,
    PRIMARY KEY(codigoAl)
);

CREATE TABLE Telefone(
	codigoAl INT,
    telefone INT,
    PRIMARY KEY(telefone)
);

CREATE TABLE Livro(
	codigo INT,
    descricao VARCHAR(300),
    ISBN INT,
    PRIMARY KEY(codigo)
);

ALTER TABLE Exemplar ADD FOREIGN KEY(codigo) REFERENCES Livro(codigo);
ALTER TABLE Emprestimo ADD FOREIGN KEY(codigoAl) REFERENCES Aluno(codigoAl);
ALTER TABLE Emprestimo ADD FOREIGN KEY(numero) REFERENCES Exemplar(numero);
ALTER TABLE Telefone ADD FOREIGN KEY(codigoAl) REFERENCES Aluno(codigoAl);

INSERT INTO Exemplar(numero,situacao,codigo) VALUES (01,"EMPRESTADO",123456);
INSERT INTO Exemplar(numero,situacao,codigo) VALUES (02,"EMPRESTADO",123789);
INSERT INTO Exemplar(numero,situacao,codigo) VALUES (03,"ESTOCADO",789456);
INSERT INTO Exemplar(numero,situacao,codigo) VALUES (04,"VENCIDO",456789);

SELECT * FROM Exemplar;
INSERT INTO emprestimo(dataRetirada,dataDevolucao,id,codigoAl,numero) VALUES ("2023-06-07","2023-11-08",1205489,0147,01);
INSERT INTO emprestimo(dataRetirada,dataDevolucao,id,codigoAl,numero) VALUES ("2023-06-07","2013-06-09",1205478,0258,02);
INSERT INTO emprestimo(dataRetirada,dataDevolucao,id,codigoAl,numero) VALUES ("1995-06-07","1996-05-11",1205463,0369,03);
INSERT INTO emprestimo(dataRetirada,dataDevolucao,id,codigoAl,numero) VALUES ("2023-06-07","2023-07-27",1205454,0741,04);

select * from Aluno;
INSERT INTO Aluno(codigoAl,nome,dataNascimento) VALUES (0147,"BEUTRANO DA SILVA","2002-06-07");
INSERT INTO Aluno(codigoAl,nome,dataNascimento) VALUES (0258,"CICLANO DA SILVA","2001-06-07");
INSERT INTO Aluno(codigoAl,nome,dataNascimento) VALUES (0369,"NOTRANO DA SILVA","2012-06-07");
INSERT INTO Aluno(codigoAl,nome,dataNascimento) VALUES (0741,"DEUTRANO DA SILVA","2005-06-07");

select * from Livro;
INSERT INTO Livro(codigo,descricao,ISBN) VALUES (123456,"Mortes",012345678900);
INSERT INTO Livro(codigo,descricao,ISBN) VALUES (123789,"Mortes mais",098765432100);
INSERT INTO Livro(codigo,descricao,ISBN) VALUES (789456,"Morreu demais",014725836900);
INSERT INTO Livro(codigo,descricao,ISBN) VALUES (456789,"Chacina no parquinho",096385274100);

select * from telefone; 


