PROGRAM ReverseCounter(INPUT, OUTPUT);
USES Count3;
VAR
  W1, W2, W3, C1, C2, C3: CHAR;
PROCEDURE MoveWindow;
{Движение окна из 3-х символов}
BEGIN {MoveWindow}
  W1 := W2;
  W2 := W3;
  READ(W3)
END; {MoveWindow}
BEGIN {ReverseCounter}
  READ(W2, W3);
  Start;
  WHILE ((NOT EOLN) AND (NOT EOF))
  DO
    BEGIN
      MoveWindow;
      IF ((W1 < W2) AND (W2 > W3)) OR ((W1 > W2) AND (W2 < W3))
      THEN
        Bump  
    END;
  Value(C1, C2, C3);
  WRITELN('Количество реверсов: ', C1, C2, C3)
END. {ReverseCounter}
