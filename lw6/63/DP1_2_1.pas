BEGIN {¬ыбираем минимальный из F1 и копируем остаток F1 в F2}
  REWRITE(F2);
  Min := Ch;
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> С#Т и Ch1 Ц первый символ F1}
    BEGIN
      {¬ыбираем минимальный из (Ch, Min)
       копируем второй символ в F2}
      READ(F1, Ch)
    END;
  WRITELN(F2, '#');
END
