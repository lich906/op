PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN
  {�������� INPUT � F1}
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
      {�������� F1 � F2 � ��������������,
      ���� ������������ Sorted := 'N'}
      {�������� F2 � F1}
    END;
  {�������� F1 � OUTPUT}
END.
  
  
  

