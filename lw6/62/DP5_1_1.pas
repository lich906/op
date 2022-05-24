{Записывать Ch по состоянию Next,
переключать Next}
BEGIN
  IF Next = 'O'
  THEN
    BEGIN
      WRITE(Odds, Ch);
      Next := 'E'
    END
  ELSE
    BEGIN
      WRITE(Evens, Ch);
      Next := 'O'
    END;
  READ(INPUT, Ch)
END
