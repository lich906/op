PROGRAM InsertionSort(INPUT, OUTPUT);
{��������� ������� �� INPUT}
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  IndexType = 0 .. Max;
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: IndexType;
               END;
VAR
  Arr: RecArray;
  First, Index: IndexType;
  Prev, Curr: IndexType;  
  Extra: CHAR;
  Found: BOOLEAN;

PROCEDURE WriteList(VAR List: RecArray; First: IndexType);
VAR
  Index: IndexType;
BEGIN {WriteList}
  Index := First;
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(List[Index].Key);  
      Index := List[Index].Next
    END;
  WRITELN
END; {WriteList}
  
BEGIN {InsertionSort}
  First := 0;
  Index := 0;
  WHILE NOT EOLN      
  DO
    BEGIN
      {�������� ������ � ������, ���� ��������� ������������, 
      ����� ������������ � �������� �� ������}
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          READ(Extra);
          WRITELN('��������� ��������: ', Extra, '. ����������.');
        END
      ELSE
        BEGIN
          READ(Arr[Index].Key);
          {��������� Arr[Index] � ��������� ������}
          Prev := 0;
          Curr := First;
          {����� �������� Prev � Curr, ���� ���������� ����� ���
          Arr[Prev].Key  <= Arr[Index].Key <= Arr[Curr].Key}
          Found := FALSE;
          WHILE (Curr <> 0) AND (NOT Found)
          DO
            IF Arr[Index].Key > Arr[Curr].Key
            THEN
              BEGIN
                Prev := Curr;
                Curr := Arr[Curr].Next
              END
            ELSE
              Found := TRUE;
          Arr[Index].Next := Curr;
          IF Prev = 0  {������ ������� � ������}
          THEN
            First := Index
          ELSE
            Arr[Prev].Next := Index
        END
    END; {WHILE}
    {������ ������ ������� � Arr[First]}
    WriteList(Arr, First)
END.  {InsertionSort}
