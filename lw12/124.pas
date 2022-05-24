PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  Ch := ' ';
  {Пропускаем пробелы в начале}
  WHILE ((Ch = ' ') AND NOT EOLN)
  DO
    READ(Ch);
  IF NOT EOLN
  THEN
    WRITE(Ch);
  {Обрабатываем оставшуюся строку}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        BEGIN
          {Обрабатываем пробелы между словами}
          WHILE ((Ch = ' ') AND NOT EOLN)
          DO
            READ(Ch);
          IF NOT EOLN
          THEN
            WRITE(' ', Ch)
        END
      ELSE
        WRITE(Ch)
    END;
  WRITELN
END.
