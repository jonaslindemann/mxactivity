unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  mx, Vcl.ExtCtrls, Vcl.Mask, Vcl.OleCtrls, SHDocVw;

type
  TMxActivityForm = class(TForm)
    ActivityPages: TPageControl;
    Training85Sheet: TTabSheet;
    Training125Sheet: TTabSheet;
    TrainingAdminSheet: TTabSheet;
    ActivitySheetGrid85: TStringGrid;
    Remove85Button: TButton;
    ClubName85Edit: TEdit;
    Transponder85Edit: TEdit;
    FirstName85Edit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LastName85Edit: TEdit;
    PersonNbr85Edit: TMaskEdit;
    Register85Button: TButton;
    Summary85Panel: TPanel;
    Label4: TLabel;
    Remove125Button: TButton;
    Club125Edit: TEdit;
    Transponder125Edit: TEdit;
    Register125Button: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FirstName125Edit: TEdit;
    Label10: TLabel;
    LastName125Edit: TEdit;
    Summary125Panel: TPanel;
    ActivitySheetGrid125: TStringGrid;
    PersonNbr125Edit: TMaskEdit;
    Label12: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    DatePanel: TPanel;
    TimePanel: TPanel;
    Panel4: TPanel;
    UpdateHeaderTimer: TTimer;
    HomePageSheet: TTabSheet;
    WebBrowser: TWebBrowser;
    FacebookSheet: TTabSheet;
    FacebookBrowser: TWebBrowser;
    Label13: TLabel;
    FirstNameAdminEdit: TEdit;
    RegisterAdminButton: TButton;
    RemoveAdminButton: TButton;
    LastNameAdminEdit: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    PersonNbrAdminEdit: TMaskEdit;
    ActivitySheetGridAdmin: TStringGrid;
    Splitter2: TSplitter;
    AdminTACheck: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    PhoneNumberAdminEdit: TEdit;
    Track85Combo: TComboBox;
    RentalSheet: TTabSheet;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    PersonNbrRentalEdit: TMaskEdit;
    LastNameRentalEdit: TEdit;
    FirstNameRentalEdit: TEdit;
    RegisterRentalButton: TButton;
    RemoteRentalButton: TButton;
    ActivitySheetGridRental: TStringGrid;
    SummaryRentalLabel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpdateHeaderTimerTimer(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Register85ButtonClick(Sender: TObject);
    procedure Register125ButtonClick(Sender: TObject);
    procedure RegisterAdminButtonClick(Sender: TObject);
    procedure ActivityPagesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RegisterRentalButtonClick(Sender: TObject);
  private
    { Private declarations }
    FActivitySheet85 : TMxActivitySheet;
    FActivitySheet125 : TMxActivitySheet;
    FActivitySheetRental : TMxActivitySheet;
    FActivitySheetAdmin : TMxActivitySheet;

    function ValidForm85 : boolean;
    function ValidForm125 : boolean;
    function ValidFormAdmin : boolean;
    function ValidFormRental : boolean;

    procedure ClearForm85;
    procedure ClearForm125;
    procedure ClearFormAdmin;
    procedure ClearFormRental;
  public
    { Public declarations }
  end;

var
  MxActivityForm: TMxActivityForm;

implementation

{$R *.dfm}

procedure TMxActivityForm.ActivityPagesChange(Sender: TObject);
begin
  if Self.ActivityPages.ActivePage = Training85Sheet then
  begin
    Self.FirstName85Edit.SetFocus;
  end;

  if Self.ActivityPages.ActivePage = Training125Sheet then
  begin
    Self.FirstName125Edit.SetFocus;
  end;

  if Self.ActivityPages.ActivePage = TrainingAdminSheet then
  begin
    Self.FirstNameAdminEdit.SetFocus;
  end;
end;

procedure TMxActivityForm.ClearForm125;
begin
  Self.FirstName125Edit.Clear;
  Self.LastName125Edit.Clear;
  Self.PersonNbr125Edit.Clear;
  Self.Club125Edit.Clear;
  Self.Transponder125Edit.Clear;
end;

procedure TMxActivityForm.ClearForm85;
begin
  Self.FirstName85Edit.Clear;
  Self.LastName85Edit.Clear;
  Self.PersonNbr85Edit.Clear;
  Self.ClubName85Edit.Clear;
  Self.Transponder85Edit.Clear;
end;

procedure TMxActivityForm.ClearFormAdmin;
begin
  Self.FirstNameAdminEdit.Clear;
  Self.LastNameAdminEdit.Clear;
  Self.PersonNbrAdminEdit.Clear;
  Self.AdminTACheck.Checked:=false;
end;

procedure TMxActivityForm.ClearFormRental;
begin
  Self.FirstNameRentalEdit.Clear;
  Self.LastNameRentalEdit.Clear;
  Self.PersonNbrRentalEdit.Clear;
end;

procedure TMxActivityForm.CloseButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TMxActivityForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Today : TDateTime;
begin
  Today:=Now;

  FActivitySheet85.SaveCSV(DateToStr(Today)+'-activity-85.csv');
  FActivitySheet125.SaveCSV(DateToStr(Today)+'-activity-125.csv');
  FActivitySheetRental.SaveCSV(DateToStr(Today)+'-activity-rental.csv');
  FActivitySheetAdmin.SaveCSV(DateToStr(Today)+'-activity-admin.csv');

  FActivitySheet85.Free;
  FActivitySheet125.Free;
  FActivitySheetRental.Free;
  FActivitySheetAdmin.Free;
  UpdateHeaderTimer.Enabled:=false;

  WebBrowser.Free;
  FaceBookBrowser.Free;
end;

procedure TMxActivityForm.FormCreate(Sender: TObject);
begin
  FActivitySheet85 := TMxActivitySheet.Create;
  FActivitySheet125 := TMxActivitySheet.Create;
  FActivitySheetRental := TMxActivitySheet.Create;
  FActivitySheetAdmin := TMxActivitySheet.Create;
end;

procedure TMxActivityForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    Self.Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TMxActivityForm.FormShow(Sender: TObject);
begin
  FActivitySheet85.StringGrid:=ActivitySheetGrid85;
  FActivitySheet85.UpdateGrid;
  FActivitySheet125.StringGrid:=ActivitySheetGrid125;
  FActivitySheet125.UpdateGrid;
  FActivitySheetAdmin.StringGrid:=ActivitySheetGridAdmin;
  FActivitySheetAdmin.UpdateAdminGrid;
  FActivitySheetRental.StringGrid:=Self.ActivitySheetGridRental;
  FActivitySheetRental.UpdateGrid;

  WebBrowser.Navigate('www.skivarpsmk.se');
  FacebookBrowser.Navigate('https://www.facebook.com/skivarpsmk');

  Self.ActivityPages.ActivePageIndex:=2;
  Self.FirstName125Edit.SetFocus;
end;

procedure TMxActivityForm.Register125ButtonClick(Sender: TObject);
begin
  if Self.ValidForm125 then
  begin
    FActivitySheet125.Add(FirstName125Edit.Text, LastName125Edit.Text, PersonNbr125Edit.Text, Club125Edit.Text, Transponder125Edit.Text, 'Stora banan');
    FActivitySheet125.UpdateGrid;
    Self.Summary125Panel.Caption:=IntToStr(FActivitySheet125.Participants.Count);
    Self.ClearForm125;
    Self.FirstName125Edit.SetFocus;
  end;
end;

procedure TMxActivityForm.Register85ButtonClick(Sender: TObject);
begin
  if Self.ValidForm85 then
  begin
    FActivitySheet85.Add(
      FirstName85Edit.Text,
      LastName85Edit.Text,
      PersonNbr85Edit.Text,
      ClubName85Edit.Text,
      Transponder85Edit.Text,
      Track85Combo.Items[Track85Combo.ItemIndex]);

    FActivitySheet85.UpdateGrid;
    Self.Summary85Panel.Caption:=IntToStr(FActivitySheet85.Participants.Count);
    Self.ClearForm85;
    Self.FirstName85Edit.SetFocus;
  end;
end;

procedure TMxActivityForm.RegisterAdminButtonClick(Sender: TObject);
begin
  if Self.ValidFormAdmin then
  begin
    if Self.AdminTACheck.Checked then
      FActivitySheetAdmin.AddFirstAdmin(Self.FirstNameAdminEdit.Text, Self.LastNameAdminEdit.Text, Self.PersonNbrAdminEdit.Text, Self.PhoneNumberAdminEdit.Text)
    else
      FActivitySheetAdmin.AddAdmin(Self.FirstNameAdminEdit.Text, Self.LastNameAdminEdit.Text, Self.PersonNbrAdminEdit.Text, Self.PhoneNumberAdminEdit.Text);

    FActivitySheetAdmin.UpdateGrid;
    Self.ClearFormAdmin;
    Self.FirstNameAdminEdit.SetFocus;
  end;
end;

procedure TMxActivityForm.RegisterRentalButtonClick(Sender: TObject);
begin
  if Self.ValidFormRental then
  begin
    FActivitySheetRental.Add(Self.FirstNameRentalEdit.Text, Self.LastNameRentalEdit.Text, Self.PersonNbrRentalEdit.Text);
    FActivitySheetRental.UpdateRentalGrid;
    Self.ClearFormRental;
    Self.FirstNameRentalEdit.SetFocus;
    Self.SummaryRentalLabel.Caption:=IntToStr(FActivitySheetRental.Participants.Count);
  end;
end;

procedure TMxActivityForm.UpdateHeaderTimerTimer(Sender: TObject);
var
  Today : TDateTime;
begin
  Today:=Now;
  DatePanel.Caption:=DateToStr(today);
  TimePanel.Caption:=TimeToStr(today);
end;

function TMxActivityForm.ValidForm125: boolean;
var
  Valid : boolean;
begin
  Valid:=true;

  if FirstName125Edit.Text='' then
    Valid:=false;

  if LastName125Edit.Text='' then
    Valid:=false;

  if PersonNbr125Edit.Text='' then
    Valid:=false;

  if Club125Edit.Text='' then
    Valid:=false;

  Result:=Valid;
end;

function TMxActivityForm.ValidForm85: boolean;
var
  Valid : boolean;
begin
  Valid:=true;

  if FirstName85Edit.Text='' then
    Valid:=false;

  if LastName85Edit.Text='' then
    Valid:=false;

  if PersonNbr85Edit.Text='' then
    Valid:=false;

  if ClubName85Edit.Text='' then
    Valid:=false;

  Result:=Valid;
end;

function TMxActivityForm.ValidFormAdmin: boolean;
var
  Valid : boolean;
begin
  Valid:=true;

  if FirstNameAdminEdit.Text='' then
    Valid:=false;

  if LastNameAdminEdit.Text='' then
    Valid:=false;

  if PersonNbrAdminEdit.Text='' then
    Valid:=false;

  Result:=Valid;
end;

function TMxActivityForm.ValidFormRental: boolean;
var
  Valid : boolean;
begin
  Valid:=true;

  if FirstNameRentalEdit.Text='' then
    Valid:=false;

  if LastNameRentalEdit.Text='' then
    Valid:=false;

  if PersonNbrRentalEdit.Text='' then
    Valid:=false;

  Result:=Valid;
end;

end.
