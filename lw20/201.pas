PROGRAM Prime(INPUT, OUTPUT);
CONST
  FirstPrime = 2;
  MaxValue = 100;
VAR
  NumberSet: SET OF BYTE;
  I, Prime, NextPrime: BYTE;
BEGIN {Prime}
  NumberSet := [FirstPrime..MaxValue];
  Prime := FirstPrime;
  NextPrime := Prime;     
  WHILE NumberSet <> []
  DO
    BEGIN
      WRITE(Prime, ' ');
      I := Prime;
      WHILE I <= MaxValue
      DO
        BEGIN
          IF I IN NumberSet
          THEN
            BEGIN
              IF (I MOD Prime) = 0
              THEN
                NumberSet := NumberSet - [I]
              ELSE
                IF NextPrime = Prime
                THEN
                  NextPrime := I
            END;
          I := I + 1
        END;
      Prime := NextPrime 
    END;
  WRITELN
END. {Prime}
