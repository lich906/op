{ опируем F1 в F2 с перестановками,
если перестановка Sorted := 'N'}
RESET(F1);
REWRITE(F2);
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
      END
  END;      
