PROGRAM GroupWords(INPUT, OUTPUT);
USES
  WordListTool,
  WordForms;
  
PROCEDURE ReadWordLine(VAR F: TEXT; VAR WordStr: STRING; VAR WordCount: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadWordLine}
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
END;  {ReadWordLine}
            
VAR
  Curr, Head: WordElt;
  First: WordList;

BEGIN {GroupWords}
  First := NIL;
  IF NOT EOF
  THEN
    {������ �� INPUT ������ ���������� ����� � Head}
    ReadWordLine(INPUT, Head.Word, Head.Count);
  {��������� Head � ������}
  AddWord(First, Head);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {������ �� INPUT ������ ���������� ����� � Curr}
      ReadWordLine(INPUT, Curr.Word, Curr.Count);
      IF IsForms(Head.Word, Curr.Word)
      THEN
        {��������� Curr � ����� ������}
        AddWord(First, Curr)
      ELSE
        BEGIN
          {������� ������ ���������� � ����������� � ��������}
          PrintWordList(First);
          {������� ������}
          ClearWordList(First);
          Head := Curr;
          AddWord(First, Head)
        END    
    END;
  PrintWordList(First);
  ClearWordList(First)
END.  {GroupWords}
