PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  Ch := ' ';
  {���������� ������� � ������}
  WHILE ((Ch = ' ') AND NOT EOLN)
  DO
    READ(Ch);
  IF NOT EOLN
  THEN
    WRITE(Ch);
  {������������ ���������� ������}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        BEGIN
          {������������ ������� ����� �������}
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
