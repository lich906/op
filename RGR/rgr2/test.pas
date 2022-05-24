PROGRAM Test(INPUT, OUTPUT);
USES
  WordTree;
  
PROCEDURE CopyFile(VAR F1, F2: TEXT);
{Копирует содержимое файла F1 в файл F2}
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOF(F1)
  DO
    IF NOT EOLN(F1)
    THEN
      BEGIN
        READ(F1, Ch);
        WRITE(F2, Ch)
      END
    ELSE
      BEGIN
        READLN(F1);
        WRITELN(F2)
      END
END;  {CopyFile}

PROCEDURE ReadWordLine(VAR F: TEXT; VAR WordStr: STRING; VAR WordCount: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadWordLine}
  IF NOT EOF(F)
  THEN
    BEGIN
      WordStr := '';
      WHILE F^ <> ' '
      DO
        BEGIN
          READ(F, Ch);
          WordStr := WordStr + Ch
        END;
      GET(F);
      READ(F, WordCount);
      READLN(F)
    END
END;  {ReadWordLine}

PROCEDURE Merge(VAR F: TEXT; Ptr: WTree);
{Сливает содержимое дерева
 с файлом F в отсортированном порядке}
VAR
  TreeF: TEXT;
  MergeF: TEXT;
  TreeWord, FWord: STRING;
  TreeCount, FCount: INTEGER;
  Stop: BOOLEAN;
BEGIN {Merge}
  REWRITE(TreeF);
  WriteWordTree(TreeF, Ptr);
  RESET(TreeF);
  RESET(F);
  REWRITE(MergeF);
  ReadWordLine(F, FWord, FCount);
  ReadWordLine(TreeF, TreeWord, TreeCount);
  Stop := FALSE;
  WHILE NOT Stop
  DO
    BEGIN
      IF FWord < TreeWord
      THEN
        BEGIN
          WRITELN(MergeF, FWord, ' ', FCount);
          IF EOF(F)
          THEN
            Stop := TRUE
          ELSE
            ReadWordLine(F, FWord, FCount)
        END;
      IF TreeWord < FWord
      THEN
        BEGIN
          WRITELN(MergeF, TreeWord, ' ', TreeCount);
          IF EOF(TreeF)
          THEN
            Stop := TRUE
          ELSE
            ReadWordLine(TreeF, TreeWord, TreeCount)
        END;
      IF TreeWord = FWord
      THEN
        BEGIN
          WRITELN(MergeF, TreeWord, ' ', TreeCount + FCount);
          IF (EOF(F)) OR (EOF(TreeF))
          THEN
            Stop := TRUE
          ELSE
            BEGIN
              ReadWordLine(TreeF, TreeWord, TreeCount);
              ReadWordLine(F, FWord, FCount)
            END
        END;
    END;
  IF FWord < TreeWord
  THEN
    WRITELN(MergeF, TreeWord, ' ', TreeCount);
  IF TreeWord < FWord
  THEN
    WRITELN(MergeF, FWord, ' ', FCount);
  WHILE NOT EOF(TreeF)
  DO
    BEGIN
      ReadWordLine(TreeF, TreeWord, TreeCount);
      WRITELN(MergeF, TreeWord, ' ', TreeCount)
    END;
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWordLine(F, FWord, FCount);
      WRITELN(MergeF, FWord, ' ', FCount)
    END;   
  RESET(MergeF);
  REWRITE(F);
  CopyFile(MergeF, F)
END;  {Merge}

VAR
  Word: STRING;
  Count: INTEGER;
  Root: WTree;
  CollectF: TEXT;
  I: INTEGER;
BEGIN {Test}
  Root := NIL;
  FillTree(INPUT, Root);
  WRITELN('Tree 1:');
  WriteWordTree(OUTPUT, Root);
  WRITELN;
  REWRITE(CollectF);
  WRITELN('Collect 1:');
  WriteWordTree(CollectF, Root);
  WRITELN;
  I := 2;
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      ClearWordTree(Root);
      FillTree(INPUT, Root);
      WRITELN('Tree ', I, ':');
      WriteWordTree(OUTPUT, Root);
      WRITELN;
      Merge(CollectF, Root);
      RESET(CollectF);
      WRITELN('Collect ', I, ':');
      CopyFile(CollectF, OUTPUT);
      WRITELN;
      I := I + 1
    END
END.  {Test}
