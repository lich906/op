PROGRAM Copy(INPUT, OUTPUT);
PROCEDURE RCopy(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {RCopy}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      WRITE(Ch);
      RCopy(F)
    END
END; {RCopy}
BEGIN {Copy}
  RCopy(INPUT);
  WRITELN
END. {Copy}
