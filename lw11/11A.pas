PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1, F2: TEXT;
BEGIN {Reverse}
  {Копируем INPUT в F1}
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(F1);
  WRITELN(OUTPUT);
  RESET(F1)
  {WHILE NOT EOLN(F1)
  DO
    BEGIN
      {Выводим последний символ из F1 в OUTPUT, одновременно записываем все символы, кроме последнего из F1 в F2}
      {Копируем F2 в F1}
    {END}
END. {Reverse}
