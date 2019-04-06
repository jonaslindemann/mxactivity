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
  object ActivityPages: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 85
    Width = 1481
    Height = 771
    Margins.Left = 8
    Margins.Top = 20
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = RentalSheet
    Align = alClient
    TabOrder = 0
    OnChange = ActivityPagesChange
    object RentalSheet: TTabSheet
      Caption = 'Hyrcross'
      ImageIndex = 5
      ExplicitLeft = 16
      ExplicitTop = 36
      DesignSize = (
        1473
        723)
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
      end
      object ActivitySheetGridRental: TStringGrid
        Left = 0
        Top = 240
        Width = 1473
        Height = 483
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 5
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
      DesignSize = (
        1473
        723)
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
      object Label6: TLabel
        Left = 24
        Top = 284
        Width = 153
        Height = 33
        Caption = 'Transponder'
      end
      object Label4: TLabel
        Left = 24
        Top = 348
        Width = 60
        Height = 33
        Caption = 'Bana'
      end
      object Splitter1: TSplitter
        Left = 0
        Top = 405
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
        TabOrder = 6
      end
      object ClubName85Edit: TEdit
        Left = 304
        Top = 218
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 3
        TextHint = 'Klubbnamn'
      end
      object Transponder85Edit: TEdit
        Left = 304
        Top = 281
        Width = 417
        Height = 41
        Color = clInfoBk
        TabOrder = 4
        TextHint = 'Frivilligt'
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
        TabOrder = 5
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
        TabOrder = 7
      end
      object ActivitySheetGrid85: TStringGrid
        Left = 0
        Top = 408
        Width = 1473
        Height = 315
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 8
      end
      object Track85Combo: TComboBox
        Left = 304
        Top = 345
        Width = 417
        Height = 41
        ItemIndex = 0
        TabOrder = 9
        Text = 'Stora banan'
        Items.Strings = (
          'Stora banan'
          'Mellan banan')
      end
    end
    object Training125Sheet: TTabSheet
      Caption = '>= 125 cc'
      ImageIndex = 1
      DesignSize = (
        1473
        723)
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
      object Label10: TLabel
        Left = 24
        Top = 284
        Width = 153
        Height = 33
        Caption = 'Transponder'
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
        TabOrder = 6
      end
      object Club125Edit: TEdit
        Left = 304
        Top = 218
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 3
        TextHint = 'Klubbnamn'
      end
      object Transponder125Edit: TEdit
        Left = 304
        Top = 281
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 4
        TextHint = 'Frivilligt'
      end
      object Register125Button: TButton
        Left = 768
        Top = 25
        Width = 167
        Height = 44
        Caption = 'Registrera'
        TabOrder = 5
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
        TabOrder = 7
      end
      object ActivitySheetGrid125: TStringGrid
        Left = 0
        Top = 344
        Width = 1473
        Height = 379
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 8
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
    end
    object TrainingAdminSheet: TTabSheet
      Caption = 'TA/Kiosk'
      ImageIndex = 3
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
      object FirstNameAdminEdit: TEdit
        Left = 312
        Top = 34
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 0
        TextHint = 'F'#246'rnamn'
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
        Height = 379
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 7
      end
      object AdminTACheck: TCheckBox
        Left = 313
        Top = 288
        Width = 416
        Height = 33
        Caption = 'Tr'#228'ningsansvarig'
        TabOrder = 4
      end
      object PhoneNumberAdminEdit: TEdit
        Left = 312
        Top = 225
        Width = 416
        Height = 41
        Color = clInfoBk
        TabOrder = 3
        TextHint = 'Efternamn'
      end
    end
    object HomePageSheet: TTabSheet
      Caption = 'Hemsida'
      ImageIndex = 4
      object WebBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 1473
        Height = 723
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1457
        ExplicitHeight = 684
        ControlData = {
          4C0000003D980000B94A00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object FacebookSheet: TTabSheet
      Caption = 'Facebook'
      ImageIndex = 5
      object FacebookBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 1473
        Height = 723
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1457
        ExplicitHeight = 684
        ControlData = {
          4C0000003D980000B94A00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
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
      Left = 1190
      Top = 7
      Width = 273
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
    object Panel4: TPanel
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
  end
  object UpdateHeaderTimer: TTimer
    OnTimer = UpdateHeaderTimerTimer
    Left = 1028
    Top = 9
  end
end
