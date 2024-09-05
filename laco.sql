-- População da tabela associativa usando um laço WHILE

DECLARE @counter INT = (SELECT TOP 1 EstudanteID FROM Estudantes);
DECLARE @counterMAJ INT = (SELECT COUNT(*) FROM Estudantes);
DECLARE @counterMIN INT = (SELECT COUNT(*) FROM Cursos);
DECLARE @RandomNumber INT = (SELECT ABS(CHECKSUM(NEWID())) % @counterMIN + 1);

WHILE @counter <= @counterMAJ
BEGIN
    INSERT INTO EstudantesCursos (EstudanteID, CursoID)
    VALUES (@counter, @RandomNumber);

    SET @counter = @counter + 1;
    SET @RandomNumber = (SELECT ABS(CHECKSUM(NEWID())) % @counterMIN + 1);
END;