PROGRAM Format(INPUT, OUTPUT);
VAR
  F1: TEXT;
  Ch, W1, W2, W3, W4, W5, Inside: CHAR;
BEGIN
  {Initializing variables}
  Inside := 'N';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  {Копируем INPUT в F1 без пробелов и повторяющихся ';'}
  REWRITE(F1);
  READ(INPUT, Ch);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        BEGIN
          WRITE(F1, Ch);
          READ(INPUT, Ch)
        END
      ELSE
        READ(INPUT, Ch);
      IF Ch = ';'
      THEN
        BEGIN
          WRITE(F1, Ch);
          WHILE Ch = ';'
          DO
            READ(INPUT, Ch)
        END
    END;
  WRITELN(F1, Ch);
  {Копируем F1 в OUTPUT с форматированием}
  RESET(F1);
  READ(F1, W1, W2, W3, W4, W5);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND (W5 = 'N') AND (Inside = 'N')
      THEN
        BEGIN
          WRITELN(OUTPUT, 'BEGIN');
          WRITE(OUTPUT, '  ');
          READ(F1, W1, W2, W3, W4, W5);
          Inside := 'Y'
        END;
      WRITE(OUTPUT, W1);
      IF W1 = ','
      THEN
        WRITE(OUTPUT, ' ');
      IF W1 = ';'
      THEN
        BEGIN
          WRITELN(OUTPUT);
          WRITE(OUTPUT, '  ')
        END;
      {Сдвигаем окно}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      W4 := W5;
      READ(F1, W5);
      {Проверка на конец оператора BEGIN}
      IF W5 = '.'
      THEN
        BEGIN
          IF W1 <> ';'
          THEN
            WRITELN(OUTPUT, W1)
          ELSE
            WRITELN(OUTPUT);
          WRITELN(OUTPUT, 'END.')
        END;
    END
END.
