UNIT WordTree;

INTERFACE
CONST
  TreeLimit = 30000;
  
TYPE
  WTree = ^NodeWord;
  NodeWord = RECORD
               Word: STRING;
               Count: INTEGER;
               Left, Right: WTree
             END;
                        
FUNCTION GetWord(Ptr: WTree; KeyWord: STRING): WTree;{����� ����� � ������. ���������� ��������� �� ��������� �����. ���� �� �������, ���������� NIL.}
PROCEDURE InsertWord(VAR Ptr: WTree; Data: STRING);  {��������� ����� � ������}
PROCEDURE WriteWordTree(VAR F: TEXT; Ptr: WTree);    {������������� ������ � ��������������� �������}
PROCEDURE ClearWordTree(VAR Ptr: WTree);             {������� ������}
PROCEDURE FillTree(VAR F: TEXT; VAR Ptr: WTree);     {��������� ������ �������}
     
IMPLEMENTATION
USES
  WordReadingTool;
         
PROCEDURE InsertWord(VAR Ptr: WTree; Data: STRING);
{���� Ptr - NIL, ������� ����� ����.
 ���� Ptr<> NIL, ���������� ���������� � ����� ��� ������ ���������, 
                 � ����������� �� �������� ���� Word}
BEGIN {InsertWord}
  IF Ptr = NIL
  THEN
    BEGIN {������� ���� �� ��������� Data}
      NEW(Ptr);
      Ptr^.Word := Data;
      Ptr^.Count := 1;
      Ptr^.Left := NIL;
      Ptr^.Right := NIL
    END
  ELSE
    IF Ptr^.Word > Data
    THEN
      InsertWord(Ptr^.Left, Data)
    ELSE
      InsertWord(Ptr^.Right, Data)
END;  {InsertWord}

FUNCTION GetWord(Ptr: WTree; KeyWord: STRING): WTree;
{���� Ptr^.Word = KeyWord - �������.
 ���� Ptr^.Word<> KeyWord, ���������� ��������� � ����� ��� ������ ���������,
                           � ����������� �� �������� ���� Word}
VAR
  FoundPtr: WTree;
BEGIN {GetWord}
  FoundPtr := NIL;
  IF Ptr <> NIL
  THEN
    BEGIN  
      IF Ptr^.Word = KeyWord
      THEN
        FoundPtr := Ptr
      ELSE
        IF Ptr^.Word > KeyWord
        THEN
          FoundPtr := GetWord(Ptr^.Left, KeyWord)
        ELSE
          FoundPtr := GetWord(Ptr^.Right, KeyWord)
    END;
  GetWord := FoundPtr  
END;  {GetWord}

PROCEDURE WriteWordTree(VAR F: TEXT; Ptr: WTree);
{���������� � ���� F ��������� �����, �������, ��������� ������}
BEGIN {WriteWordTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      WriteWordTree(F, Ptr^.Left);
      WRITELN(F, Ptr^.Word, ' ', Ptr^.Count);
      WriteWordTree(F, Ptr^.Right)
    END
END;  {WriteWordTree}

PROCEDURE ClearWordTree(VAR Ptr: WTree);
{������� ��������� �����, ��������� ������, �������}
BEGIN {ClearWordTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      ClearWordTree(Ptr^.Left);
      ClearWordTree(Ptr^.Right);
      DISPOSE(Ptr);
      Ptr := NIL
    END
END;  {ClearWordTree}

PROCEDURE FillTree(VAR F: TEXT; VAR Ptr: WTree);
VAR
  FoundWord: WTree;
  CurrWord: STRING;
  I: 0 .. TreeLimit;
BEGIN {FillTree}
  I := 0;
  Skip(F);
  WHILE (NOT EOF(F)) AND (I < TreeLimit)
  DO
    BEGIN
      ReadWord(F, CurrWord);
      FoundWord := GetWord(Ptr, CurrWord);
      IF FoundWord <> NIL
      THEN
        FoundWord^.Count := FoundWord^.Count + 1
      ELSE
        BEGIN
          InsertWord(Ptr, CurrWord);
          I := I + 1
        END;
      Skip(F)
    END
END;  {FillTree}
END.                
