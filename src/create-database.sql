CREATE DATABASE [graph-db]
GO

USE [graph-db];
GO

CREATE TABLE ofac (
    id INT PRIMARY KEY,
    name VARCHAR(255)
) AS NODE;
GO

CREATE TABLE names_verify (
    id INT PRIMARY KEY,
    name VARCHAR(255)
) AS NODE;
GO

CREATE TABLE ofac_match (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ofac_node_id INT REFERENCES ofac(id),
    names_verify_node_id INT REFERENCES names_verify(id),
    data_verify DATETIME,
    score FLOAT
) AS EDGE;
GO

INSERT INTO ofac (id, name)
VALUES (1, 'João Silva'),
       (2, 'Maria Santos'),
       (3, 'José Almeida'),
       (4, 'Fulano de Tal'),
       (5, 'Ciclano da Silva');

-- Inserindo dados na tabela nomes_verificar
INSERT INTO names_verify (id, name)
VALUES (1, 'João Sillva'),
       (2, 'José Almeiida'),
       (3, 'Beltrano Perera');
GO




