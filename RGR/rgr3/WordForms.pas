UNIT WordForms;

INTERFACE
VAR
  Endings: TEXT;
FUNCTION IsForms(Str1, Str2: STRING): BOOLEAN;

IMPLEMENTATION
FUNCTION IsEnding(Ending: STRING): BOOLEAN;
VAR
  Curr: STRING;
  Found: BOOLEAN;
BEGIN {IsEnding}
  RESET(Endings);
  Found := FALSE;
  IF Ending <> ''
  THEN
    WHILE (NOT EOF(Endings)) AND (NOT Found)
    DO
      BEGIN
        READLN(Endings, Curr);
        IF Curr = Ending
        THEN
          Found := TRUE
      END
  ELSE
    Found := TRUE;
  IsEnding := Found 
END;  {IsEnding}

FUNCTION IsForms(Str1, Str2: STRING): BOOLEAN;
VAR
  I, J, MinLength: INTEGER;
  End1, End2: STRING;
BEGIN {IsForms}
  I := 0;
  End1 := '';
  End2 := '';
  IF LENGTH(Str1) < LENGTH(Str2)
  THEN
    MinLength := LENGTH(Str1)
  ELSE
    MinLength := LENGTH(Str2);  
  REPEAT
    I := I + 1
  UNTIL (Str1[I] <> Str2[I]) OR (I > MinLength);  
  IF I <= LENGTH(Str1)
  THEN
    FOR J := I TO LENGTH(Str1)
    DO
      End1 := End1 + Str1[J];      
  IF I <= LENGTH(Str2)
  THEN
    FOR J := I TO LENGTH(Str2)
    DO
      End2 := End2 + Str2[J];
  IF (IsEnding(End1)) AND (IsEnding(End2))
  THEN
    IsForms := TRUE
  ELSE
    IsForms := FALSE
END;  {IsForms}

BEGIN
  ASSIGN(Endings, 'Endings.txt')
END.
