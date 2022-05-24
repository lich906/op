BEGIN {Копируем F2 в F1}
  RESET(F2);
  REWRITE(F1);
  READ(F2, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      READ(F2, Ch)
    END;
  WRITELN(F1, '#');
END
