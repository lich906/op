PROGRAM Stat(INPUT, OUTPUT);
VAR
  N, Max, Min, Mid, Sum, Count: INTEGER;
  Ch: CHAR;
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

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{��������� ����� �� �������� ����� F �� ������� �����������
 � ����������� �� � ����� ����� N}
VAR
  Digit: INTEGER;
BEGIN {ReadNumber}
  Digit := 0;
  N := 0;
  WHILE (NOT EOLN(F)) AND (Digit >= 0) AND (N >= 0)
  DO
    BEGIN
      ReadDigit(F, Digit);
      IF Digit >= 0
      THEN
        IF N > (MAXINT DIV 10)
        THEN
          N := -1
        ELSE
          IF (N = (MAXINT DIV 10)) AND (Digit > (MAXINT MOD 10))
          THEN
            N := -1
          ELSE
            N := N * 10 + Digit  
    END
END; {ReadNumber}

BEGIN {Stat}
  ReadNumber(INPUT, N);
  Min := N;
  Max := N;
  Mid := 0;
  Count := 1;
  Sum := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      ReadNumber(INPUT, N);
      IF N >= 0
      THEN
        BEGIN
          Count := Count + 1;
          IF N <= (MAXINT - Sum)
          THEN
            Sum := Sum + N;
          IF N > Max
          THEN
            Max := N;
          IF N < Min
          THEN
            Min := N
        END
    END;
  Mid := Sum DIV Count;
  WRITELN('Max ', Max);
  WRITELN('Min ', Min);
  WRITELN('Mid ', Mid)  
END. {Stat}
