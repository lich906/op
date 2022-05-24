PROGRAM SarahRevere (INPUT, OUTPUT);
{Печать сообщения о том, как идут британцы,
в зависимости от того, первым во входе встречается 'land', 'sea' или 'air'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;

PROCEDURE InitWindow;
{Инициализация окна}
BEGIN {InitWindow}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ' 
END; {InitWindow}
  
PROCEDURE CheckLand;
BEGIN {CheckLand}
  {Проверка окна для 'land'}
  IF (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
  THEN {'land' найдено}
    Looking := 'L'
END; {CheckLand}

PROCEDURE CheckSea;
BEGIN {CheckSea}
  {Проверка окна для 'sea'}
  IF (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
  THEN {'sea' найдено}
    Looking := 'S'
END; {CheckSea}

PROCEDURE CheckAir;
BEGIN {CheckAir}
  {Проверка окна для 'air'}
  IF (W2 = 'a') AND (W3 = 'i') AND (W4 = 'r')
  THEN {'air' найдено}
    Looking := 'A'
END; {CheckAir}

PROCEDURE MoveWindow;
BEGIN {MoveWindow}
  {Движение окна}
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4);
  IF W4 = '#'
  THEN {Проверка на конец строки}
    Looking := 'N'  
END; {MoveWindow}

PROCEDURE PrintMessage;
{Создаем сообщение Sarah в зависимости от Looking}
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
      {Проверка окон}
      CheckLand;
      CheckSea;
      CheckAir;
      MoveWindow
    END;
  PrintMessage
END. {SarahRevere}
