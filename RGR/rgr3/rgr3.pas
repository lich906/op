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
    {Читаем из INPUT строку статистики слова в Head}
    ReadWordLine(INPUT, Head.Word, Head.Count);
  {Добавляем Head в список}
  AddWord(First, Head);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {Читаем из INPUT строку статистики слова в Curr}
      ReadWordLine(INPUT, Curr.Word, Curr.Count);
      IF IsForms(Head.Word, Curr.Word)
      THEN
        {Добавляем Curr в конец списка}
        AddWord(First, Curr)
      ELSE
        BEGIN
          {Выводим строку статистики в соответсвии с форматом}
          PrintWordList(First);
          {Очищаем список}
          ClearWordList(First);
          Head := Curr;
          AddWord(First, Head)
        END    
    END;
  PrintWordList(First);
  ClearWordList(First)
END.  {GroupWords}
