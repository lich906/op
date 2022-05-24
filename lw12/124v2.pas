PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch, Stage: CHAR;
BEGIN
  Stage := 'B';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        BEGIN
          {Пропускаем лишние пробелы}
          WHILE ((Ch = ' ') AND NOT EOLN)
          DO
            READ(Ch);
          {Обрабатываем пробел между словами: Stage = 'W'}
          IF ((Stage = 'W') AND NOT EOLN) 
          THEN
            WRITE(' ', Ch);
          {Удаляем пробелы в начале: Stage = 'B'}
          IF ((Stage = 'B') AND NOT EOLN)
          THEN
            BEGIN
              WRITE(Ch);
              Stage := 'W'
            END
        END
      ELSE
        BEGIN
          WRITE(Ch);
          Stage := 'W'
        END
    END;
  WRITELN
END.
