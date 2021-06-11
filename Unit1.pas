unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ShellAPI;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    OpenContainingFolder1: TMenuItem;
    Button2: TButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FindIt(fPath, fFile: string; SubDir: boolean);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Public declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// Procedure to find files
procedure TForm1.FindIt(fPath, fFile: string; SubDir: boolean);
var
  Rec: TSearchRec;
  Path: string;
begin
  Path := IncludeTrailingPathDelimiter(fPath);
  if FindFirst(Path + fFile, faAnyFile - faDirectory, Rec) = 0 then
    try
      repeat
        ListBox1.Items.Add(Path + Rec.Name);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;

  // If include subfolders is true
  if SubDir then
    if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
      try
        repeat
          if ((Rec.Attr and faDirectory) <> 0) and (Rec.Name <> '.') and
            (Rec.Name <> '..') then
            FindIt(Path + Rec.Name, fFile, True);
        until FindNext(Rec) <> 0;
      finally
        FindClose(Rec);
      end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Find files and clear content of list box and labels
  ListBox1.Clear;
  //Label5.Caption := '';
  Label6.Caption := '';
  Label7.Caption := '';
  Label8.Caption := '';

  FindIt(Edit2.Text, Edit1.Text, CheckBox1.Checked);
  Label4.Caption := 'Found ' + IntToStr(ListBox1.Count) + ' files.';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  tempname: string;
begin
  // If files found
  if (ListBox1.ItemIndex <> -1) then
  begin
    tempname := ListBox1.Items.Strings[ListBox1.ItemIndex];
    // Name
    Label5.Caption := 'Name: ' + ExtractFileName(tempname);
    Label6.Caption := 'Type: ' + ExtractFileExt(tempname);
    Label7.Caption := 'Path: ' + ExtractFilePath(tempname);
    Label8.Caption := 'Drive: ' + ExtractFileDrive(tempname);
  end;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  // If file(s) found, open file location
  if (ListBox1.ItemIndex <> -1) then
    ShellExecute(0, 'open',
      PChar(ExtractFilePath(ListBox1.Items.Strings[ListBox1.ItemIndex])), nil,
      nil, SW_SHOW)
end;

end.
