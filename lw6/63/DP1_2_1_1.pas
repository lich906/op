BEGIN {¬ыбираем минимальный из (Ch, Min)
          копируем второй символ в F2}
  IF Ch < Min
  THEN  {Ch Ц минимальный из (Ch, Min)}
    BEGIN
      WRITE(F2, Min);
      Min := Ch;
    END
  ELSE {Min Ц минимальный из (Ch, Min)}
    WRITE(F2, Ch);
END
