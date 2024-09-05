# T-SQL: Laço para Popular Tabela Associativa

Publicado em julho 28, 2024 por Samory Sundjata

Uma tabela associativa implementa relacionamentos muitos-para-muitos entre tabelas/classes, armazenando pares de chaves estrangeiras. Veja como usar um laço para popular tabela associativa em T-SQL.

## O que é T-SQL?

Transact-SQL é uma extensão proprietária da Microsoft para SQL, que adiciona recursos como programação procedural, variáveis locais e manipulação de exceções, sendo usada para gerenciar e consultar dados em bancos de dados SQL Server.

## O que é uma Tabela Associativa?

Primordialmente, uma tabela associativa, no contexto do Modelo Relacional e Orientação a Objetos, é uma estrutura que implementa relacionamentos muitos-para-muitos entre duas tabelas ou classes, armazenando pares de chaves estrangeiras que referenciam as entidades relacionadas. É quando você tem duas classes e uma contém uma lista da outra.

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

### Explicação:

- Alice (EstudanteID 1) está matriculada nos cursos de Matemática (CursoID 101) e Literatura (CursoID 102).
- Beto (EstudanteID 2) está matriculado apenas no curso de Matemática (CursoID 101).

Como resultado, a tabela EstudantesCursos associa estudantes a cursos, permitindo o gerenciamento do relacionamento muitos-para-muitos entre as duas entidades.

## Laço para Popular a Tabela Associativa

O laço `WHILE` em T-SQL mostrado realiza a inserção de registros em uma tabela associativa chamada `TABELAMAIOR_TABELAMENOR`, para criar um relacionamento entre `TABELAMAIOR` e `TABELAMENOR`.

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
