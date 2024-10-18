# T-SQL: Laço para Popular Tabela Associativa

[![T-SQL](https://img.shields.io/badge/SQL-T--SQL-blue)](https://docs.microsoft.com/en-us/sql/t-sql/language-reference)
![SQL Server 2019](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)
![Loops](https://img.shields.io/badge/Loops-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)

Publicado em julho 28, 2024 por Samory Sundjata

Uma tabela associativa implementa relacionamentos muitos-para-muitos entre tabelas/classes, armazenando pares de chaves estrangeiras. Veja como usar um laço para popular tabela associativa em T-SQL.

## O que é T-SQL?

Transact-SQL é uma extensão proprietária da Microsoft para SQL, que adiciona recursos como programação procedural, variáveis locais e manipulação de exceções, sendo usada para gerenciar e consultar dados em bancos de dados SQL Server.

## Exemplo de Tabelas

### Tabelas Principais:

**Estudantes**

- EstudanteID (Chave Primária)
- NomeEstudante

**Cursos**

- CursoID (Chave Primária)
- NomeCurso

### Tabela Associativa:

**EstudantesCursos**

- EstudanteID (Chave Estrangeira, referencia Estudantes.EstudanteID)
- CursoID (Chave Estrangeira, referencia Cursos.CursoID)

### Exemplo de Dados:

**Estudantes**
| EstudanteID | NomeEstudante |
|-------------|---------------|
| 1 | Alice |
| 2 | Beto |

**Cursos**
| CursoID | NomeCurso |
|---------|-------------|
| 101 | Matemática |
| 102 | Literatura |

**EstudantesCursos**
| EstudanteID | CursoID |
|-------------|---------|
| 1 | 101 |
| 1 | 102 |
| 2 | 101 |

## Laço para Popular a Tabela Associativa

```sql
DECLARE @counter INT = (SELECT TOP 1 ID_TABELAMAIOR FROM TABELAMAIOR);
DECLARE @counterMAJ INT = (SELECT COUNT(*) FROM [TABELAMAIOR]);
DECLARE @counterMIN INT = (SELECT COUNT(*) FROM [TABELAMENOR]);
DECLARE @RandomNumber INT = (SELECT ABS(CHECKSUM(NEWID())) % @counterMIN + 1);

WHILE @counter <= @counterMAJ
BEGIN
    INSERT INTO [TABELAMAIOR_TABELAMENOR] ([ID_TABELAMAIOR], [ID_TABELAMENOR])
    VALUES (@counter, @RandomNumber);

    SET @counter = @counter + 1;
    SET @RandomNumber = (SELECT ABS(CHECKSUM(NEWID())) % @counterMIN + 1);
END;
```
