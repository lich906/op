PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN  {Split}
  {��������� INPUT �� Odds � Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    {���������� Ch �� ��������� Next,
    ����������� Next}
    BEGIN
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          WRITELN(OUTPUT, Ch, ' -> Odds');
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          WRITELN(OUTPUT, Ch, ' -> Evens');
          Next := 'O'
        END;
      READ(INPUT, Ch)
    END;
  WRITELN(Odds, '#');
  WRITELN(Evens, '#');
  {������� Odds � OUTPUT}
  {������� Evens � OUTPUT}
END.  {Split}
