BEGIN {�������� ����������� �� (Ch, Min)
          �������� ������ ������ � F2}
  IF Ch < Min
  THEN  {Ch � ����������� �� (Ch, Min)}
    BEGIN
      WRITE(F2, Min);
      Min := Ch;
    END
  ELSE {Min � ����������� �� (Ch, Min)}
    WRITE(F2, Ch);
END
