unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, Vcl.Buttons, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, REST.Authenticator.Basic;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  lJSONObject: TJSONObject;
  lJSONArray: TJSONArray;
  lJSONText: string;
  lI: Integer;
begin
  Memo1.Lines.Clear;

  RESTRequest1.Execute;
  lJSONText := RESTRequest1.Response.JSONValue.ToString;

  lJSONObject :=  TJSONObject.Create;

  lJSONText := lJSONObject.Format(3);

  lJSONArray := TJSONObject.ParseJSONValue(lJSONText) as TJSONArray;
  try
    for lI := 0 to Pred(lJSONArray.Count) do
    begin
      Memo1.Lines.Add(lJSONArray.Items[lI].GetValue<string>('TipoPesquisa'));
    end;
  finally
    lJSONObject.Free;
    lJSONArray.Free;
  end;
end;

end.
