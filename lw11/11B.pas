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
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      {Выводим последний символ из F1 в OUTPUT, одновременно записываем все символы, кроме последнего из F1 в F2}
      REWRITE(F2);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          IF EOLN(F1)
          THEN
            WRITE(OUTPUT, ' ', Ch)
          ELSE
            BEGIN
              WRITE(F2, Ch);
              WRITE(OUTPUT, Ch)
            END
        END;
        WRITELN(F2);
      {Копируем F2 в F1}
    END;
  WRITELN(OUTPUT)
END. {Reverse}
