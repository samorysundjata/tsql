-- Criação das tabelas principais e associativa

-- Tabela Estudantes
CREATE TABLE Estudantes (
    EstudanteID INT PRIMARY KEY,
    NomeEstudante NVARCHAR(100)
);

-- Tabela Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    NomeCurso NVARCHAR(100)
);

-- Tabela Associativa EstudantesCursos
CREATE TABLE EstudantesCursos (
    EstudanteID INT,
    CursoID INT,
    FOREIGN KEY (EstudanteID) REFERENCES Estudantes(EstudanteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);