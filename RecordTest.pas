PROGRAM RecordTest(INPUT, OUTPUT);
USES MonthIO;
TYPE
  {Month = (NoMonth, Jan, Feb, Mar, Aug, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);}
  DayNum = 1..31;
  ValidYear = 1850..2050;
  Date = RECORD
           Mo: Month;
           Day: DayNum;
           Year: ValidYear
         END;
VAR
  BirthdayDate: Date;
BEGIN {RecordTest}
  READ(BirthdayDate.Day);
  ReadMonth(INPUT, BirthdayDate.Mo);
  READ(BirthdayDate.Year);
  WRITE('Birthday date is ', BirthdayDate.Day, '.');
  WriteMonth(OUTPUT, BirthdayDate.Mo);
  WRITELN('.', BirthdayDate.Year)   
END. {RecordTest}
