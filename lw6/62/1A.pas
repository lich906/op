PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN  {Split}
  {Разбиваем INPUT на Odds и Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    {Записывать Ch по состоянию Next,
    переключать Next}
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
  {Выводим Odds в OUTPUT}
  {Выводим Evens в OUTPUT}
END.  {Split}
