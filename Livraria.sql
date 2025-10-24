CREATE DATABASE Livraria
GO
USE Livraria

CREATE TABLE Livro(
	codigo					integer			NOT NULL			IDENTITY(100001, 100),
	IDAutor					integer			NOT NULL,
	nome					varchar(200)	NOT NULL			UNIQUE,
	lingua					varchar(10)		NOT NULL			DEFAULT('PT-BR'),
	ano						integer			NOT NULL			CHECK(ano < 1990)
	PRIMARY KEY(codigo)
);

CREATE TABLE Livro_Autor(
	LivroCodigo				integer,
	AutorID_Autor			integer,
	CONSTRAINT PK_Livro_Autor PRIMARY KEY (LivroCodigo, AutorID_Autor),
	FOREIGN KEY(LivroCodigo) REFERENCES Livro(codigo),
	FOREIGN KEY(AutorID_Autor) REFERENCES Autor(ID_Autor)
);

CREATE TABLE Autor(
	ID_Autor				integer								IDENTITY(2351, 1),
	CodigoLivro				integer,
	nome					varchar(100)						UNIQUE,
	data_nasc				date,
	pais_nasc				varchar(50)							CHECK(pais_nasc = 'Brasil' OR pais_nasc = 'Estados Unidos' OR pais_nasc = 'Inglaterra' OR pais_nasc = 'Alemanha'),
	biografia				varchar(255)
	PRIMARY KEY(ID_Autor)
);


CREATE TABLE Editora(
	ID_Editora				integer								IDENTITY(491,16),
	nome					varchar(70)							UNIQUE,
	telefone				varchar(10)							CHECK(LEN(telefone) != 10),
	logradoura_endereco		varchar(200),
	numero_endereco			integer								CHECK(numero_endereco <= 0),
	cep_endereco			char(8)								CHECK(LEN(cep_endereco) != 8),
	complemento_endereço	varchar(255)
	PRIMARY KEY(ID_Editora)
);

CREATE TABLE Edicao(
	ISBN					char(13)							CHECK(LEN(ISBN) != 13),
	preco					decimal(4,2)						CHECK(preco <= 0),
	ano						integer								CHECK(ano < 1993),
	numero_paginas			integer								CHECK(numero_paginas < 15),
	qtd_estoque				integer,
	PRIMARY KEY(ISBN)

);
