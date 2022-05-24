PROGRAM PseudoString(INPUT, OUTPUT);
CONST
  Rows = 5;                                              {количество строк знакоместа}
  Columns = 5;                                           {количество столбцов знакоместа}
  StringLength = 10;                                     {максимальное число псевдосимволов в выводе}
  FieldColumns = Columns * StringLength;                 {количество столбцов поля вывода}
  MinIndex = 1;                                          
  MaxIndex = Rows * Columns;
  MaxFieldIndex = Rows * FieldColumns;

TYPE
  Indexes = MinIndex..MaxIndex;              {диапазон индексов одного знакоместа}
  FieldIndexes = MinIndex..MaxFieldIndex;    {диапазон индексов поля вывода}
  
VAR
  PseudoF: TEXT;
  Ch1, Ch: CHAR;
  LetterSet: SET OF Indexes;
  FieldSet: SET OF FieldIndexes;  
  FIndex: FieldIndexes;           {счетчик индексов поля вывода}
  Index, TmpIndex: Indexes;       {счетчики для индексов одного псевдосимвола}
  FRow: INTEGER;                  {счетчик строки поля вывода}
  
{PROCEDURE LoadLetterSet(VAR FIn: TEXT; InCh: CHAR);
VAR
  I: Indexes;
  Ch: CHAR;
BEGIN LoadLetterSet
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, Ch);
      IF Ch = InCh
      THEN
        WHILE NOT EOLN(FIn)
        DO
          BEGIN
            READ(FIn, I);
            LetterSet := LetterSet + [I]
          END
      ELSE
        READLN(FIn)  
    END
END;} {LoadLetterSet}
  
BEGIN {PseudoString}
  {FOR Index := MinIndex TO MaxIndex
  DO
    BEGIN
      IF Index IN LetterSet
      THEN
        WRITE(Index, ' ')
    END;
  FOR Index := MinIndex TO MaxIndex
  DO
    BEGIN
      IF Index IN LetterSet
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF Index MOD Columns = 0
      THEN
        WRITELN
    END;
  REWRITE(FOut);
  FOR Ch := 'A' TO 'E'
  DO
    BEGIN
      CASE Ch OF
        'A': LetterSet := [2..4, 6, 10..16, 20, 21, 25];
        'B': LetterSet := [1..4, 6, 10..14, 16, 20..24];
        'C': LetterSet := [2..4, 6, 11, 16, 22..24];
        'D': LetterSet := [1..4, 6, 10, 11, 15, 16, 20, 21..24];
        'E': LetterSet := [1..5, 6, 11..15, 16, 21..25]
      END;
      WRITE(FOut, Ch);
      FOR Index := MinIndex TO MaxIndex
      DO
        IF Index IN LetterSet
        THEN
          WRITE(FOut, Index, ' ');
      WRITELN(FOut)
    END;}
  {Формируем множество всех символов строки}
  ASSIGN(PseudoF, 'PseudoChars.txt');
  FieldSet := [];
  FOR FIndex := MinIndex TO StringLength
  DO
    IF NOT EOLN(INPUT)
    THEN
      BEGIN
        LetterSet := [];
        READ(INPUT, Ch);
        RESET(PseudoF);
        WHILE NOT EOF(PseudoF)
        DO
          BEGIN
            READ(PseudoF, Ch1);
            IF Ch = Ch1
            THEN
              WHILE NOT EOLN(PseudoF)
              DO
                BEGIN
                  READ(PseudoF, Index);
                  WRITE(OUTPUT, Index, ' ');
                  LetterSet := LetterSet + [Index]
                END
            ELSE
              READLN(PseudoF)  
          END;
        FRow := 0;
        TmpIndex := MinIndex;
        FOR Index := MinIndex TO MaxIndex
        DO
          BEGIN
            IF Index IN LetterSet
            THEN
              BEGIN
                FieldSet := FieldSet + [TmpIndex + (FIndex - 1) * Columns + FieldColumns * FRow];
              END;
            TmpIndex := TmpIndex + 1;
            IF Index MOD Columns = 0
            THEN
              BEGIN
                FRow := FRow + 1;
                TmpIndex := 1
              END
          END 
      END;
  {Выводим строку псевдосимволами}
  FOR FIndex := MinIndex TO MaxFieldIndex
  DO
    BEGIN
      IF FIndex IN FieldSet
      THEN
        WRITE(OUTPUT, 'X')
      ELSE
        WRITE(OUTPUT, ' ');
      IF FIndex MOD FieldColumns = 0
      THEN
        WRITELN(OUTPUT)
    END                
END. {PseudoString}
