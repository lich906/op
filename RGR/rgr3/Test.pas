PROGRAM Test(INPUT, OUTPUT);
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
  
BEGIN {Test}
  ReadWordLine(INPUT, Head.Word, Head.Count);
  ReadWordLine(INPUT, Curr.Word, Curr.Count);
  WRITELN(Head.Word, ' | ', Curr.Word);
  IF IsForms(Head.Word, Curr.Word)
  THEN
    WRITELN('TRUE')
  ELSE
    WRITELN('FALSE')
END.  {Test}
