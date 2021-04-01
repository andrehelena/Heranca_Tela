unit View.Padrao.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm_Padrao_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Padrao_Form: TForm_Padrao_Form;

implementation

uses
  Vcl.StdCtrls;

{$R *.dfm}

procedure TForm_Padrao_Form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ActiveControl is TCustomMemo) then
  begin
    if (key = VK_RETURN) and (ssCtrl in Shift) then
    begin
      SelectNext(ActiveControl, True, True);
      Key := 0;
    end;
  end else
  if (Key = VK_RETURN) and not(ssShift in Shift) then
  begin
	  SelectNext(ActiveControl, True, True);
    Key := 0;
  end else
  if (Key = VK_RETURN) and (ssShift in Shift) then
  begin
	  SelectNext(ActiveControl, False, True);
    Key := 0;
  end;
end;

end.
