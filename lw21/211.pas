PROGRAM PseudoPrint(INPUT, OUTPUT);
CONST
  Rows = 5;
  Columns = 5;
  MinIndex = 1;
  MaxIndex = Rows * Columns;

TYPE
  Indexes = MinIndex..MaxIndex;
    
VAR
  InChar: CHAR;
   
PROCEDURE PseudoChPrint(Ch: CHAR);
VAR
  Letter: SET OF Indexes;
  I: INTEGER;
BEGIN {PseudoChPrint}
  CASE Ch OF
    'A': Letter := [2..4, 6, 10..16, 20, 21, 25];
    'B': Letter := [1..4, 6, 10..14, 16, 20..24];
    'C': Letter := [2..4, 6, 11, 16, 22..24];
    'D': Letter := [1..4, 6, 10, 11, 15, 16, 20, 21..24];
    'E': Letter := [1..5, 6, 11..15, 16, 21..25]
  END;
  FOR I := MinIndex TO MaxIndex
  DO
    BEGIN
      IF I IN Letter
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF I MOD Columns = 0
      THEN
        WRITELN
    END
END; {PseudoChPrint}

BEGIN {PseudoPrint}
  READ(InChar);
  PseudoChPrint(InChar)
END. {PseudoPrint}
