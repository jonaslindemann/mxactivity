unit mx;

interface

uses System.Generics.Collections, Vcl.Grids, SysUtils, System.Win.Registry,
  Windows, System.IOUtils, System.Classes;

type

  TMxSettings = class(TObject)
  private
    FSaveLocation: string;
    FSaveFrequency: integer;
    FLastStart : string;

    procedure SetSaveFrequency(const Value: integer);
    procedure SetSaveLocation(const Value: string);
    procedure SetLastStart(const Value: string);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Save;
    procedure Load;

    property SaveLocation : string read FSaveLocation write SetSaveLocation;
    property SaveFrequency : integer read FSaveFrequency write SetSaveFrequency;
    property LastStart : string read FLastStart write SetLastStart;
  end;

  TMxParticipant = class(TObject)
  private
    FFirstName : string;
    FLastName : string;
    FPersonNbr : string;
    FClubName : string;
    FTransponder : string;
    FComment : string;
    FAdmin : boolean;
    FFirstAdmin : boolean;
    FDate : string;
    FTime : string;
    FPhoneNumber: string;
    FTrack : string;

    procedure SetClubName(const Value: string);
    procedure SetFirstName(const Value: string);
    procedure SetLastName(const Value: string);
    procedure SetPersonNbr(const Value: string);
    procedure SetTransponder(const Value: string);
    procedure SetComment(const Value: string);
    procedure SetAdmin(const Value: boolean);
    procedure SetFirstAdmin(const Value: boolean);
    procedure SetDate(const Value: string);
    procedure SetTime(const Value: string);
    procedure SetPhoneNumber(const Value: string);
    procedure SetTrack(const Value: string);
  public
    constructor Create;

    procedure WriteCSVToFile(var f : TextFile);
    procedure ReadFromCSVFile(var f : TextFile);

    property FirstName : string read FFirstName write SetFirstName;
    property LastName : string read FLastName write SetLastName;
    property PersonNbr : string read FPersonNbr write SetPersonNbr;
    property ClubName : string read FClubName write SetClubName;
    property Transponder : string read FTransponder write SetTransponder;
    property Comment : string read FComment write SetComment;
    property Admin : boolean read FAdmin write SetAdmin;
    property FirstAdmin : boolean read FFirstAdmin write SetFirstAdmin;
    property Date : string read FDate write SetDate;
    property Time : string read FTime write SetTime;
    property PhoneNumber : string read FPhoneNumber write SetPhoneNumber;
    property Track : string read FTrack write SetTrack;
  end;

  TMxActivitySheet = class(TObject)
  private
    FParticipants : TList<TMxParticipant>;
    FStringGrid : TStringGrid;
    FSaveLocation : string;
    FFilename : string;
    FName : string;
    procedure SetStringGrid(const Value: TStringGrid);
    procedure SetSaveLocation(const Value: string);
    procedure SetFilename(const Value: string);
    procedure SetName(const Value: string);
    function GetFilename: string;
    function GetFullPath: string;
  public
    constructor Create(Name : string);
    destructor Destroy; override;

    procedure Clear;

    procedure SaveCSV;
    procedure ReadCSV;

    function HasTables : boolean;

    procedure AddExampleData;

    procedure Add(FirstName, LastName, PersonNbr: string; ClubName : string = ''; Transponder : string = ''; Track : string = '');
    procedure AddAdmin(FirstName, LastName, PersonNbr, PhoneNumber : string);
    procedure AddFirstAdmin(FirstName, LastName, PersonNbr, PhoneNumber : string);
    procedure RemoveAt(idx : integer);

    procedure UpdateGrid;
    procedure UpdateAdminGrid;
    procedure UpdateRentalGrid;
    procedure AutoSizeGrid;

    property Participants : TList<TMxParticipant> read FParticipants;

    property StringGrid : TStringGrid read FStringGrid write SetStringGrid;

    property SaveLocation : string read FSaveLocation write SetSaveLocation;
    property Filename : string read GetFilename write SetFilename;
    property FullPath : string read GetFullPath;
    property Name : string read FName write SetName;
  end;

implementation

{ TMxParticipant }

