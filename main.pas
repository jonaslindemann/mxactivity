unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  mx, Vcl.ExtCtrls, Vcl.Mask, Vcl.OleCtrls, SHDocVw, Vcl.Samples.Spin,
  Vcl.Buttons;

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
    AppTitlePanel: TPanel;
    UpdateHeaderTimer: TTimer;
    HomePageSheet: TTabSheet;
    WebBrowser: TWebBrowser;
    FacebookSheet: TTabSheet;
    FacebookBrowser: TWebBrowser;
    Label13: TLabel;
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
    AutosaveTimer: TTimer;
    SettingsSheet: TTabSheet;
    Label20: TLabel;
    SaveLocationEdit: TEdit;
    SaveLocationButton: TButton;
    OpenDialog: TFileOpenDialog;
    Label21: TLabel;
    SaveFrequencySpin: TSpinEdit;
    CloseButton: TButton;
    StaticText1: TStaticText;
    Shape1: TShape;
    FirstNameAdminEdit: TComboBox;
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
    procedure AutosaveTimerTimer(Sender: TObject);
    procedure SaveLocationButtonClick(Sender: TObject);
    procedure SaveFrequencySpinChange(Sender: TObject);
  private
    { Private declarations }
    FActivitySheet85 : TMxActivitySheet;
    FActivitySheet125 : TMxActivitySheet;
    FActivitySheetRental : TMxActivitySheet;
    FActivitySheetAdmin : TMxActivitySheet;

    FSettings : TMxSettings;

    FRegistrationOpen : boolean;

    function ValidForm85 : boolean;
    function ValidForm125 : boolean;
    function ValidFormAdmin : boolean;
    function ValidFormRental : boolean;

    procedure ClearForm85;
    procedure ClearForm125;
    procedure ClearFormAdmin;
    procedure ClearFormRental;

    procedure RegisterAdmin;
    procedure OpenRegistration;
    procedure SaveSheets;
    procedure LoadSheets;
    procedure NewSheets;

    procedure UpdateSettingsSheet;
    procedure UpdateSettings;

  public
    { Public declarations }
  end;

var
  MxActivityForm: TMxActivityForm;

implementation

{$R *.dfm}

procedure TMxActivityForm.FormCreate(Sender: TObject);
var
  Today : TDateTime;
begin
  FRegistrationOpen:=False;
  FSettings:=TMxSettings.Create;
  FSettings.Load;

  Today:=Now;

  Self.NewSheets;
  Self.LoadSheets;
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

  Self.SummaryRentalLabel.Caption:=IntToStr(FActivitySheetRental.Participants.Count);
  Self.Summary85Panel.Caption:=IntToStr(FActivitySheet85.Participants.Count);
  Self.Summary125Panel.Caption:=IntToStr(FActivitySheet125.Participants.Count);

  WebBrowser.Navigate('www.skivarpsmk.se');
  FacebookBrowser.Navigate('https://www.facebook.com/skivarpsmk');

  Self.ActivityPages.ActivePageIndex:=2;
  Self.FirstName125Edit.SetFocus;

  Self.UpdateSettingsSheet;
  Self.UpdateSettings;

  if not FActivitySheet85.HasTables then
    begin
      FRegistrationOpen:=False;
      Self.RegisterAdmin;
    end
  else
    begin
      FRegistrationOpen:=True;
      Self.AutosaveTimer.Enabled:=True;
    end;

end;

procedure TMxActivityForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Today : TDateTime;
begin
  Today:=Now;

  if FRegistrationOpen then
  begin
    Self.SaveSheets;
  end;

  FActivitySheet85.Free;
  FActivitySheet125.Free;
  FActivitySheetRental.Free;
  FActivitySheetAdmin.Free;
  UpdateHeaderTimer.Enabled:=false;

  WebBrowser.Free;
  FaceBookBrowser.Free;

  UpdateSettings;

  FSettings.Save;
  FSettings.Free;
end;

procedure TMxActivityForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
    Self.Perform(WM_NEXTDLGCTL, 0, 0);
end;

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

procedure TMxActivityForm.AutosaveTimerTimer(Sender: TObject);
var
  Today : TDateTime;
  TempCaption : string;
begin
  TempCaption:=Self.AppTitlePanel.Caption;
  Self.AppTitlePanel.Caption:='Saving...';

  //Beep;

  Today:=Now;

  if not FActivitySheet85.HasTables then
  begin
    NewSheets;
    RegisterAdmin;
    Self.AppTitlePanel.Caption:=TempCaption;
    exit;
  end;

  if FRegistrationOpen then
  begin
    FActivitySheet85.SaveLocation:=FSettings.SaveLocation;
    FActivitySheet85.SaveCSV;
    FActivitySheet125.SaveLocation:=FSettings.SaveLocation;
    FActivitySheet125.SaveCSV;
    FActivitySheetRental.SaveLocation:=FSettings.SaveLocation;
    FActivitySheetRental.SaveCSV;
    FActivitySheetAdmin.SaveLocation:=FSettings.SaveLocation;
    FActivitySheetAdmin.SaveCSV;
  end;

  Self.AppTitlePanel.Caption:=TempCaption;
