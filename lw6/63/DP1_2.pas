BEGIN {����������� F1 � OUTPUT, ��������� ��������� SelectSort}
  WRITE(OUTPUT, 'SORTED DATA:');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> �#� � Ch1 � ������ ������ F1}
    BEGIN
      {�������� ����������� �� F1 � �������� ������� F1 � F2}
      WRITE(OUTPUT, Min);
      {�������� F2 � F1}
      RESET(F1);
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT);
END