constructor TMxParticipant.Create;
var
  Today : TDateTime;
begin
  inherited Create;

  FFirstName:='Sven';
  FLastName:='Svensson';
  FPersonNbr:='000000-0000';
  FClubName:='SMK';
  FTransponder:='';
  FComment:='';
  FAdmin:=false;
  FFirstAdmin:=false;

  Today:=Now;
  FDate:=DateToStr(Today);
  Ftime:=TimeToStr(Today);
end;

procedure TMxParticipant.SetAdmin(const Value: boolean);
begin
  FAdmin := Value;
end;

procedure TMxParticipant.SetClubName(const Value: string);
begin
  FClubName := Value;
end;

procedure TMxParticipant.SetComment(const Value: string);
begin
  FComment := Value;
end;

procedure TMxParticipant.SetDate(const Value: string);
begin
  FDate := Value;
end;

procedure TMxParticipant.SetTime(const Value: string);
begin
  FTime := Value;
end;

procedure TMxParticipant.SetFirstAdmin(const Value: boolean);
begin
  FFirstAdmin := Value;
end;

procedure TMxParticipant.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TMxParticipant.SetLastName(const Value: string);
begin
  FLastName := Value;
end;

procedure TMxParticipant.SetPersonNbr(const Value: string);
begin
  FPersonNbr := Value;
end;

procedure TMxParticipant.SetPhoneNumber(const Value: string);
begin
  FPhoneNumber := Value;
end;

procedure TMxParticipant.SetTrack(const Value: string);
begin
  FTrack := Value;
end;

procedure TMxParticipant.SetTransponder(const Value: string);
begin
  FTransponder := Value;
end;

procedure TMxParticipant.WriteCSVToFile(var f: TextFile);
begin
  Write(f,
    '"'+FFirstName+'";'+
    '"'+FLastName+'";'+
    '"'+FPersonNbr+'";'+
    '"'+FPhoneNumber+'";'+
    '"'+FClubName+'";'+
    '"'+FTransponder+'";'+
    '"'+FComment+'";'+
    '"'+FTrack+'";'+
    '"'+FDate+'";'+
    '"'+FTime+'";');

  if FFirstAdmin then
    WriteLn(f, 'JA')
  else
    Writeln(f, 'NEJ');
end;

procedure TMxParticipant.ReadFromCSVFile(var f: TextFile);
var
  Line : string;
  Items : TStringList;
  AdminString : string;
  i : integer;
begin
  ReadLn(f, Line);

  Items:=TStringList.Create;
  Items.Delimiter:=';';
  Items.DelimitedText:=Line;

  FFirstName:=Items[0];
  FLastName:=Items[1];
  FPersonNbr:=Items[2];
  FPhoneNumber:=Items[3];
  FClubName:=Items[4];
  FTransponder:=Items[5];
  FComment:=Items[6];
  FTrack:=Items[7];
  FDate:=Items[8];
  FTime:=Items[9];
  if Items.Count>10 then
  begin
    AdminString:=Items[10];
    if AdminString = 'JA' then
      FFirstAdmin:=true
    else
      FFirstAdmin:=false;
  end;

  Items.Free;
end;


{ TMxActivitySheet }

constructor TMxActivitySheet.Create(Name : string);
begin
  FName:=Name;
  FParticipants:=TList<TMxParticipant>.Create;
  FStringGrid:=nil;
  FSaveLocation:='';
end;

destructor TMxActivitySheet.Destroy;
begin
  FParticipants.Destroy;
  inherited;
end;

function TMxActivitySheet.GetFilename: string;
var
  Today : TDateTime;
begin
  Today:=Now;
  FFilename:=DateToStr(Today)+'-activity-'+Name+'.csv';
  Result:=FFileName;
end;

function TMxActivitySheet.GetFullPath: string;
begin
  if FSaveLocation<>'' then
    Result:=Self.SaveLocation+'\\'+Self.Filename
  else
    Result:=Self.Filename;
end;

function TMxActivitySheet.HasTables: boolean;
begin
  Result:=TFile.Exists(Self.FullPath)
end;

procedure TMxActivitySheet.Clear;
var
  P : TMxParticipant;