end;

procedure TMxActivityForm.CloseButtonClick(Sender: TObject);
begin
  Self.Close;
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

    FActivitySheetAdmin.UpdateAdminGrid;
    Self.ClearFormAdmin;
    Self.FirstNameAdminEdit.SetFocus;

    OpenRegistration;
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

procedure TMxActivityForm.SaveFrequencySpinChange(Sender: TObject);
begin
  Self.UpdateSettings;
end;

procedure TMxActivityForm.SaveLocationButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    FSettings.SaveLocation:=OpenDialog.FileName;
    FSettings.Save;
    Self.UpdateSettingsSheet;
    Self.UpdateSettings;
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

procedure TMxActivityForm.SaveSheets;
begin
  FActivitySheet85.SaveLocation:=FSettings.SaveLocation;
  FActivitySheet85.SaveCSV;
  FActivitySheet125.SaveLocation:=FSettings.SaveLocation;
  FActivitySheet125.SaveCSV;
  FActivitySheetRental.SaveLocation:=FSettings.SaveLocation;
  FActivitySheetRental.SaveCSV;
  FActivitySheetAdmin.SaveLocation:=FSettings.SaveLocation;
  FActivitySheetAdmin.SaveCSV;
end;

procedure TMxActivityForm.LoadSheets;
begin
  FActivitySheet85.ReadCSV;
  FActivitySheet125.ReadCSV;
  FActivitySheetRental.ReadCSV;
  FActivitySheetAdmin.ReadCSV;
end;

procedure TMxActivityForm.NewSheets;
begin
  FActivitySheet85.Free;
  FActivitySheet125.Free;
  FActivitySheetRental.Free;
  FActivitySheetAdmin.Free;

  FActivitySheet85 := TMxActivitySheet.Create('85');
  FActivitySheet85.SaveLocation:=FSettings.SaveLocation;
  FActivitySheet125 := TMxActivitySheet.Create('125');
  FActivitySheet125.SaveLocation:=FSettings.SaveLocation;
  FActivitySheetRental := TMxActivitySheet.Create('rental');
  FActivitySheetRental.SaveLocation:=FSettings.SaveLocation;
  FActivitySheetAdmin := TMxActivitySheet.Create('admin');
  FActivitySheetAdmin.SaveLocation:=FSettings.SaveLocation;

  FActivitySheet85.StringGrid:=ActivitySheetGrid85;
  FActivitySheet85.UpdateGrid;
  FActivitySheet125.StringGrid:=ActivitySheetGrid125;
  FActivitySheet125.UpdateGrid;
  FActivitySheetAdmin.StringGrid:=ActivitySheetGridAdmin;
  FActivitySheetAdmin.UpdateAdminGrid;
  FActivitySheetRental.StringGrid:=Self.ActivitySheetGridRental;
  FActivitySheetRental.UpdateGrid;

  Self.SummaryRentalLabel.Caption:=IntToStr(FActivitySheetRental.Participants.Count);
  Self.Summary85Panel.Caption:=IntToStr(FActivitySheet85.Participants.Count);
  Self.Summary125Panel.Caption:=IntToStr(FActivitySheet125.Participants.Count);
end;

procedure TMxActivityForm.RegisterAdmin;
begin
  AutosaveTimer.Enabled:=False;
  ActivityPages.ActivePageIndex:=3;
  ActivityPages.Pages[0].TabVisible:=False;
  ActivityPages.Pages[1].TabVisible:=False;
  ActivityPages.Pages[2].TabVisible:=False;
  FRegistrationOpen:=false;
end;

procedure TMxActivityForm.OpenRegistration;
begin
  FRegistrationOpen:=True;
  ActivityPages.Pages[0].TabVisible:=True;
  ActivityPages.Pages[1].TabVisible:=True;
  ActivityPages.Pages[2].TabVisible:=True;
  ActivityPages.ActivePageIndex:=2;
  FirstName125Edit.SetFocus;
  Self.SaveSheets;
  Self.AutosaveTimer.Enabled:=True;
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

procedure TMxActivityForm.UpdateSettings;
begin
  FSettings.SaveLocation:=Self.SaveLocationEdit.Text;
  FSettings.SaveFrequency:=Self.SaveFrequencySpin.Value;

  AutosaveTimer.Interval:=FSettings.SaveFrequency*60*1000;
  //AutosaveTimer.Interval:=2000;
  //AutosaveTimer.Enabled:=true;
end;

procedure TMxActivityForm.UpdateSettingsSheet;
begin
  Self.SaveLocationEdit.Text:=FSettings.SaveLocation;
  Self.SaveFrequencySpin.Value:=FSettings.SaveFrequency;
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
