PROGRAM WordCounter(INPUT, OUTPUT);
USES 
  WordTool;
  
CONST
  Letter = ['A' .. 'Z', 'a' .. 'z', 'À' .. 'ß', 'à' .. 'ÿ', '¸', '¨', '-'];
   
VAR
  Root: Tree;
  CurrWord: STRING;
  Ch: CHAR;
  
BEGIN {WordCounter}
  CurrWord := '';
  Root := NIL;
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);
      IF Ch IN Letter
      THEN
        CurrWord := CurrWord + Ch
      ELSE
        BEGIN
          LowStr(CurrWord);
          IF GetWord(Root, CurrWord) <> NIL
          THEN
            INC(GetWord(Root, CurrWord)^.Count)
          ELSE
            InsertWord(Root, CurrWord);
          CurrWord := '';
          WHILE NOT(INPUT^ IN Letter) AND (NOT EOF)
          DO
            GET(INPUT)
        END
    END;
  PrintWordTree(Root)
END.  {WordCounter}
