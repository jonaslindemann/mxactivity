unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  mx, Vcl.ExtCtrls, Vcl.Mask, Vcl.OleCtrls, SHDocVw, Vcl.Samples.Spin,
  Vcl.Buttons, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TMxActivityForm = class(TForm)
    ActivityPages: TPageControl;
    Training85Sheet: TTabSheet;
    Training125Sheet: TTabSheet;
    TrainingAdminSheet: TTabSheet;
    ActivitySheetGrid85: TStringGrid;
    Remove85Button: TButton;
    FirstName85Edit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    LastName85Edit: TEdit;
    PersonNbr85Edit: TMaskEdit;
    Register85Button: TButton;
    Summary85Panel: TPanel;
    Label4: TLabel;
    Remove125Button: TButton;
    Register125Button: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FirstName125Edit: TEdit;
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
    FirstNameAdminEdit: TEdit;
    Club125Combo: TComboBox;
    Club85Combo: TComboBox;
    TabSheet1: TTabSheet;
    IdHTTP: TIdHTTP;
    ShowInfoButton: TButton;
    IpInfoButton: TButton;
    Training30Button: TButton;
    Training20Button: TButton;
    TimeButton: TButton;
    InfoEdit: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    WarningEdit: TEdit;
    ShowWarningButton: TButton;
    OffButton: TButton;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SignIpEdit: TEdit;
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
    procedure RemoteRentalButtonClick(Sender: TObject);
    procedure Remove85ButtonClick(Sender: TObject);
    procedure Remove125ButtonClick(Sender: TObject);
    procedure RemoveAdminButtonClick(Sender: TObject);
    procedure IpInfoButtonClick(Sender: TObject);
    procedure OffButtonClick(Sender: TObject);
    procedure Training30ButtonClick(Sender: TObject);
    procedure Training20ButtonClick(Sender: TObject);
    procedure ShowInfoButtonClick(Sender: TObject);
    procedure TimeButtonClick(Sender: TObject);
    procedure ShowWarningButtonClick(Sender: TObject);
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

  Self.Club125Combo.Items.Add('Skivarps MK');
  Self.Club125Combo.Items.Add('Anderslövs MK');
  Self.Club125Combo.Items.Add('Limhamns MK');
  Self.Club125Combo.Items.Add('Landskrona MK');
  Self.Club125Combo.Items.Add('FMCK Malmö');
  Self.Club125Combo.Items.Add('Tomelilla MK');
  Self.Club125Combo.Items.Add('Helsingborg MC');
  Self.Club125Combo.Items.Add('Ilstorps Motions & KCK');

  Self.Club85Combo.Items.Add('Skivarps MK');
  Self.Club85Combo.Items.Add('Anderslövs MK');
  Self.Club85Combo.Items.Add('Limhamns MK');
  Self.Club85Combo.Items.Add('Landskrona MK');
  Self.Club85Combo.Items.Add('FMCK Malmö');
  Self.Club85Combo.Items.Add('Tomelilla MK');
  Self.Club85Combo.Items.Add('Helsingborg MC');
  Self.Club85Combo.Items.Add('Ilstorps Motions & KCK');
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

  //WebBrowser.Navigate('www.skivarpsmk.se');
  //FacebookBrowser.Navigate('https://www.facebook.com/skivarpsmk');

  Self.ActivityPages.ActivePageIndex:=2;
  Self.FirstName125Edit.SetFocus;

  Self.UpdateSettingsSheet;

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

  //WebBrowser.Free;
  //FaceBookBrowser.Free;

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

procedure TMxActivityForm.IpInfoButtonClick(Sender: TObject);
begin
  if FSettings.SignIp<>'' then
  begin
    IdHTTP.Get('http://'+FSettings.SignIp+':5000/command/startup');
  end;
end;

procedure TMxActivityForm.CloseButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TMxActivityForm.Register125ButtonClick(Sender: TObject);
begin
  if Self.ValidForm125 then
  begin
    FActivitySheet125.Add(FirstName125Edit.Text, LastName125Edit.Text, PersonNbr125Edit.Text, Club125Combo.Text, '', 'Stora banan');
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
      Club85Combo.Text,
      '',
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

procedure TMxActivityForm.RemoteRentalButtonClick(Sender: TObject);
begin
  //OutputDebugString(PChar(IntToStr(ActivitySheetGridRental.Row)));
  if ActivitySheetGridRental.Row>=1 then
  begin
    FActivitySheetRental.RemoveAt(ActivitySheetGridRental.Row-1);
    FActivitySheetRental.UpdateRentalGrid;
    Self.ClearFormRental;
    Self.FirstNameRentalEdit.SetFocus;
    Self.SummaryRentalLabel.Caption:=IntToStr(FActivitySheetRental.Participants.Count);
  end;
