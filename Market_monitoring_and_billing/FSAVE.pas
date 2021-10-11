unit FSAVE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ExtCtrls;

type
  TSAVE = class(TForm)
    Label3: TLabel;
    Label8: TLabel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Button2: TButton;
    Button1: TButton;
    Label6: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  SAVE: TSAVE;

implementation

{$R *.dfm}

procedure TSAVE.Button2Click(Sender: TObject);
var source,path1,PATH:string;
   hichsoft: longbool;
   i:integer;

begin
  path:=ExtractFilePath(Application.EXEName);
  i:=0;
  While i<5 do
   begin
     Path1:= label3.Caption+'\'+ListBox1.Items.Strings[i];
     Source:=path+ListBox1.Items.Strings[i];
     CopyFile(pchar( source),pchar( path1),hichsoft);
     i:=i+1;
     ProgressBar1.Position:= ProgressBar1.Position+1;
   end;
    ShowMessage('Sauvegarde Terminée..');
    ProgressBar1.Position:=0;
end;

procedure TSAVE.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TSAVE.FormCreate(Sender: TObject);
begin
  ListBox1.Items[0]:='Client.db';
  ListBox1.Items[1]:='Client.mb';
  ListBox1.Items[2]:='Client.px';
  //-------
  ListBox1.Items[3]:='AFFAIRE.DB';
  ListBox1.Items[4]:='AFFAIRE.MB';
  ListBox1.Items[5]:='AFFAIRE.PX';
  //-------
  ListBox1.Items[6]:='Facture.DB';
  ListBox1.Items[7]:='Facture.MB';
  ListBox1.Items[8]:='Facture.PX';
  //-------
  ListBox1.Items[9]:='Ligne_fact.DB';
  ListBox1.Items[10]:='Ligne_fact.MB';
  ListBox1.Items[11]:='Ligne_fact.PX';
    //-------
  ListBox1.Items[12]:='Ligne_Devis.DB';
  ListBox1.Items[13]:='Ligne_Devis.MB';
  ListBox1.Items[14]:='Ligne_Devis.PX';
      //-------
  ListBox1.Items[15]:='Attachement.db';
  ListBox1.Items[16]:='Attachement.MB';
  ListBox1.Items[17]:='Attachement.PX';
    //-------
  ListBox1.Items[18]:='Ligne_attch.DB';
  ListBox1.Items[19]:='Ligne_attch.MB';
  ListBox1.Items[20]:='Ligne_attch.PX';
 //-------
  ListBox1.Items[21]:='Facture3.DB';
  ListBox1.Items[22]:='Facture3.MB';
  ListBox1.Items[23]:='Facture3.PX';
 //-------
  ListBox1.Items[24]:='Facture2.DB';
  ListBox1.Items[25]:='Facture2.MB';
  ListBox1.Items[26]:='Facture2.PX';
End;

end.
