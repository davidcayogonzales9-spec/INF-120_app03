unit ucadena;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uconjunto, Dialogs;//añadir la unidad , y luego la libreria
const
  MAX_ELEM=5000;
type

  { TCadena }

  TCadena = Class
    private
      elem : array[1..MAX_ELEM] of char;
      dim:integer;
      May,Min,Dig,Sep:TConjunto;
    public
      constructor crear();
      procedure setDim (dime:integer);
      function getDim():integer;
      procedure setChar(pos:integer;ele:char);
      function getChar(pos:integer):char;
      procedure addChar(ele:char);
      procedure insChar(pos:integer;ele:char);
      procedure elimchar(pos:integer);
      function cantPal():integer;
      procedure leerPal(var pos:integer;var pal:String);
      function busPal(palB:String):integer;
      procedure addPal(pal:String);
      procedure insPal(pos:integer;pal:string);
      procedure elimPal(pal:string);
      procedure cambPal(palO,palR:String);
      // Métodos de Caracteres los que faltaban
      procedure interChar(pos1, pos2: integer);
      function cantChar(): integer;
      function busqChar(c: char): integer;
      //LOS QUE FALTABAN
      procedure invertir();
      procedure rotar(cant: integer);
      procedure mayusculas();
      procedure minusculas();
      procedure Titulo();
                                               //CTRL + SHIFT + C

  end;

implementation

{ TCadena }

constructor TCadena.crear();
var
pos:integer;
begin
  dim:=0;
  for pos :=1 to MAX_ELEM do
  elem[pos]:= char(0); //NULL

  May:=TConjunto.crear();
  for pos := 0 to 25 do
      May.agregar(char(65+pos));
  Min:=TConjunto.crear() ;
  for pos := 0 to 25 do
      Min.agregar(char(97+pos));
  Dig:=TConjunto.crear();
  for pos := 0 to 9 do
      Dig.agregar(char(48+pos));

  //SEPARADORES
  Sep:=TConjunto.crear();
  Sep.agregar('-');
  Sep.agregar('_');
  Sep.agregar(',');
  Sep.agregar('.');
  Sep.agregar(':');
  Sep.agregar(';');
  Sep.agregar('#');
  Sep.agregar(' ');


end;

procedure TCadena.setDim(dime: integer);
begin
    if(dime>=0) AND (dime<=MAX_ELEM)then
      dim := dime
    else
      showMEssage('Dimension fuera de rango...')
end;

function TCadena.getDim(): integer;
begin
     result := dim;
end;

procedure TCadena.setChar(pos: integer; ele: char);
begin
     if(pos>=1) AND (pos<=dim)then
      elem[pos]:= ele
    else
      showMEssage('Posicion fuera de rango...')
end;

function TCadena.getChar(pos: integer): char;
begin
      if(pos>=1) AND (pos<=dim)then
      result := elem[pos]
    else
      result := char(0);
end;

procedure TCadena.addChar(ele: char);
begin
  if(dim<MAX_ELEM)then
  begin
    dim := dim + 1 ;
    elem[dim]:= ele;
  end;

end;

procedure TCadena.insChar(pos: integer; ele: char);
 var
 des:integer;
begin
    if (pos>= 1)AND(pos<=dim + 1) then
    begin
      for des:=dim downto pos do
          elem[des+1]:=  elem[des];
      elem[pos] := ele;
      dim := dim +1;
      end
    else
    showMessage('Posicion fuera de rango...')
    end;

procedure TCadena.elimchar(pos: integer);
var
  des:integer;
begin
  if (pos>=1)AND(pos<=dim)then
  begin
    for des:=pos to dim-1 do
        elem[des]:=elem[des+1];
    dim := dim -1;
    end
  else
    showMessage('Posicion fuera de rango...')
end;

function TCadena.cantPal(): integer;
var
  cp,pos:integer;
  pal:String;
begin
  cp := 0;
  pos := 1;
  while (pos<=dim)do
  begin
    leerPal(pos,pal);
    if (pal<>'')then
      cp := cp+1;
    end;
  result := cp;
end;

