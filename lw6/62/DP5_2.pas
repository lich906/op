{������� Odds � OUTPUT}
RESET(Odds);
READ(Odds, Ch);
WHILE Ch <> '#'
DO
  BEGIN
    WRITE(OUTPUT, Ch);
    READ(Odds, Ch)
  END;
