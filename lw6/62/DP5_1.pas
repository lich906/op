{Разбиваем INPUT на Odds и Evens}
REWRITE(Odds);
REWRITE(Evens);
Next := 'O';
READ(INPUT, Ch);
WHILE Ch <> '#'
DO
  {Записывать Ch по состоянию Next,
  переключать Next};
WRITELN(Odds, '#');
WRITELN(Evens, '#');
