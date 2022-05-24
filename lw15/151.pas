PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)    
END; {CopyFile}
PROCEDURE CopySort(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {CopySort}  
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
              WRITE(F2, Ch2);
              Sorted := 'N'
            END
        END;
      WRITE(F2, Ch1);  
      WRITELN(F2)
    END  
END; {CopySort}
BEGIN {BubbleSort}
  {Копируем INPUT в F1}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      {Копируем F1 в F2 с перестановками,
      если перестановка Sorted := 'N'}
      RESET(F1);
      REWRITE(F2);
      CopySort(F1, F2, Sorted);
      {Копируем F2 в F1}
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1)
    END;
  {Копируем F1 в OUTPUT}
  RESET(F1);
  CopyFile(F1, OUTPUT)
END. {BubbleSort}
  
  
  

