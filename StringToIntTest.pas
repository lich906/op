PROGRAM StringToIntTest(INPUT, OUTPUT);
VAR
  Number: INTEGER;

PROCEDURE CharToDigit(VAR Ch: CHAR; VAR Result: INTEGER);
BEGIN {CharToDigit}
  IF Ch = '0' THEN Result := 0 ELSE
  IF Ch = '1' THEN Result := 1 ELSE
  IF Ch = '2' THEN Result := 2 ELSE
  IF Ch = '3' THEN Result := 3 ELSE
  IF Ch = '4' THEN Result := 4 ELSE
  IF Ch = '5' THEN Result := 5 ELSE
  IF Ch = '6' THEN Result := 6 ELSE
  IF Ch = '7' THEN Result := 7 ELSE
  IF Ch = '8' THEN Result := 8 ELSE
  IF Ch = '9' THEN Result := 9 ELSE
  IF Ch = 'A' THEN Result := 10 ELSE
  IF Ch = 'B' THEN Result := 11 ELSE
  IF Ch = 'C' THEN Result := 12 ELSE
  IF Ch = 'D' THEN Result := 13 ELSE
  IF Ch = 'E' THEN Result := 14 ELSE
  IF Ch = 'F' THEN Result := 15 
  ELSE
    Result := -1    
END; {CharToDigit}
  
PROCEDURE StringToInt(VAR FIn: TEXT; Base: INTEGER; VAR Result: INTEGER);
VAR
  Ch: CHAR;
  Digit: INTEGER;
BEGIN {StringToInt}
  Result := 0;
  READ(FIn, Ch);
  WHILE (Ch <> '#') AND (Ch <> ' ')
  DO
    BEGIN
      {Digit := числовое представление Ch}
      CharToDigit(Ch, Digit);
      IF Digit >= 0
      THEN
        Result := Result * Base + Digit;
      READ(FIn, Ch)
    END
END; {StringToInt}

BEGIN {StringToIntTest}
  StringToInt(INPUT, 16, Number);
  WRITELN('Число, полученное из данной строки: ', Number)
END. {StringToIntTest}
