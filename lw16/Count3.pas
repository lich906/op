UNIT Count3; {Модуль счетчика}
INTERFACE
PROCEDURE Start; {Обнулить}
PROCEDURE Bump; {Инкремент}
PROCEDURE Value(VAR V100, V10, V1: CHAR); {Получить значение}

IMPLEMENTATION
VAR
  Ones, Tens, Hundreds: CHAR;
  
PROCEDURE Start;
{Присваивает переменным счетчика значение '0'}
BEGIN {Start}
  Ones := '0';
  Tens := '0';
  Hundreds := '0'
END; {Start}

PROCEDURE NextDigit(VAR Digit: CHAR);
{Если Digit - цифра, то увеличивает цифру на единицу 
(Digit = '0' --> Digit := '1')|(...)|(Digit = '9' --> Digit := '0')}
BEGIN {NextDigit}
  IF Digit = '0' THEN Digit := '1' ELSE 
  IF Digit = '1' THEN Digit := '2' ELSE
  IF Digit = '2' THEN Digit := '3' ELSE
  IF Digit = '3' THEN Digit := '4' ELSE
  IF Digit = '4' THEN Digit := '5' ELSE
  IF Digit = '5' THEN Digit := '6' ELSE
  IF Digit = '6' THEN Digit := '7' ELSE
  IF Digit = '7' THEN Digit := '8' ELSE
  IF Digit = '8' THEN Digit := '9' ELSE
  IF Digit = '9' THEN Digit := '0'  
END; {NextDigit}

PROCEDURE Bump;
{Увеличиваем цифру младшего разряда на единицу, если перенос - увеличиваем следующий разряд.
При текущем значении 999 - переполнение.}
BEGIN {Bump}
  NextDigit(Ones);
  IF Ones = '0'
  THEN
    BEGIN
      NextDigit(Tens);
      IF Tens = '0'
      THEN
        BEGIN
          NextDigit(Hundreds);
          IF Hundreds = '0'
          THEN
            WRITELN('OVERFLOW')
        END  
    END
END; {Bump}

PROCEDURE Value(VAR V100, V10, V1: CHAR);
{Передает текущее значение счетчика: 
V100, V10, V1 := Hundreds, Tens, Ones}
BEGIN {Value}
  V100 := Hundreds;
  V10 := Tens;
  V1 := Ones
END; {Value}

BEGIN
  Start
END.
