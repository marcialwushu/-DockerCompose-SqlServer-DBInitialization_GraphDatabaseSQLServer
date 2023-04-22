CREATE DATABASE [graph-db]
GO

USE [graph-db];
GO

CREATE TABLE ofac (
    id INT PRIMARY KEY,
    name VARCHAR(255)
) AS NODE;
GO


CREATE TABLE dbo.ofac_match (start_date DATE) AS EDGE;

GO

INSERT INTO ofac (id, name)
VALUES (1, 'João Silva'),
       (2, 'Maria Santos'),
       (3, 'José Almeida'),
       (4, 'Fulano de Tal'),
       (5, 'Ciclano da Silva'),
       (6, 'João Sillva'),
       (7, 'Joao'),
       (8, 'Silva'),
       (9, 'Fulano'),
       (10, 'de Tal');
       
       

-- Inserindo dados na tabela nomes_verificar
INSERT INTO names_verify (id, name)
VALUES (1, 'João Sillva'),
       (2, 'José Almeiida'),
       (3, 'Beltrano Perera');
GO

INSERT INTO dbo.ofac_match VALUES ((SELECT $node_id FROM [dbo].[ofac] WHERE [name] = 'João Silva'),
       (SELECT $node_id FROM [dbo].[ofac] WHERE [name] = 'Joao'), GETDATE());

INSERT INTO dbo.ofac_match VALUES ((SELECT $node_id FROM [dbo].[ofac] WHERE [name] = 'João Silva'),
       (SELECT $node_id FROM [dbo].[ofac] WHERE [name] = 'João Sillva'), GETDATE());



SELECT Person2.name AS OfacName
FROM ofac Person1, ofac_match, ofac Person2
WHERE MATCH(Person1-(ofac_match)->Person2)
AND Person1.name = 'João Silva';

