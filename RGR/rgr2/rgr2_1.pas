PROGRAM WordCounter(INPUT, OUTPUT);
USES 
  WordTree;
  
CONST
  Letter = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я', 'ё', 'Ё'];
  UpperLetter = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
  CaseDiff = 32;
 
VAR
  Root: Tree;
  CurrWord: STRING;
  Ch: CHAR;

FUNCTION Low(Ch: CHAR): CHAR;
{Возвращает соответсвующий символ в нижнем регистре}
BEGIN {Low}
  IF Ch IN UpperLetter
  THEN
    Low := CHR(ORD(Ch) + CaseDiff)
  ELSE
    Low := Ch
END;  {Low}
  
BEGIN {WordCounter}
  CurrWord := '';
  Root := NIL;
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);
      IF Ch IN Letter
      THEN
        CurrWord := CurrWord + Low(Ch)
      ELSE
        BEGIN
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
