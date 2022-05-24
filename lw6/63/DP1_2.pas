BEGIN {—ортировать F1 в OUTPUT, использу€ стратегию SelectSort}
  WRITE(OUTPUT, 'SORTED DATA:');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> С#Т и Ch1 Ц первый символ F1}
    BEGIN
      {¬ыбираем минимальный из F1 и копируем остаток F1 в F2}
      WRITE(OUTPUT, Min);
      { опируем F2 в F1}
      RESET(F1);
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT);
END
