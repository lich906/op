  {�������� ������� �  OUTPUT, ��������� ���������� � Ch1 and Ch2 }
  IF Ch1 < Ch2
  THEN
    {�������� ������� ��  Ch1, Ch3 � OUTPUT,
     ����������� Ch3 � Ch1, ���� ����������}
    IF Ch1 < Ch3
    THEN
      BEGIN
        WRITE(Ch1);
        Ch1 := Ch3
      END
    ELSE
      WRITE(Ch3)
  ELSE
    {�������� ������� ��  Ch2, Ch3 � OUTPUT,
    ����������� Ch3 � Ch2, ���� ����������}
    IF Ch2 < Ch3
    THEN
      BEGIN
        WRITE(Ch2);
        Ch2 := Ch3
      END
    ELSE
      WRITE(Ch3);