begin
  for P in FParticipants do
    P.Free;

  FParticipants.Clear;
end;

procedure TMxActivitySheet.AddExampleData;
begin
  Self.Add('AdFilip', 'Elliott', '00000-0000', 'SMK', '123456');
  Self.Add('Dawood', 'Blair', '00000-0000', 'SMK', '123456');
  Self.Add('Michalina', 'Penn', '00000-0000', 'SMK', '123456');
  Self.Add('Bodhi', 'Fernandez', '00000-0000', 'SMK', '123456');
  Self.Add('Kerry', 'Burn', '00000-0000', 'SMK', '123456');
  Self.Add('Conor', 'Roberts', '00000-0000', 'SMK', '123456');
  Self.Add('Kabir', 'Stokes', '00000-0000', 'SMK', '123456');
  Self.Add('Mehmet', 'Barrow', '00000-0000', 'SMK', '123456');
  Self.Add('Fay', 'Mellor', '00000-0000', 'SMK', '123456');
  Self.Add('Danica', 'Mcdowell', '00000-0000', 'SMK', '123456');
  Self.Add('Nada', 'Mosley', '00000-0000', 'SMK', '123456');
  Self.Add('Gracie-May', 'Copeland', '00000-0000', 'SMK', '123456');
  Self.Add('Kylan', 'Howells', '00000-0000', 'SMK', '123456');
  Self.Add('Soren', 'Payne', '00000-0000', 'SMK', '123456');
  Self.Add('Sherri', 'Ryan', '00000-0000', 'SMK', '123456');
  Self.Add('Esme', 'Matthews', '00000-0000', 'SMK', '123456');
  Self.Add('Konnor', 'Guy', '00000-0000', 'SMK', '123456');
  Self.Add('Oskar', 'Barajas', '00000-0000', 'SMK', '123456');
  Self.Add('Harper-Rose', 'West', '00000-0000', 'SMK', '123456');
  Self.Add('Adelaide', 'Orozco', '00000-0000', 'SMK', '123456');
end;

procedure TMxActivitySheet.AutoSizeGrid;
const
  MIN_COL_WIDTH = 35;
var
  Col : Integer;
  ColWidth, CellWidth: Integer;
  Row: Integer;
  Height : integer;
  MaxHeight : integer;

begin
  FStringGrid.Canvas.Font.Assign(FStringGrid.Font);
  for Col := 0 to FStringGrid.ColCount -1 do
  begin
    ColWidth := FStringGrid.Canvas.TextWidth(FStringGrid.Cells[Col, 0]);
    for Row := 0 to FStringGrid.RowCount - 1 do
    begin
      CellWidth := FStringGrid.Canvas.TextWidth(FStringGrid.Cells[Col, Row]);
      if CellWidth > ColWidth then
        FStringGrid.ColWidths[Col] := CellWidth + MIN_COL_WIDTH
      else
        FStringGrid.ColWidths[Col] := ColWidth + MIN_COL_WIDTH;
    end;
  end;

  MaxHeight:=-1;

  for Row := 0 to FStringGrid.RowCount - 1 do
  begin
    Height := FStringGrid.Canvas.TextHeight(FStringGrid.Cells[1, Row]);
    if Height > MaxHeight then
      MaxHeight:=Height
  end;

  for Row := 0 to FStringGrid.RowCount - 1 do
    FStringGrid.RowHeights[Row]:=MaxHeight+3;
end;

procedure TMxActivitySheet.Add(FirstName, LastName, PersonNbr,
  ClubName, Transponder, Track: string);
var
  Participant : TMxParticipant;
begin
  Participant:=TMxParticipant.Create;
  Participant.FirstName:=FirstName;
  Participant.LastName:=LastName;
  Participant.PersonNbr:=PersonNbr;
  Participant.ClubName:=ClubName;
  Participant.Transponder:=Transponder;
  Participant.Track:=Track;
  Self.FParticipants.Add(Participant);
end;

procedure TMxActivitySheet.AddAdmin(FirstName, LastName, PersonNbr, PhoneNumber : string);
var
  Participant : TMxParticipant;
