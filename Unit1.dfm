object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ghorbani Find file'
  ClientHeight = 350
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 79
    Width = 39
    Height = 13
    Caption = 'Results:'
  end
  object Label2: TLabel
    Left = 8
    Top = 21
    Width = 24
    Height = 13
    Caption = 'Find:'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 26
    Height = 13
    Caption = 'Path:'
  end
  object Label4: TLabel
    Left = 8
    Top = 320
    Width = 3
    Height = 13
  end
  object Label6: TLabel
    Left = 380
    Top = 32
    Width = 3
    Height = 13
  end
  object Label7: TLabel
    Left = 380
    Top = 48
    Width = 3
    Height = 13
  end
  object Label8: TLabel
    Left = 380
    Top = 64
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 380
    Top = 16
    Width = 3
    Height = 13
  end
  object Label9: TLabel
    Left = 162
    Top = 318
    Width = 92
    Height = 13
    Caption = '+98-919-143-7539'
  end
  object Label10: TLabel
    Left = 17
    Top = 318
    Width = 112
    Height = 13
    Caption = 'Ghorbani77@gmail.com'
  end
  object Edit1: TEdit
    Left = 38
    Top = 21
    Width = 163
    Height = 21
    TabOrder = 0
    Text = '*.pas'
  end
  object Button1: TButton
    Left = 207
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 96
    Width = 715
    Height = 216
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
  end
  object CheckBox1: TCheckBox
    Left = 207
    Top = 50
    Width = 108
    Height = 17
    Caption = 'Include subfolders'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 38
    Top = 48
    Width = 163
    Height = 21
    TabOrder = 1
    Text = 'd:\'
  end
  object Button2: TButton
    Left = 648
    Top = 318
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = Button2Click
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 96
    object OpenContainingFolder1: TMenuItem
      Caption = 'Open Containing Folder'
      OnClick = ListBox1DblClick
    end
  end
end
