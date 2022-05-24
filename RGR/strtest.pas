PROGRAM StringTest(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  Str: STRING;
  F1: TEXT;
BEGIN
  Str := '';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Str := Str + Ch
    END;
  WRITELN(Str);
  REWRITE(F1);
  WRITELN(F1, Str);
  RESET(F1);
  Ch := F1^;
  WRITELN(Ch);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END
END.
