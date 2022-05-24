PROGRAM SortDate(INPUT, OUTPUT);
USES DateIO;
TYPE
  FileOfDate = FILE OF Date;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
 
BEGIN {SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  ReadDate(DateFile, VarDate);
  WriteDate(OUTPUT, VarDate);
  WHILE NOT EOF(FInput)
  DO
    {Поместить новую дату в DateFile в соответствующее место}
  {Копируем DateFile в OUTPUT}
END. {SortDate}

