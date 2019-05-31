object MxActivityForm: TMxActivityForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Registreringsformul'#228'r Motocross'
  ClientHeight = 864
  ClientWidth = 1497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Bahnschrift'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 33
  object Label16: TLabel
    Left = 44
    Top = 357
    Width = 188
    Height = 33
    Caption = 'Personnummer'
  end
  object Label24: TLabel
    Left = 16
    Top = 397
    Width = 144
    Height = 33
    Caption = 'Datakatalog'
  end
  object Label25: TLabel
    Left = 16
    Top = 461
    Width = 193
    Height = 33
    Caption = 'Autospara (min)'
  end
  object ActivityPages: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 80
    Width = 1481
    Height = 776
    Margins.Left = 8
    Margins.Top = 15
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabWidth = 170
    OnChange = ActivityPagesChange
    ExplicitWidth = 1465
    ExplicitHeight = 737
    object RentalSheet: TTabSheet
      Caption = 'Hyrcross'
      ImageIndex = 5
      DesignSize = (
        1473
        728)
      object Label11: TLabel
        Left = 24
        Top = 29
        Width = 109
        Height = 33
        Caption = 'F'#246'rnamn'
      end
      object Label18: TLabel
        Left = 24
        Top = 93
        Width = 127
        Height = 33
        Caption = 'Efternamn'
      end
      object Label19: TLabel
        Left = 24
        Top = 157
        Width = 188
        Height = 33
        Caption = 'Personnummer'
      end
      object PersonNbrRentalEdit: TMaskEdit
        Left = 304
        Top = 154
        Width = 417
        Height = 41
        Color = clInfoBk
        EditMask = '000000-0000;1;_'
        MaxLength = 11
        TabOrder = 2
        Text = '      -    '
      end
      object LastNameRentalEdit: TEdit
        Left = 304
        Top = 90
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 1
        TextHint = 'Efternamn'
      end
      object FirstNameRentalEdit: TEdit
        Left = 304
        Top = 26
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
      end
      object RegisterRentalButton: TButton
        Left = 784
        Top = 25
        Width = 168
        Height = 44
        Caption = 'Registrera'
        TabOrder = 3
        OnClick = RegisterRentalButtonClick
      end
      object RemoteRentalButton: TButton
        Left = 785
        Top = 89
        Width = 167
        Height = 44
        Caption = 'Ta bort'
        TabOrder = 4
        OnClick = RemoteRentalButtonClick
      end
      object ActivitySheetGridRental: TStringGrid
        Left = 0
        Top = 240
        Width = 1473
        Height = 488
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 5
        ExplicitLeft = 3
        ExplicitTop = 233
      end
      object SummaryRentalLabel: TPanel
        Left = 1292
        Top = 33
        Width = 168
        Height = 108
        Anchors = [akTop, akRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '0'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -48
        Font.Name = 'Bahnschrift'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
    end
    object Training85Sheet: TTabSheet
      Caption = '50-85 cc'
      ExplicitLeft = 0
      ExplicitWidth = 1457
      ExplicitHeight = 689
      DesignSize = (
        1473
        728)
      object Label1: TLabel
        Left = 24
        Top = 29
        Width = 109
        Height = 33
        Caption = 'F'#246'rnamn'
      end
      object Label2: TLabel
        Left = 24
        Top = 157
        Width = 188
        Height = 33
        Caption = 'Personnummer'
      end
      object Label3: TLabel
        Left = 24
        Top = 221
        Width = 70
        Height = 33
        Caption = 'Klubb'
      end
      object Label5: TLabel
        Left = 24
        Top = 93
        Width = 127
        Height = 33
        Caption = 'Efternamn'
      end
      object Label4: TLabel
        Left = 24
        Top = 289
        Width = 60
        Height = 33
        Caption = 'Bana'
      end
      object Splitter1: TSplitter
        Left = 0
        Top = 341
        Width = 1473
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 496
      end
      object Remove85Button: TButton
        Left = 769
        Top = 89
        Width = 167
        Height = 44
        Caption = 'Ta bort'
        TabOrder = 5
        TabStop = False
        OnClick = Remove85ButtonClick
      end
      object FirstName85Edit: TEdit
        Left = 304
        Top = 26
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
      end
      object LastName85Edit: TEdit
        Left = 304
        Top = 90
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 1
        TextHint = 'Efternamn'
      end
      object PersonNbr85Edit: TMaskEdit
        Left = 304
        Top = 154
        Width = 417
        Height = 41
        Color = clInfoBk
        EditMask = '000000-0000;1;_'
        MaxLength = 11
        TabOrder = 2
        Text = '      -    '
      end
      object Register85Button: TButton
        Left = 768
        Top = 25
        Width = 168
        Height = 44
        Caption = 'Registrera'
        TabOrder = 4
        OnClick = Register85ButtonClick
      end
      object Summary85Panel: TPanel
        Left = 1284
        Top = 25
        Width = 168
        Height = 108
        Anchors = [akTop, akRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '0'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -48
        Font.Name = 'Bahnschrift'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object ActivitySheetGrid85: TStringGrid
        Left = 0
        Top = 344
        Width = 1473
        Height = 384
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 7
      end
      object Track85Combo: TComboBox
        Left = 304
        Top = 281
        Width = 417
        Height = 41
        ItemIndex = 0
        TabOrder = 8
        Text = 'Stora banan'
        Items.Strings = (
          'Stora banan'
          'Mellan banan')
      end
      object Club85Combo: TComboBox
        Left = 305
        Top = 218
        Width = 416
        Height = 41
        AutoDropDown = True
        Color = clInfoBk
        Sorted = True
        TabOrder = 3
        TextHint = 'Klubb'
      end
    end
    object Training125Sheet: TTabSheet
      Caption = '>= 125 cc'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitWidth = 1457
      ExplicitHeight = 689
      DesignSize = (
        1473
        728)
      object Label7: TLabel
        Left = 24
        Top = 29
        Width = 109
        Height = 33
        Caption = 'F'#246'rnamn'
      end
      object Label8: TLabel
        Left = 24
        Top = 157
        Width = 188
        Height = 33
        Caption = 'Personnummer'
      end
      object Label9: TLabel
        Left = 24
        Top = 221
        Width = 70
        Height = 33
        Caption = 'Klubb'
      end
      object Label12: TLabel
        Left = 24
        Top = 93
        Width = 127
        Height = 33
        Caption = 'Efternamn'
      end
      object Remove125Button: TButton
        Left = 769
        Top = 89
        Width = 166
        Height = 44
        Caption = 'Ta bort'
        TabOrder = 5
        TabStop = False
        OnClick = Remove125ButtonClick
      end
      object Register125Button: TButton
        Left = 768
        Top = 25
        Width = 167
        Height = 44
        Caption = 'Registrera'
        TabOrder = 4
        OnClick = Register125ButtonClick
      end
      object FirstName125Edit: TEdit
        Left = 304
        Top = 26
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
      end
      object LastName125Edit: TEdit
        Left = 304
        Top = 90
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 1
        TextHint = 'Efternamn'
      end
      object Summary125Panel: TPanel
        Left = 1284
        Top = 25
        Width = 167
        Height = 108
        Anchors = [akTop, akRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '0'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -48
        Font.Name = 'Bahnschrift'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object ActivitySheetGrid125: TStringGrid
        Left = 0
        Top = 288
        Width = 1473
        Height = 440
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 7
      end
      object PersonNbr125Edit: TMaskEdit
        Left = 304
        Top = 154
        Width = 417
        Height = 41
        Color = clInfoBk
        EditMask = '000000-0000;1;_'
        MaxLength = 11
        TabOrder = 2
        Text = '      -    '
      end
      object Club125Combo: TComboBox
        Left = 305
        Top = 218
        Width = 416
        Height = 41
        AutoDropDown = True
        Color = clInfoBk
        Sorted = True
        TabOrder = 3
        TextHint = 'Klubb'
      end
    end
    object TrainingAdminSheet: TTabSheet
      Caption = 'TA/Kiosk'
      ImageIndex = 3
      ExplicitLeft = 0
      object Label13: TLabel
        Left = 32
        Top = 37
        Width = 109
        Height = 33
        Caption = 'F'#246'rnamn'
      end
      object Label14: TLabel
        Left = 32
        Top = 101
        Width = 127
        Height = 33
        Caption = 'Efternamn'
      end
      object Label15: TLabel
        Left = 32
        Top = 165
        Width = 188
        Height = 33
        Caption = 'Personnummer'
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 341
        Width = 1473
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 408
      end
      object Label17: TLabel
        Left = 32
        Top = 228
        Width = 87
        Height = 33
        Caption = 'Telefon'
      end
      object Shape1: TShape
        Left = 768
        Top = 184
        Width = 393
        Height = 97
        Pen.Width = 2
        Shape = stRoundRect
      end
      object RegisterAdminButton: TButton
        Left = 776
        Top = 33
        Width = 167
        Height = 44
        Caption = 'Registrera'
        TabOrder = 5
        OnClick = RegisterAdminButtonClick
      end
      object RemoveAdminButton: TButton
        Left = 777
        Top = 97
        Width = 166
        Height = 44
        Caption = 'Ta bort'
        TabOrder = 6
        OnClick = RemoveAdminButtonClick
      end
      object LastNameAdminEdit: TEdit
        Left = 312
        Top = 98
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 1
        TextHint = 'Efternamn'
      end
      object PersonNbrAdminEdit: TMaskEdit
        Left = 312
        Top = 162
        Width = 417
        Height = 41
        Color = clInfoBk
        EditMask = '000000-0000;1;_'
        MaxLength = 11
        TabOrder = 2
        Text = '      -    '
      end
      object ActivitySheetGridAdmin: TStringGrid
        Left = 0
        Top = 344
        Width = 1473
        Height = 384
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goFixedRowClick]
        TabOrder = 7
      end
      object AdminTACheck: TCheckBox
        Left = 313
        Top = 288
        Width = 416
        Height = 33
        Caption = 'Tr'#228'ningsansvarig'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object PhoneNumberAdminEdit: TEdit
        Left = 312
        Top = 225
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 3
        TextHint = 'Telefon'
      end
      object StaticText1: TStaticText
        Left = 782
        Top = 197
        Width = 363
        Height = 74
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        AutoSize = False
        Caption = 
          'F'#246'r att '#246'ppna registreringen, registrera den som skall var tr'#228'ni' +
          'ngsanvarig. G'#229' sedan tillbaka och l'#228'gg till t ex kioskansvarig.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Bahnschrift'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object FirstNameAdminEdit: TEdit
        Left = 313
        Top = 34
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
      end
    end
    object SettingsSheet: TTabSheet
      Caption = 'Inst'#228'llningar'
      ImageIndex = 6
      ExplicitLeft = 8
      ExplicitWidth = 1457
      ExplicitHeight = 689
      object Label20: TLabel
        Left = 40
        Top = 45
        Width = 144
        Height = 33
        Caption = 'Datakatalog'
      end
      object Label21: TLabel
        Left = 40
        Top = 109
        Width = 193
        Height = 33
        Caption = 'Autospara (min)'
      end
      object Label26: TLabel
        Left = 40
        Top = 181
        Width = 88
        Height = 33
        Caption = 'Skylt ip'
      end
      object SaveLocationEdit: TEdit
        Left = 320
        Top = 42
        Width = 417
        Height = 41
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
      end
      object SaveLocationButton: TButton
        Left = 776
        Top = 41
        Width = 168
        Height = 44
        Caption = 'V'#228'lj'
        TabOrder = 1
        OnClick = SaveLocationButtonClick
      end
      object SaveFrequencySpin: TSpinEdit
        Left = 320
        Top = 106
        Width = 73
        Height = 43
        MaxValue = 10
        MinValue = 1
        TabOrder = 2
        Value = 5
        OnChange = SaveFrequencySpinChange
      end
      object SignIpEdit: TEdit
        Left = 320
        Top = 178
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 3
        TextHint = 'Skylt ip'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Skylt'
      ImageIndex = 5
      ExplicitLeft = 8
      ExplicitWidth = 1457
      ExplicitHeight = 689
      object Label6: TLabel
        Left = 34
        Top = 206
        Width = 141
        Height = 33
        Caption = 'Information'
      end
      object Label10: TLabel
        Left = 34
        Top = 273
        Width = 93
        Height = 33
        Caption = 'Varning'
      end
      object Label22: TLabel
        Left = 32
        Top = 43
        Width = 94
        Height = 33
        Caption = 'Allm'#228'nt'
      end
      object Label23: TLabel
        Left = 32
        Top = 107
        Width = 90
        Height = 33
        Caption = 'Tr'#228'ning'
      end
      object ShowInfoButton: TButton
        Left = 660
        Top = 203
        Width = 153
        Height = 42
        Caption = 'Visa'
        TabOrder = 0
        OnClick = ShowInfoButtonClick
      end
      object IpInfoButton: TButton
        Left = 226
        Top = 39
        Width = 153
        Height = 44
        Caption = 'IP-info'
        TabOrder = 1
        OnClick = IpInfoButtonClick
      end
      object Training30Button: TButton
        Left = 226
        Top = 110
        Width = 153
        Height = 44
        Caption = '30 min'
        TabOrder = 2
        OnClick = Training30ButtonClick
      end
      object Training20Button: TButton
        Left = 394
        Top = 110
        Width = 153
        Height = 44
        Caption = '20 min'
        TabOrder = 3
        OnClick = Training20ButtonClick
      end
      object TimeButton: TButton
        Left = 562
        Top = 110
        Width = 153
        Height = 44
        Caption = 'Klocka'
        TabOrder = 4
        OnClick = TimeButtonClick
      end
      object InfoEdit: TEdit
        Left = 226
        Top = 203
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 5
        TextHint = 'F'#246'rnamn'
      end
      object WarningEdit: TEdit
        Left = 226
        Top = 272
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 6
        TextHint = 'F'#246'rnamn'
      end
      object ShowWarningButton: TButton
        Left = 660
        Top = 270
        Width = 153
        Height = 42
        Caption = 'Visa'
        TabOrder = 7
        OnClick = ShowWarningButtonClick
      end
      object OffButton: TButton
        Left = 394
        Top = 39
        Width = 153
        Height = 44
        Caption = 'Av'
        TabOrder = 8
        OnClick = OffButtonClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1497
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    StyleElements = []
    ExplicitTop = -3
    DesignSize = (
      1497
      65)
    object DatePanel: TPanel
      Left = 24
      Top = 7
      Width = 273
      Height = 50
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Bahnschrift'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
    end
    object TimePanel: TPanel
      Left = 1174
      Top = 7
      Width = 187
      Height = 50
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Bahnschrift'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      StyleElements = []
    end
    object AppTitlePanel: TPanel
      Left = 520
      Top = 7
      Width = 409
      Height = 50
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Skivarps MK - Tr'#228'ning'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Bahnschrift'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      StyleElements = []
    end
    object CloseButton: TButton
      Left = 1384
      Top = 8
      Width = 101
      Height = 50
      Anchors = [akTop, akRight]
      Caption = 'St'#228'ng'
      TabOrder = 3
      OnClick = CloseButtonClick
    end
  end
  object UpdateHeaderTimer: TTimer
    OnTimer = UpdateHeaderTimerTimer
    Left = 1212
    Top = 753
  end
  object AutosaveTimer: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = AutosaveTimerTimer
    Left = 1128
    Top = 752
  end
  object OpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoPathMustExist]
    Left = 1048
    Top = 754
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 980
    Top = 748
  end
end
