BEGIN {�������� ����������� �� F1 � �������� ������� F1 � F2}
  REWRITE(F2);
  Min := Ch;
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> �#� � Ch1 � ������ ������ F1}
    BEGIN
      {�������� ����������� �� (Ch, Min)
       �������� ������ ������ � F2}
      READ(F1, Ch)
    END;
  WRITELN(F2, '#');
END