procedure TCadena.leerPal(var pos: integer; var pal: String);
begin
  pal :='';
  while (pos<=dim)AND(NOT Sep.pertenece(elem[pos]))do
  begin
    pal := pal + elem [pos];
    pos := pos + 1;
  end;
  while (pos<=dim)AND(Sep.pertenece(elem[pos]))do
    pos := pos + 1;
end;

function TCadena.busPal(palB: String): integer;
var
  pos,posant:integer;
  sw:boolean;
  pal:String;
begin
  sw :=false;
  pos := 1;
  while(pos<=dim)AND(NOT sw)do
  begin
    posant:= pos;
    leerPal(pos,pal);
    if(pal=palB)then
     sw :=true
  end;
  if (sw) then
    result := posant
  else
    result :=-1;

end;

procedure TCadena.addPal(pal: String);
var
   n,des:integer;
begin
  n:= length(pal);
  if(dim+n+1<MAX_ELEM) then //hay espacio para la palabra ?
  begin
    addchar(' ');
    for des := 1 to n do
        addChar(pal[des]);
  end
  else
  showMessage('Almacenamiento lleno...');
end;

procedure TCadena.insPal(pos: integer; pal: string);
var
  n,des:integer;
begin
  n:=length(pal);
  if(dim+n+2<MAX_ELEM) then
  begin
    insChar(pos,' ');
    for des:=1 to n do
        insChar(pos+des, pal[des]);
    insChar(pos+n+1, ' ' );
    end
  else
    showMessage('No hay espacio de almacenamiento...');

end;

procedure TCadena.elimPal(pal: string);
var
  pos,des,n:integer;
begin
  pos :=busPal(pal);
  if (pos<>-1) then
  begin
    n:= length(pal);
    elimChar(pos-1);
    for des := 1 to n do
        elimChar(pos-1);
    end
  else
  showMessage('La palabra no existe');

end;

procedure TCadena.cambPal(palO, palR: String);
var
  pos:integer;
begin
  pos := busPal(palO);
    if (pos<>-1) then// si se encuentra
    begin
      elimPal(palO);
      insPal(pos-1, PalR);
    end
  else
    showMessage('La palabra No existe...');
end;

procedure TCadena.interChar(pos1, pos2: integer);
var
  aux: char;
begin
  if (pos1 >= 1) and (pos1 <= dim) and (pos2 >= 1) and (pos2 <= dim) then
  begin
    aux := elem[pos1];
    elem[pos1] := elem[pos2];
    elem[pos2] := aux;
  end;
end;

function TCadena.cantChar(): integer;
begin
  result := dim;
end;

function TCadena.busqChar(c: char): integer;
var
  pos: integer;
  sw: boolean;
begin
  pos := 1;
  sw := false;
  while (pos <= dim) and (not sw) do
  begin
    if elem[pos] = c then
      sw := true
    else
      pos := pos + 1;
  end;
  if sw then
    result := pos
  else
    result := -1;
end;
   procedure TCadena.invertir();
var
  i: integer;
begin
  for i := 1 to dim div 2 do
    interChar(i, dim - i + 1);
end;

procedure TCadena.rotar(cant: integer);
var
  i, r: integer;
  ultimo: char;
begin
  if dim > 1 then
  begin
    cant := cant mod dim;
    for r := 1 to cant do
    begin
      ultimo := elem[dim];
      for i := dim downto 2 do
        elem[i] := elem[i - 1];
      elem[1] := ultimo;
    end;
  end;
end;

procedure TCadena.mayusculas();
var
  i: integer;
begin
  for i := 1 to dim do
    elem[i] := UpCase(elem[i]);
end;

procedure TCadena.minusculas();
var
  i: integer;
begin
  for i := 1 to dim do
    elem[i] := LowerCase(elem[i]);
end;

procedure TCadena.Titulo();
var
  i: integer;
  esInicio: boolean;
begin
  esInicio := true;
  for i := 1 to dim do
  begin
    if Sep.pertenece(elem[i]) then
      esInicio := true
    else
    begin
      if esInicio then
      begin
        elem[i] := UpCase(elem[i]);
        esInicio := false;
      end
      else
        elem[i] := LowerCase(elem[i]);
    end;
  end;
end;
end.

