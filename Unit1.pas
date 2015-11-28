unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);    
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   h:HWND;
   function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if FindWindow(nil, 'Text.txt - AkelPad') <>0 then
Showmessage ('���� ������')
else
    Showmessage ('���� �� ������') ;

setwindowtext(findwindow(nil, 'Text.txt - AkelPad'), 'Note.txt - AkelPad')
  end;

procedure TForm1.Button4Click(Sender: TObject);
begin
h:=FindWindow(nil, 'Text.txt - AkelPad');
if h<>0 then
begin
if IsIconic(h) then
Showwindow(findwindow(nil, 'Text.txt - AkelPad'),sw_minimize)
else
   Showwindow(findwindow(nil, 'Text.txt - AkelPad'),sw_maximize)
end;
  end;
  function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
 Var Nm:Array[0..255] of Char;
Cs: Array[0..255] of Char;
Begin GetWindowText(Wd,Nm,255);
GetClassName(Wd,Cs,255);
Form1.ListBox1.Items.Add(String(Nm)+'/'+String(Cs));
EnumProc := TRUE;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
ListBox1.Items.Clear;
EnumWindows(@EnumProc, 0);
end;

end.
