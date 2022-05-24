PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  LenType = 0 .. Len;
  
VAR
  SpaceCode: CHAR;
  {KeySet: SET OF CHAR;}
  ChiperFile: TEXT;
  Msg: Str;
  Code: Chiper;
  I, MsgLen: LenType;

PROCEDURE ReadChiper(VAR CFile: TEXT; VAR Code: Chiper);
VAR
  Key, CodeCh: CHAR;
BEGIN {ReadChiper}
  RESET(CFile);
  {Инициализация на случай отсутсвия кодов в файле}
  FOR CodeCh := 'A' TO 'Z'
  DO
    Code[CodeCh] := CodeCh;
  WHILE NOT EOF(CFile)
  DO
    BEGIN
      IF NOT EOLN(CFile)
      THEN
        BEGIN
          READ(CFile, Key);
          IF NOT EOLN(CFile)
          THEN
            BEGIN
              READ(CFile, CodeCh);
              IF Key IN ['A' .. 'Z']
              THEN
                Code[Key] := CodeCh
              ELSE
                IF Key = ' '
                THEN
                  SpaceCode := CodeCh
            END
        END;
      READLN(CFile)
    END  
END; {ReadChiper}
 
PROCEDURE Encode(VAR S: Str; SLen: LenType);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO SLen
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(SpaceCode)
      ELSE
        WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(ChiperFile, 'ChiperFile.txt');
  ReadChiper(ChiperFile, Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      MsgLen := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          MsgLen := MsgLen + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg, MsgLen)
    END
END.  {Encryption}
