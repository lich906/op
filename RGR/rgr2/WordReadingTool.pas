UNIT WordReadingTool;

INTERFACE
CONST
  Letter = ['A' .. 'Z', 'a' .. 'z', '�' .. '�', '�' .. '�', '�', '�'];
  UpperLetter = ['A' .. 'Z', '�' .. '�', '�'];
  CaseDiff = 32;
  Hyphen = '-';
  Apostrophe = '�';
  
PROCEDURE ReadWord(VAR F: TEXT; VAR Word: STRING);    
{��������� ����� �� ����� � ���������� Word.
������ ��������� ������������������ �������� ��-�� Letter.}
                                                       
PROCEDURE Skip(VAR F: TEXT);
{���������� ������� �� �������� �� ��������� Letter}
  
PROCEDURE ReadWordLine(VAR F: TEXT; VAR WordStr: STRING; VAR WordCount: INTEGER);
{��������� ������ ������� "����� ����������"
 � WordStr - �����, � WordCount - ����������}
 
IMPLEMENTATION
FUNCTION Low(Ch: CHAR): CHAR;
{���������� �������������� ������ � ������ ��������}
BEGIN {Low}
  IF Ch IN UpperLetter
  THEN
    Low := CHR(ORD(Ch) + CaseDiff)
  ELSE
    Low := Ch
END;  {Low}

PROCEDURE ReadWord(VAR F: TEXT; VAR Word: STRING);
{��������� � ����� ������ Word ��������� ������ �� �����, 
 ���� �� ���������� ����������� ������}
VAR
  Ch: CHAR;
BEGIN {ReadWord}
  Word := '';
  WHILE (F^ IN Letter) AND (NOT EOF(F))
  DO
    BEGIN
      READ(Ch);
      Word := Word + Low(Ch);
      CASE F^ OF
        Hyphen:     BEGIN Word := Word + Hyphen; GET(F) END;
        Apostrophe: BEGIN Word := Word + Apostrophe; GET(F) END
      END  
    END
END;  {ReadWord}

PROCEDURE Skip(VAR F: TEXT);
{���������� ������� �� �������� �� ��������� Letter}
BEGIN {Skip}
  WHILE NOT(F^ IN Letter) AND NOT EOF(F)
  DO
    GET(F)  
END;  {Skip}

PROCEDURE ReadWordLine(VAR F: TEXT; VAR WordStr: STRING; VAR WordCount: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadWordLine}
  IF NOT EOF(F)
  THEN
    BEGIN
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
    END
END;  {ReadWordLine}

END.
