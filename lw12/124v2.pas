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
          {���������� ������ �������}
          WHILE ((Ch = ' ') AND NOT EOLN)
          DO
            READ(Ch);
          {������������ ������ ����� �������: Stage = 'W'}
          IF ((Stage = 'W') AND NOT EOLN) 
          THEN
            WRITE(' ', Ch);
          {������� ������� � ������: Stage = 'B'}
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
