unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, Ora, MemDS, ExtCtrls;

type
  TForm1 = class(TForm)
    orsnSession: TOraSession;
    ora: TOraQuery;
    src: TOraDataSource;
    btn1: TButton;
    oraUpd: TOraQuery;
    tmr: TTimer;
    btn2: TButton;
    oraSobrFiles: TOraQuery;
    srcSobrFiles: TOraDataSource;
    oraMerge: TOraQuery;
    srcMerge: TOraDataSource;
    btn3: TButton;
    btn4: TButton;
    oraIgsm: TOraQuery;
    srcIgsm: TOraDataSource;
    procedure btn1Click(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  ptkwrd:Tmemorystream;
  i:Integer;
begin
  ptkwrd:= Tmemorystream.Create;
  ora.Open;
  for i:=0 to ora.RecordCount-1 do
    begin
       CreateDir('\\vipdc_files\CRSMP\'+ora.FieldByName('rule').AsString);
       CreateDir('\\vipdc_files\CRSMP\'+ora.FieldByName('rule').AsString+'\out');
       TBlobField(ora.FieldByName('files')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     ora.FieldByName('rule').AsString+
                                                      '\out\'+ora.FieldByName('filename').AsString);

        {TBlobField(ora.FieldByName('files')).SaveToFile('C:\stil\autoproc\'+
                                                       '10664'+//ora.FieldByName('rule').AsString+
                                                      '\out\'+ora.FieldByName('filename').AsString); }
        oraUpd.ParamByName('id').AsInteger:= ora.FieldByName('id').AsInteger;
        oraUpd.Execute;
        orsnSession.Commit;
        ora.Next
    end;
  ora.Close;
  ptkwrd.Free;
end;

procedure TForm1.tmrTimer(Sender: TObject);
begin
  //btn1.Click
end;

procedure TForm1.btn2Click(Sender: TObject);
  var
  ptkwrd:Tmemorystream;
  i:Integer;
begin
  ptkwrd:= Tmemorystream.Create;
  oraSobrFiles.Open;
  for i:=0 to oraSobrFiles.RecordCount-1 do
    begin
       CreateDir('\\vipdc_files\CRSMP\'+oraSobrFiles.FieldByName('rule').AsString);
       CreateDir('\\vipdc_files\CRSMP\'+oraSobrFiles.FieldByName('rule').AsString+'\out');
       TBlobField(oraSobrFiles.FieldByName('file_body')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     oraSobrFiles.FieldByName('rule').AsString+
                                                      '\out\'+oraSobrFiles.FieldByName('filename').AsString);

        {TBlobField(ora.FieldByName('files')).SaveToFile('C:\stil\autoproc\'+
                                                       '10664'+//ora.FieldByName('rule').AsString+
                                                      '\out\'+ora.FieldByName('filename').AsString); }
        orsnSession.Commit;
        oraSobrFiles.Next
    end;
  oraSobrFiles.Close;
  ptkwrd.Free;
end;

procedure TForm1.btn3Click(Sender: TObject);
  var
  ptkwrd:Tmemorystream;
  i:Integer;
begin
  ptkwrd:= Tmemorystream.Create;
  oraMerge.Open;
  for i:=0 to oraMerge.RecordCount-1 do
    begin
       //ג ÑÌÎ
       CreateDir('\\vipdc_files\CRSMP\'+oraMerge.FieldByName('rule_sk').AsString);
       CreateDir('\\vipdc_files\CRSMP\'+oraMerge.FieldByName('rule_sk').AsString+'\out');
       //נווסענ
       TBlobField(oraMerge.FieldByName('reestr_xls')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     oraMerge.FieldByName('rule_sk').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.xls');
       //סקוע
        TBlobField(oraMerge.FieldByName('bill_pdf')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     oraMerge.FieldByName('rule_sk').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.pdf');
       //ג ÌÎ
       CreateDir('\\vipdc_files\CRSMP\'+oraMerge.FieldByName('rule_u').AsString);
       CreateDir('\\vipdc_files\CRSMP\'+oraMerge.FieldByName('rule_u').AsString+'\out');
       //נווסענ
       TBlobField(oraMerge.FieldByName('reestr_xls')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     oraMerge.FieldByName('rule_u').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.xls');
       //סקוע
       TBlobField(oraMerge.FieldByName('bill_pdf')).SaveToFile('\\vipdc_files\CRSMP\'+
                                                     oraMerge.FieldByName('rule_u').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.pdf'); 



        {TBlobField(ora.FieldByName('files')).SaveToFile('C:\stil\autoproc\'+
                                                       '10664'+//ora.FieldByName('rule').AsString+
                                                      '\out\'+ora.FieldByName('filename').AsString);
                                                                }
       {CreateDir('C:\stil\autoproc\'+oraMerge.FieldByName('rule_u').AsString);
       CreateDir('C:\stil\autoproc\'+oraMerge.FieldByName('rule_u').AsString+'\out');
       //נווסענ
       TBlobField(oraMerge.FieldByName('reestr_xls')).SaveToFile('C:\stil\autoproc\'+
                                                     oraMerge.FieldByName('rule_u').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.xls');
       //סקוע
       TBlobField(oraMerge.FieldByName('bill_pdf')).SaveToFile('C:\stil\autoproc\'+
                                                     oraMerge.FieldByName('rule_u').AsString+
                                                      '\out\'+oraMerge.FieldByName('name').AsString+'.pdf');}

        orsnSession.Commit;
        oraMerge.Next
    end;
  oraMerge.Close;
  ptkwrd.Free;
end;

procedure TForm1.btn4Click(Sender: TObject);
  var
  ptkwrd:Tmemorystream;
  i:Integer;
begin
  ptkwrd:= Tmemorystream.Create;
  oraIgsm.Open;
  for i:=0 to oraIgsm.RecordCount-1 do
    begin
       CreateDir('\\vipdc_files\CRSMP\10300\');
       CreateDir('\\vipdc_files\CRSMP\10300\out');
       //נווסענ
       TBlobField(oraIgsm.FieldByName('file_body')).SaveToFile('\\vipdc_files\CRSMP\10300\out\'
                                                      +oraIgsm.FieldByName('filename').AsString);
{
       CreateDir('C:\stil\autoproc\10300');
       CreateDir('C:\stil\autoproc\10300\out');
       TBlobField(oraIgsm.FieldByName('file_body')).SaveToFile('C:\stil\autoproc\10300\out\'
                    +oraIgsm.FieldByName('filename').AsString);
                                         }
        orsnSession.Commit;
        oraIgsm.Next
    end;
  oraIgsm.Close;
  ptkwrd.Free;
end;

end.
