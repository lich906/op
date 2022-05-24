PROGRAM SarahRevere (INPUT, OUTPUT);
{������ ��������� � ���, ��� ���� ��������,
� ����������� �� ����, ������ �� ����� ����������� 'land', 'sea' ��� 'air'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;

PROCEDURE InitWindow;
{������������� ����}
BEGIN {InitWindow}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ' 
END; {InitWindow}
  
PROCEDURE CheckLand;
BEGIN {CheckLand}
  {�������� ���� ��� 'land'}
  IF (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
  THEN {'land' �������}
    Looking := 'L'
END; {CheckLand}

PROCEDURE CheckSea;
BEGIN {CheckSea}
  {�������� ���� ��� 'sea'}
  IF (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
  THEN {'sea' �������}
    Looking := 'S'
END; {CheckSea}

PROCEDURE CheckAir;
BEGIN {CheckAir}
  {�������� ���� ��� 'air'}
  IF (W2 = 'a') AND (W3 = 'i') AND (W4 = 'r')
  THEN {'air' �������}
    Looking := 'A'
END; {CheckAir}

PROCEDURE MoveWindow;
BEGIN {MoveWindow}
  {�������� ����}
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4);
  IF W4 = '#'
  THEN {�������� �� ����� ������}
    Looking := 'N'  
END; {MoveWindow}

PROCEDURE PrintMessage;
{������� ��������� Sarah � ����������� �� Looking}
BEGIN {PrintMessage}
  IF Looking = 'L'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF Looking = 'S'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      IF Looking = 'A'
      THEN
        WRITELN('The British are coming by air.')
      ELSE
        WRITELN('Sarah didn''t say')
END; {PrintMessage}

BEGIN {SarahRevere}
  InitWindow;
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN
      {�������� ����}
      CheckLand;
      CheckSea;
      CheckAir;
      MoveWindow
    END;
  PrintMessage
END. {SarahRevere}
