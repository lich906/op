PROGRAM BubbleSortMLB(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN  {BubbleSortMLB}
  { опируем INPUT в F1 с сохранением строк}
  REWRITE(F1);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      IF NOT EOLN(INPUT)
      THEN
        BEGIN
          READ(INPUT, Ch);
          WRITE(F1, Ch)
        END
      ELSE
        BEGIN
          READLN(INPUT);
          WRITELN(F1)
        END
    END;
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      { опируем F1 в F2 с сохранением строк и с перестановками,
      если перестановка Sorted := 'N'}
      RESET(F1);
      REWRITE(F2);
      WHILE NOT EOF(F1)
      DO
        BEGIN
          IF NOT EOLN(F1)
          THEN
            BEGIN
              READ(F1, Ch1);
              WHILE NOT EOLN(F1)
              DO
                BEGIN
                  READ(F1, Ch2);
                  IF Ch1 <= Ch2
                  THEN
                    BEGIN
                      WRITE(F2, Ch1);
                      Ch1 := Ch2
                    END
                  ELSE
                    BEGIN
                      Sorted := 'N';
                      WRITE(F2, Ch2)
                    END
                END;
            END;
          WRITELN(F2, Ch1);
          READLN(F1)
        END;  
      { опируем F2 в F1 с сохранением строк}
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOF(F2)
      DO
        BEGIN
          IF NOT EOLN(F2)
          THEN
            BEGIN
              READ(F2, Ch);
              WRITE(F1, Ch)
            END
          ELSE
            BEGIN
              READLN(F2);
              WRITELN(F1)
            END
        END
    END;
  { опируем F1 в OUTPUT с сохранением строк}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END
      ELSE
        BEGIN
          READLN(F1);
          WRITELN(OUTPUT)
        END
    END
END.  {BubbleSortMLB}
