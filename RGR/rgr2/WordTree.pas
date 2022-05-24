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
                        
FUNCTION GetWord(Ptr: WTree; KeyWord: STRING): WTree;{Поиск слова в дереве. Возвращает указатель на найденное слово. Если не найдено, возвращает NIL.}
PROCEDURE InsertWord(VAR Ptr: WTree; Data: STRING);  {Вставляет слово в дерево}
PROCEDURE WriteWordTree(VAR F: TEXT; Ptr: WTree);    {Распечатывает дерево в отсортированном порядке}
PROCEDURE ClearWordTree(VAR Ptr: WTree);             {Очишает дерево}
PROCEDURE FillTree(VAR F: TEXT; VAR Ptr: WTree);     {Заполняет дерево словами}
     
IMPLEMENTATION
USES
  WordReadingTool;
         
PROCEDURE InsertWord(VAR Ptr: WTree; Data: STRING);
{Если Ptr - NIL, создаем новый лист.
 Если Ptr<> NIL, рекурсивно спускаемся в левое или правое поддерево, 
                 в зависимости от значения поля Word}
BEGIN {InsertWord}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
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
{Если Ptr^.Word = KeyWord - найдено.
 Если Ptr^.Word<> KeyWord, рекурсивно спукаемся в левое или правое поддерево,
                           в зависимости от значения поля Word}
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
{Записывает в файл F поддерево слева, вершину, поддерево справа}
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
{Очищает поддерево слева, поддерево справа, вершину}
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