begin
  Participant:=TMxParticipant.Create;
  Participant.FirstName:=FirstName;
  Participant.LastName:=LastName;
  Participant.PersonNbr:=PersonNbr;
  Participant.PhoneNumber:=PhoneNumber;
  Participant.Admin:=true;
  Self.FParticipants.Add(Participant);
end;

procedure TMxActivitySheet.AddFirstAdmin(FirstName, LastName, PersonNbr, PhoneNumber : string);
var
  Participant : TMxParticipant;
begin
  Participant:=TMxParticipant.Create;
  Participant.FirstName:=FirstName;
  Participant.LastName:=LastName;
  Participant.PersonNbr:=PersonNbr;
  Participant.PhoneNumber:=PhoneNumber;
  Participant.Admin:=true;
  Participant.FirstAdmin:=true;
  Self.FParticipants.Add(Participant);
end;


procedure TMxActivitySheet.RemoveAt(idx: integer);
begin
  FParticipants.Delete(idx);
end;

procedure TMxActivitySheet.ReadCSV;
var
  f : TextFile;
  P : TMxParticipant;
  Fname : string;
begin

  Self.FParticipants.Clear;

  if TFile.Exists(Self.FullPath) then
  begin
    AssignFile(f, Self.FullPath);

    Reset(f);

    while not Eof(f) do
    begin
      P:=TMxParticipant.Create;
      P.ReadFromCSVFile(f);
      FParticipants.Add(P);
    end;

    CloseFile(f);
  end;

end;

procedure TMxActivitySheet.SaveCSV;
var
  f : TextFile;
  P : TMxParticipant;
  Fname : string;
begin


  if TFile.Exists(Self.FullPath) then
    TFile.Copy(Self.FullPath, Self.FullPath+'.bak', true);

  AssignFile(f, Self.FullPath);

  Rewrite(f);

  for P in FParticipants do
    P.WriteCSVToFile(f);

  CloseFile(f);
end;

procedure TMxActivitySheet.SetFilename(const Value: string);
begin
  FFilename := Value;
end;

procedure TMxActivitySheet.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TMxActivitySheet.SetSaveLocation(const Value: string);
begin
  FSaveLocation := Value;
end;

procedure TMxActivitySheet.SetStringGrid(const Value: TStringGrid);
begin
  FStringGrid := Value;
end;

procedure TMxActivitySheet.UpdateGrid;
var
  P : TMxParticipant;
  Row : integer;
begin
  if assigned(FStringGrid) then
  begin
    FStringGrid.RowCount:=FParticipants.Count+1;
    //FStringGrid.FixedRows:=1;
    FStringGrid.ColCount:=9;
    FStringGrid.Cells[0,0]:='Nr';
    FStringGrid.Cells[1,0]:='Förnamn';
    FStringGrid.Cells[2,0]:='Efternamn';
    FStringGrid.Cells[3,0]:='Klubb';
    FStringGrid.Cells[4,0]:='Transponder';
    FStringGrid.Cells[5,0]:='Bana';
    FStringGrid.Cells[6,0]:='Datum';
    FStringGrid.Cells[7,0]:='Tid';
    FStringGrid.Cells[8,0]:='Kommentar';

    Row:=1;

    for P in FParticipants do
    begin
      FStringGrid.Cells[0,Row]:=IntToStr(Row);
      FStringGrid.Cells[1,Row]:=P.FirstName;
      FStringGrid.Cells[2,Row]:=P.LastName;
      FStringGrid.Cells[3,Row]:=P.ClubName;
      FStringGrid.Cells[4,Row]:=P.Transponder;
      FStringGrid.Cells[5,Row]:=P.Track;
      FStringGrid.Cells[6,Row]:=P.Date;
      FStringGrid.Cells[7,Row]:=P.Time;
      FStringGrid.Cells[8,Row]:=P.Comment;
      inc(Row);
    end;
    AutoSizeGrid;
  end;
end;

procedure TMxActivitySheet.UpdateRentalGrid;
var
  P : TMxParticipant;
  Row : integer;
