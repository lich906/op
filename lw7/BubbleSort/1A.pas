PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN
  {Копируем INPUT в F1}
  REWRITE(F1);
  REWRITE(OUTPUT);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch)
    END;
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      {Копируем F1 в F2 с перестановками,
      если перестановка Sorted := 'N'}
      {Копируем F2 в F1}
    END;
  {Копируем F1 в OUTPUT}
END.
  
  
  

