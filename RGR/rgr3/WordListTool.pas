UNIT WordListTool;

INTERFACE
CONST
  WordSeparator = ',';
  CountSeparator = ': ';
  
TYPE
  WordList = ^WordElt;
  WordElt = RECORD
              Word: STRING;
              Count: INTEGER;
              Next: WordList
            END;
                    
PROCEDURE AddWord(VAR Ptr: WordList; NewElt: WordElt);
PROCEDURE PrintWordList(Ptr: WordList);
PROCEDURE ClearWordList(VAR Ptr: WordList);

IMPLEMENTATION
PROCEDURE AddWord(VAR Ptr: WordList; NewElt: WordElt);
BEGIN {AddWord}
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Word := NewElt.Word;
      Ptr^.Count := NewElt.Count;
      Ptr^.Next := NIL
    END
  ELSE
    AddWord(Ptr^.Next, NewElt)
END;  {AddWord}

PROCEDURE PrintWordList(Ptr: WordList);
VAR
  TmpPtr: WordList;
  TotalCount: LONGINT;
BEGIN {PrintWordList}
  TmpPtr := Ptr;
  TotalCount := 0;
  WHILE TmpPtr <> NIL
  DO
    BEGIN
      WRITE(TmpPtr^.Word);
      TotalCount := TotalCount + TmpPtr^.Count;
      IF TmpPtr^.Next <> NIL
      THEN
        WRITE(WordSeparator)
      ELSE
        WRITE(CountSeparator);
      TmpPtr := TmpPtr^.Next
    END;
  WRITELN(TotalCount)
END;  {PrintWordList}

PROCEDURE ClearWordList(VAR Ptr: WordList);
BEGIN {ClearWordList}
  IF Ptr <> NIL
  THEN
    BEGIN
      ClearWordList(Ptr^.Next);
      DISPOSE(Ptr);
      Ptr := NIL
    END
END;  {ClearWordList}
BEGIN
END.