begin
  if assigned(FStringGrid) then
  begin
    FStringGrid.RowCount:=FParticipants.Count+1;
    //FStringGrid.FixedRows:=1;
    FStringGrid.ColCount:=5;
    FStringGrid.Cells[0,0]:='Nr';
    FStringGrid.Cells[1,0]:='Förnamn';
    FStringGrid.Cells[2,0]:='Efternamn';
    FStringGrid.Cells[5,0]:='Datum';
    FStringGrid.Cells[6,0]:='Tid';

    Row:=1;

    for P in FParticipants do
    begin
      FStringGrid.Cells[0,Row]:=IntToStr(Row);
      FStringGrid.Cells[1,Row]:=P.FirstName;
      FStringGrid.Cells[2,Row]:=P.LastName;
      FStringGrid.Cells[3,Row]:=P.Date;
      FStringGrid.Cells[4,Row]:=P.Time;
      inc(Row);
    end;
    AutoSizeGrid;
  end;
end;

procedure TMxActivitySheet.UpdateAdminGrid;
var
  P : TMxParticipant;
  Row : integer;
begin
  if assigned(FStringGrid) then
  begin
    //FStringGrid.FixedRows:=1;
    FStringGrid.RowCount:=FParticipants.Count+1;
    FStringGrid.ColCount:=7;
    FStringGrid.Cells[0,0]:='Nr';
    FStringGrid.Cells[1,0]:='Förnamn';
    FStringGrid.Cells[2,0]:='Efternamn';
    //FStringGrid.Cells[3,0]:='Personnummer';
    FStringGrid.Cells[3,0]:='Telefon';
    FStringGrid.Cells[4,0]:='TA';
    FStringGrid.Cells[5,0]:='Datum';
    FStringGrid.Cells[6,0]:='Tid';
    FStringGrid.Cells[7,0]:='Kommentar';

    Row:=1;

    for P in FParticipants do
    begin
      FStringGrid.Cells[0,Row]:=IntToStr(Row);
      FStringGrid.Cells[1,Row]:=P.FirstName;
      FStringGrid.Cells[2,Row]:=P.LastName;
      //FStringGrid.Cells[3,Row]:=P.PersonNbr;
      FStringGrid.Cells[3,Row]:=P.PhoneNumber;

      if P.FirstAdmin then
        FStringGrid.Cells[4,Row]:='JA'
      else
        FStringGrid.Cells[4,Row]:='NEJ';

      FStringGrid.Cells[5,Row]:=P.Date;
      FStringGrid.Cells[6,Row]:=P.Time;
      FStringGrid.Cells[7,Row]:=P.Comment;
      inc(Row);
    end;
    AutoSizeGrid;
  end;
end;


{ TMxSettings }

constructor TMxSettings.Create;
var
  Registry : TRegistry;
begin

  FSaveLocation:='';
  FSaveFrequency:=5;
  FLastStart:='';
end;

destructor TMxSettings.Destroy;
begin

  inherited;
end;

procedure TMxSettings.Load;
var
  SettingsFile: TRegistryIniFile;
begin
  SettingsFile := TRegistryIniFile.Create('Software\MxActivty');

  try
    FSaveLocation:=SettingsFile.ReadString('Settings', 'SaveLocation', '');
    FSaveFrequency:=SettingsFile.ReadInteger('Settings', 'SaveFrequency', -1);
    FLastStart:=SettingsFile.ReadString('Settings', 'LastStart', '');
  finally
    SettingsFile.Free;
  end;
end;

procedure TMxSettings.Save;
var
  SettingsFile: TRegistryIniFile;
begin
  SettingsFile := TRegistryIniFile.Create('Software\MxActivty');

  try
    SettingsFile.WriteString('Settings', 'SaveLocation', FSaveLocation);
    SettingsFile.WriteInteger('Settings', 'SaveFrequency', FSaveFrequency);
    SettingsFile.WriteString('Settings', 'LastStart', FLastStart);
  finally
    SettingsFile.Free;
  end;
end;

procedure TMxSettings.SetLastStart(const Value: string);
begin
  FLastStart := Value;
end;

procedure TMxSettings.SetSaveFrequency(const Value: integer);
begin
  FSaveFrequency := Value;
end;

procedure TMxSettings.SetSaveLocation(const Value: string);
begin
  FSaveLocation := Value;
end;

end.
