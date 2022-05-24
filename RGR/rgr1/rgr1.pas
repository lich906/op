PROGRAM WordCounter(INPUT, OUTPUT);
CONST
  Max = 5000;
  Letter = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я', 'ё', 'Ё', '-'];
  UpperLetter = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
  RegDiff = 32;
  
TYPE
  Word = RECORD
           Key: STRING;
           Count: INTEGER
         END;
  WordArr = ARRAY [1 .. Max] OF Word;
  IndexType = 0 .. Max;

VAR
  Arr: WordArr;
  Index, WordNumber: IndexType;
  Ch: CHAR;
  WordString: STRING;

FUNCTION Low(Ch: CHAR): CHAR;
BEGIN {Low}
  IF Ch IN UpperLetter
  THEN
    Low := CHR(ORD(Ch) + RegDiff)
  ELSE
    Low := Ch
END;  {Low}

PROCEDURE WordSort(VAR WArr: WordArr; Max: IndexType);
{Сортировка массива слов по значениям ключа}
VAR
  Tmp: Word;
  I: IndexType;
  Sorted: BOOLEAN;
BEGIN {WordSort}
  Sorted := FALSE;
  WHILE NOT Sorted
  DO
    BEGIN
      Sorted := TRUE;
      FOR I := 1 TO (Max - 1)
      DO
        IF WArr[I].Key > WArr[I + 1].Key
        THEN
          BEGIN
            Sorted := FALSE;
            Tmp := WArr[I];
            WArr[I] := WArr[I + 1];
            WArr[I + 1] := Tmp
          END
    END  
END;   {WordSort}

FUNCTION GetWordIndex(VAR WArr: WordArr; Max: IndexType; KeyWord: STRING): IndexType;
{Поиск слова в массиве. Возвращает индекс найденного слова.
 Если не найдено, возвращает 0.}
VAR
  I, RetVal: IndexType;
  Found: BOOLEAN;
BEGIN {FindWord}
  Found := FALSE;
  I := 0;
  RetVal := 0;
  WHILE (NOT Found) AND (I < Max)
  DO
    BEGIN
      I := I + 1;
      IF WArr[I].Key = KeyWord
      THEN
        BEGIN
          RetVal := I;
          Found := TRUE
        END
    END;
  GetWordIndex := RetVal  
END;  {FindWord}

BEGIN {WordCounter}
  Index := 1;
  WordString := '';
  WHILE (NOT EOF) AND (Index <= Max)
  DO
    BEGIN
      READ(Ch);
      IF Ch IN Letter
      THEN
        BEGIN
          WordString := WordString + Low(Ch);
          Arr[Index].Count := 1
        END
      ELSE
        BEGIN
          {Проверка на наличие слова в массиве}
          IF Index > 1
          THEN
            BEGIN
              IF GetWordIndex(Arr, Index - 1, WordString) <> 0
              THEN {Слово в массиве найдено}
                BEGIN
                  INC(Arr[GetWordIndex(Arr, Index - 1, WordString)].Count);
                  Index := Index - 1
                END
              ELSE
                Arr[Index].Key := WordString
            END
          ELSE
            Arr[Index].Key := WordString;
          WordString := '';
          Index := Index + 1;
          {Пропускаем небуквенные символы}
          WHILE NOT(INPUT^ IN Letter) AND (NOT EOF)
          DO
            GET(INPUT)
        END
    END;
  {Корректировка подсчета последнего слова и количества слов}
  IF Ch IN Letter
  THEN
    BEGIN
      WordNumber := Index;
      IF GetWordIndex(Arr, WordNumber - 1, Arr[WordNumber].Key) <> 0
      THEN
        BEGIN
          INC(Arr[GetWordIndex(Arr, WordNumber - 1, Arr[WordNumber].Key)].Count);
          Arr[WordNumber].Key := '';
          WordNumber := WordNumber - 1
        END
    END
  ELSE
    WordNumber := Index - 1;
  WordSort(Arr, WordNumber);
  {Выводим полученный массив}      
  FOR Index := 1 TO WordNumber
  DO
    WRITELN(Arr[Index].Key, ' ', Arr[Index].Count);  
END. {WordCounter}
