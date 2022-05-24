PROGRAM UnitTest(INPUT, OUTPUT);
USES Count3;
VAR
  Ch, Ch100, Ch10, Ch1: CHAR;
BEGIN {UnitTest}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Bump
    END;
  Value(Ch100, Ch10, Ch1);
  IF Ch100 <> '0'
  THEN 
    WRITELN('Длина строки: ', Ch100, Ch10, Ch1)
END. {UnitTest}

