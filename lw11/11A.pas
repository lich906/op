PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1, F2: TEXT;
BEGIN {Reverse}
  {�������� INPUT � F1}
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
      {������� ��������� ������ �� F1 � OUTPUT, ������������ ���������� ��� �������, ����� ���������� �� F1 � F2}
      {�������� F2 � F1}
    {END}
END. {Reverse}