end;

procedure TMxActivityForm.Remove125ButtonClick(Sender: TObject);
begin
  if ActivitySheetGrid125.Row>=1 then
  begin
    FActivitySheet125.RemoveAt(ActivitySheetGridRental.Row-1);
    FActivitySheet125.UpdateGrid;
    Self.ClearForm125;
    Self.FirstName125Edit.SetFocus;
    Self.Summary125Panel.Caption:=IntToStr(FActivitySheet125.Participants.Count);
  end;
end;

procedure TMxActivityForm.Remove85ButtonClick(Sender: TObject);
begin
  if ActivitySheetGrid85.Row>=1 then
  begin
    FActivitySheet85.RemoveAt(ActivitySheetGridRental.Row-1);
    FActivitySheet85.UpdateGrid;
    Self.ClearForm85;
    Self.FirstName85Edit.SetFocus;
    Self.Summary85Panel.Caption:=IntToStr(FActivitySheet85.Participants.Count);
  end;
end;

procedure TMxActivityForm.RemoveAdminButtonClick(Sender: TObject);
begin
  if ActivitySheetGridAdmin.Row>=1 then
  begin
    FActivitySheetAdmin.RemoveAt(ActivitySheetGridAdmin.Row-1);
    FActivitySheetAdmin.UpdateAdminGrid;
    Self.ClearFormAdmin;
    Self.FirstNameAdminEdit.SetFocus;
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

procedure TMxActivityForm.ShowInfoButtonClick(Sender: TObject);
var
  PostData : TStringList;
  Msg : string;
begin
  if FSettings.SignIp<>'' then
  begin
    PostData:=TStringList.Create;
    PostData.Add('info_text='+InfoEdit.Text);
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Post('http://'+FSettings.SignIp+':5000/set_info_text', PostData);
    PostData.Free;
  end;
end;

procedure TMxActivityForm.ShowWarningButtonClick(Sender: TObject);
var
  PostData : TStringList;
  Msg : string;
begin
  if FSettings.SignIp<>'' then
  begin
    PostData:=TStringList.Create;
    PostData.Add('warn_text='+WarningEdit.Text);
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Post('http://'+FSettings.SignIp+':5000/set_warn_text', PostData);
    PostData.Free;
  end;
end;

procedure TMxActivityForm.TimeButtonClick(Sender: TObject);
begin
  if FSettings.SignIp<>'' then
  begin
    IdHTTP.Get('http://'+FSettings.SignIp+':5000/command/time');
  end;
end;

procedure TMxActivityForm.Training20ButtonClick(Sender: TObject);
begin
  if FSettings.SignIp<>'' then
  begin
    IdHTTP.Get('http://'+FSettings.SignIp+':5000/command/time_left_twenty');
  end;
end;

procedure TMxActivityForm.Training30ButtonClick(Sender: TObject);
begin
  if FSettings.SignIp<>'' then
  begin
    IdHTTP.Get('http://'+FSettings.SignIp+':5000/command/time_left');
  end;
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

procedure TMxActivityForm.OffButtonClick(Sender: TObject);
begin
  if FSettings.SignIp<>'' then
  begin
    IdHTTP.Get('http://'+FSettings.SignIp+':5000/command/off');
  end;
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
  Self.Club125Combo.Clear;
  //Self.Transponder125Edit.Clear;
end;

procedure TMxActivityForm.ClearForm85;
begin
  Self.FirstName85Edit.Clear;
  Self.LastName85Edit.Clear;
  Self.PersonNbr85Edit.Clear;
  Self.Club85Combo.Clear;
  //Self.Transponder85Edit.Clear;
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
  FSettings.SignIp:=Self.SignIpEdit.Text;

  AutosaveTimer.Interval:=FSettings.SaveFrequency*60*1000;
  //AutosaveTimer.Interval:=2000;
  //AutosaveTimer.Enabled:=true;
end;

procedure TMxActivityForm.UpdateSettingsSheet;
begin
  Self.SaveLocationEdit.Text:=FSettings.SaveLocation;
  Self.SaveFrequencySpin.Value:=FSettings.SaveFrequency;
  Self.SignIpEdit.Text:=FSettings.SignIp;
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

  if Club125Combo.Text='' then
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

  if Club85Combo.Text='' then
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
