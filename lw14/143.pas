PROGRAM Sort(INPUT, OUTPUT);
VAR
  DataFile: TEXT;

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2 и F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2 и F3 в F1 в сортированном порядке}
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE ((NOT EOF(F2)) AND (NOT EOF(F3)))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3)
        END
    END;
  {Копировать остаток F2 в F1}
  IF EOF(F3)
  THEN
    BEGIN
      WRITE(F1, Ch2); 
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch2);
          WRITE(F1, Ch2)
        END
    END;   
  {Копировать остаток F3 в F1}
  IF EOF(F2)
  THEN
    BEGIN
      WRITE(F1, Ch3);
      WHILE NOT EOLN(F3) 
      DO
        BEGIN
          READ(F3, Ch3);
          WRITE(F1, Ch3)
        END
    END;
  WRITELN(F1)
END; {Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
{PROCEDURE Split(VAR F1, F2, F3: TEXT)
 Разбивает F1 на F2 и F3}
{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
 Сливает F2 и F3 в F1}
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT EOLN(F1)
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END
    END
END; {RecursiveSort}

PROCEDURE CopyFile(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; {CopyFile}

BEGIN {Sort}
  REWRITE(DataFile);
  CopyFile(INPUT, DataFile);  
  RecursiveSort(DataFile);
  RESET(DataFile);
  CopyFile(DataFile, OUTPUT)
END. {Sort}
