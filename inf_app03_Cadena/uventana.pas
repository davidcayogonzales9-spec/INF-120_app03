unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  Buttons, ucadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    POS: TEdit;
    ELE: TEdit;
    Label1: TLabel;
    SG: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    Cad:TCadena;
    procedure updateSG();

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Cad:=TCadena.crear();
  updateSG();
  showMessage('Cadena de Caracter Inicializada')  //CREAR
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if POS.Text <> '' then
  begin
    Cad.rotar(StrToInt(POS.Text));                   //ROTAR PALABRA
    updateSG();
    POS.Text := '';
  end;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  Cad.mayusculas();
  updateSG();                                         //MAYUSCULAS
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  Cad.minusculas();
  updateSG();                                         //MINUSCULAS
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  Cad.Titulo();
  updateSG();                                          //TITULO
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  POS.Text:= IntToStr(Cad.busPal(ELE.Text));     //BUSCAR PALABRA
  ELE.Text:= '';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Cad.addPal(ELE.Text);                           //AÑADIR PALABRA FINAL
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Cad.insPal(StrToInt(POS.Text),ELE.Text);          //INSERTAR PALABRA
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Cad.elimPal(ELE.Text);                            //ELIMINAR PALABRA
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Cad.cambPal(POS.Text,ELE.Text);                   //CAMBIAR PALABRA
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin                                                   //SALIR
  close();
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if (POS.Text <> '') and (ELE.Text <> '') then
  begin
    Cad.interChar(StrToInt(POS.Text), StrToInt(ELE.Text));  //INTERCAMBIAR CARACTER
    updateSG();
    POS.Text := '';
    ELE.Text := '';
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  POS.Text := IntToStr(Cad.cantChar());     //CANTIDAD DE CARACTERES
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if ELE.Text <> '' then
  begin
    POS.Text := IntToStr(Cad.busqChar(ELE.Text[1]));     //BUSQUEDA DE CARACTER
    ELE.Text := '';
  end;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Cad.invertir();                                    //INVERTIR PALABRA
  updateSG();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Cad.setDim(StrToInt(POS.Text));                  //SETDIM
  updateSG();
  POS.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                                               //GETDIM
  POS.Text:=IntToStr(Cad.getDim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Cad.setChar(StrToInt(POS.Text),ELE.Text[1]);
  updateSG();                                        //SETCHAR
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin                                                  //GETCHAR
  ELE.Text:= Cad.getChar(StrToInt(POS.Text));
  POS.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Cad.addChar(ELE.Text[1]);                           //AÑADIR CARACTER
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Cad.insChar(StrToInt(POS.Text),ELE.Text[1]);
  updateSG();                                         //INSERTAR CARACTER
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Cad.elimchar(StrToInt(POS.Text));                   //ELIMINAR CARACTER
  updateSG();
  POS.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  POS.Text:=IntToStr(Cad.cantPal());                   //CANTIDAD DE PALABRAS
end;

procedure TForm1.updateSG();
var
  des:integer;                                         //PROCESO CREADO PARA QUE SE ACTUALICE LA MATRIZ
begin
   SG.ColCount := Cad.getDim();
   for des := 1 to Cad.getDim() do
       SG.Cells[des-1,0]:= Cad.getChar(des);
end;

end.

