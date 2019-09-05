unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, strutils;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: INteger;
begin
  Memo2.Lines.Text := '';
  for I := 1 to Length(Memo1.Lines.Text) do
  begin
    if ((Integer(Memo1.Lines.Text[i]) >= Integer('0')) and (Integer(Memo1.Lines.Text[i]) <= Integer('9'))) or ((Integer(Memo1.Lines.Text[i]) >= Integer('A')) and (Integer(Memo1.Lines.Text[i]) <= Integer('F'))) then
      Memo2.Lines.Text := Memo2.Lines.Text + Memo1.Lines.Text[i];
  end;
  Memo1.Lines.Text := Memo2.Lines.Text;
  Memo2.Lines.Text := '$';
  for I := 1 to Length(Memo1.Lines.Text) do
  begin
    Memo2.Lines.Text := Memo2.Lines.Text + Memo1.Lines.Text[i];
    if i mod 2 = 0 then Memo2.Lines.Text := Memo2.Lines.Text + ',';
    if i mod 40 = 0 then Memo2.Lines.Text := Memo2.Lines.Text + #13 + #10;
    if i mod 2 = 0 then Memo2.Lines.Text := Memo2.Lines.Text + '$';
  end;
  Memo2.SelectAll;
  Memo2.CopyToClipboard;
end;

end.
