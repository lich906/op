PROGRAM ReadDigitTest(INPUT, OUTPUT);
VAR
  Digit, Sum: INTEGER;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{��������� ������� ������ �� �����. ���� �� - �����, ���������� ��� 
 ���������� � �������� ���� INTEGER. ���� ��������� ������ �� �����
 ���������� -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(F, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 
  ELSE
    D := -1
END; {ReadDigit}

BEGIN {ReadDigitTest}
  Digit := 0;
  Sum := 0;
  WHILE (NOT EOLN) AND (Digit >= 0)
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      IF Digit >= 0
      THEN
        Sum := Sum + Digit
    END;
  WRITELN(Sum)
END. {ReadDigitTest}