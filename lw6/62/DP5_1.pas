{��������� INPUT �� Odds � Evens}
REWRITE(Odds);
REWRITE(Evens);
Next := 'O';
READ(INPUT, Ch);
WHILE Ch <> '#'
DO
  {���������� Ch �� ��������� Next,
  ����������� Next};
WRITELN(Odds, '#');
WRITELN(Evens, '#');
