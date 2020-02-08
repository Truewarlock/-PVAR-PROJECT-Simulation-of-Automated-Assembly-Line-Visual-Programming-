unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Image2: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1timer(sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i,t,t2,a,b,c,faza,avans,banda,waitingTime: Integer;
//variabile brat 1
  brat11,brat12,burgiu,sina1,brat22 :Integer;
  directie:boolean=true;
  directie2:boolean=false;

//variabile gauri
 hole11,hole12,hole21,hole22:Integer;
//variabile laser
 laserx,lasery,vizLinie1,vizLinie2,dist2 :Integer;
 //booleane culoare
 color1:boolean=true;
 color2:boolean=false;
 color3:boolean=false;
 color4:boolean=false;
 color5:boolean=false;
 color6:boolean=false;
 wait:Integer;
 //variabile robot 3
 sina2,coborarebrat2,coborarebrat3,visualbug:Integer;
 //variabile particule spray
 RGBAuxiliarX,RGBAuxiliarY,RGBRandom,pictare:Integer;

 //variabila semafor
 semafor:boolean=false;
 //variabile label
 produse:Integer;









const
  tmax=19;
  t2max=1000;


implementation



procedure TForm1.Timer1timer(sender: TObject);
  begin
  with Form1.Image1.Canvas do

    begin
    Label2.Caption := IntToStr(produse);
    Brush.Color:=clMoneyGreen;
    rectangle(0,0,1500,1500);
    //podea
    moveTo(150,0);
    lineTo(150,500);
    lineTO(20,620);
    moveto(150,500);
    lineto(2000,500);
    Brush.COlor:=$fc89ac;
    polygon([point(150,500),point(20,620),point(20,1000),point(2000,1000),point(2000,500)]);

    moveTo(0,600);
    lineTo(1500,600);
    Brush.Color:=clBlack;
    rectangle(0,590,1500,600);
    moveTo(0,590);
    lineTo(1500,590);
    moveTo(0,530);
    lineTo(1500,530);
    Brush.Color:=ClGray;
    rectangle(0,530,1500,590);
    Brush.Color:=ClWhite;


    //cercurile de pe banda rulanta
    begin
      for i :=0 to (149) do
      ellipse(i*10,590,i*10+10,600);
      end;
      //picioarele benzii rulante
    begin
      Brush.Color:=clSilver;
      for i:=0 to (8) do
      rectangle(i*150,590,i*150+20,900);
       end;
    begin
      for i:=0 to (8) do
      polygon([point(i*150+20,595),point(i*150+20,900),point(i*150+23,900),point(i*150+23,590)]);

      end;
      begin
      for i:=0 to (8) do
      polygon([point(i*150+50,600),point(i*150+55,600),point(i*150+55,650),point(i*150+50,660)]);

      end;
      begin
      for i:=0 to (8) do
      polygon([point(i*150+50,600),point(i*150+40,600),point(i*150+40,660),point(i*150+50,660)]);
      end;

      //liniile benzii rulante(ANIMATE)
   begin
      for i:=0 to (100) do
        begin
          moveTo(i*20+t-50,590);
          lineTo(i*20+70+t-50,530);
        end;
    end;



    
    //cutia din care iese metalul 
    Brush.Color:=clMedGray;

    moveTo(-150,400);
    lineTo(-80,330);
    lineTo(120,330);
    lineTo(120,530);
    moveTo(120,330);
    lineTo(50,400);
    moveTo(120,450);
    lineTo(50,520);
    polygon([point(-150,400),point(-80,330),point(120,330),point(50,400)]);
    polygon([point(50,400),point(50,530),point(120,530),point(120,330)]);
    polygon([point(50,400),point(50,520),point(120,450),point(120,330)]);
    if(semafor=false)then
    Brush.Color:=clGreen
    else Brush.Color:=clRed;
    ellipse(80,410,100,430);


    //obiectul de pe banda rulanta
    if (color6=true) then
      brush.Color:=$848B98
    else if (color5=true)then brush.Color:=$959BA3
    else if (color4=true)then brush.Color:=$AEB2B8
    else if (color3=true)then brush.Color:=$C7C9CB
    else if (color2=true)then brush.Color:=$D7D7D8
    else brush.Color:=clWhite;
    rectangle(0+a+dist2-300,570+b,150+a+dist2-300,580+b);
    polygon([point(0+a+dist2-300,570+b),point(150+a+dist2-300,570+b),point(180+a+dist2-300,540+b),point(30+a+dist2-300,540+b)]);
    polygon([point(150+a+dist2-300,580+b),point(150+a+dist2-300,570+b),point(180+a+dist2-300,540+b),point(180+a+dist2-300,550+b)]);
    Brush.Color:=clBlack;
    ellipse(25+a+dist2-300,hole11,30+a+dist2-300,hole12);
    ellipse(140+a+dist2-300,hole21,145+a+dist2-300,hole22);
    //linie de e obiect
    Pen.Width:=3;
    moveTo(510+dist2,vizLinie1);
    lineTo(560+dist2,vizLinie1);
    moveTo(510+dist2,vizLinie2);
    lineTo(560+dist2,vizLinie2);
    Pen.Width:=1;

    Brush.Color:=clMedGray;
    rectangle(-150,400,50,600);







    //brat robotic 1
      //suport sina
    Brush.COlor:=clMedGray;

    rectangle(200,330,400,340);
    moveTo(200,330);
    lineTo(210,320);
    LineTo(410,320);
    lineTO(400,330);
    Brush.Color:=clSilver;
    polygon([point(200,330),point(210,320),point(410,320),point(400,330)]);
    polygon([point(400,340),point(400,330),point(410,320),point(410,330)]);
      //modulul care se plimba pe sina
    Brush.COlor:=clOlive;
    rectangle(360+sina1,330,400+sina1,340);
    polygon([point(360+sina1,330),point(400+sina1,330),point(410+sina1,320),point(370+sina1,320)]);
      //bratul extins din modul
    polygon([point(370+sina1,340),point(390+sina1,340),point(390+sina1,380),point(370+sina1,380)]);
    Brush.Color:=$2F6B55;
    polygon([point(390+sina1,340),point(395+sina1,340),point(395+sina1,370),point(390+sina1,380)]);
      //brat extisn partea 2
    polygon([point(375+sina1,380),point(385+sina1,380),point(385+sina1,390+brat11),point(375+sina1,390+brat11)]);
    polygon([point(385+sina1,390+brat11),point(385+sina1,380),point(388+sina1,380),point(388+sina1,388+brat11)]);
    //brat partea 3
    rectangle(373+5+sina1,390+brat11,380+5+sina1,420+brat12+brat11);
    //polygon([point(380+5+sina1,420+brat12+brat11),point(380+5+sina1,390+brat12+brat11),point(380+6+sina1,390+brat12+brat11),point(380+6+sina1,419+brat12+brat11)]);
    //brat paretea 4

    Brush.COlor:=clBlack;
    rectangle(380+sina1,420+brat11+brat12,382+sina1,450+brat22+brat12+brat11);


    //robot 2
    Brush.Color:=clSilver;
    // laser
    polygon([point(495,340),point(525,340),point(525,370),point(495,370)]);
    polygon([point(525,370),point(525,340),point(535,330),point(535,360)]);
    Brush.COlor:=clMedGray;
    // suport laser
    rectangle(450+40,330,490+40,340);
    moveTo(450+40,330);
    lineTo(460+40,320);
    LineTo(500+40,320);
    lineTo(490+40,330);
    moveTo(500+40,320);
    lineTO(500+40,330);
    lineTo(490+40,340);
    Brush.Color:=clSilver;
    polygon([point(450+40,330),point(460+40,320),point(500+40,320),point(490+40,330)]);
    polygon([point(490+40,340),point(490+40,330),point(500+40,320),point(500+40,330)]);
    //pirmaida laster
    polygon([point(495,370),point(525,370),point(510,420)]);
    polygon([point(510,420),point(525,370),point(535,360)]);

    //raza laser
    pen.Width:=6;
    pen.Color:=clRed;
    moveto(510,420);
    lineto(510+laserx,420+lasery);
    pen.Color:=clBlack;
    pen.Width:=1;

    //robot 3

       Brush.COlor:=clMedGray;
    rectangle(650,330,850,340);
    Brush.Color:=clSilver;
    polygon([point(200+450,330),point(210+450,320),point(410+450,320),point(400+450,330)]);
    polygon([point(400+450,340),point(400+450,330),point(410+450,320),point(410+450,330)]);
     //rama
     Brush.COlor:=clBlue;



    //pistol de vopsit

    //ce adaug acum nou
    polygon([point(780-sina2,390+coborarebrat2+coborarebrat2),point(790-sina2,380+coborarebrat2+coborarebrat2),point(890-sina2,380+coborarebrat2+coborarebrat2),point(880-sina2,390+coborarebrat2+coborarebrat2)]);
    rectangle(820-sina2,390,840-sina2,390+coborarebrat2);
    polygon([point(840-sina2,390+coborarebrat2),point(840-sina2,390),point(843-sina2,390),point(843-sina2,390-visualbug+coborarebrat2)]);
    rectangle(825-sina2,390+coborarebrat2,835-sina2,390+coborarebrat2+coborarebrat2);
    polygon([point(835-sina2,390+coborarebrat2+coborarebrat2),point(835-sina2,390+coborarebrat2),point(838-sina2,390+coborarebrat2),point(838-sina2,390-visualbug+coborarebrat2+coborarebrat2)]);




    rectangle(780-sina2,390+coborarebrat2+coborarebrat2,880-sina2,400+coborarebrat2+coborarebrat2);
    //polygon([point(880-sina2,390+coborarebrat2),point(845-sina2,390+coborarebrat2),point(850-sina2,380+coborarebrat2),point(890-sina2,380+coborarebrat2)]);
    polygon([point(880-sina2,400+coborarebrat2+coborarebrat2),point(880-sina2,390+coborarebrat2+coborarebrat2),point(890-sina2,380+coborarebrat2+coborarebrat2),point(890-sina2,390+coborarebrat2+coborarebrat2)]);
    //polygon([point(780-sina2,390+coborarebrat2),point(815-sina2,390+coborarebrat2),point(815-sina2,380+coborarebrat2),point(790-sina2,380+coborarebrat2)]);

     //baza

    polygon([point(360+450-sina2,330),point(400+450-sina2,330),point(410+450-sina2,320),point(370+450-sina2,320)]);
    polygon([point(845-sina2,340),point(850-sina2,340),point(850-sina2,380),point(845-sina2,390)]);
    rectangle(360+450-sina2,330,400+450-sina2,340);
    rectangle(815-sina2,340,845-sina2,390);


    //varf pistol de vopsit
    polygon([point(786-sina2,400+coborarebrat2+coborarebrat2),point(792-sina2,400+coborarebrat2+coborarebrat2),point(790-sina2,410+coborarebrat2+coborarebrat2)]);
    polygon([point(840-sina2,400+coborarebrat2+coborarebrat2),point(836-sina2,410+coborarebrat2+coborarebrat2),point(832-sina2,400+coborarebrat2+coborarebrat2)]);
    polygon([point(879-sina2,400+coborarebrat2+coborarebrat2),point(875-sina2,410+coborarebrat2+coborarebrat2),point(871-sina2,400+coborarebrat2+coborarebrat2)]);



    //cutia gri de pe banda rulanta
    Brush.Color:=clMedGray;
    rectangle(1000,400,1200,600);
    moveTo(1000,400);
    lineTo(1070,330);
    lineTo(1270,330);
    lineTo(1270,530);
    moveTo(1270,330);
    lineTo(1200,400);
    moveTo(1270,450);
    lineTo(1200,520);
    polygon([point(1000,400),point(1070,330),point(1270,330),point(1200,400)]);
    polygon([point(1200,400),point(1200,530),point(1270,530),point(1270,330)]);
    polygon([point(1200,400),point(1200,520),point(1270,450),point(1270,330)]);



    //ferestre
    Brush.Color:=$F0CAA6;
    rectangle(300,66,500,166);
    rectangle(550,66,750,166);
    rectangle(800,66,1000,166);
    Brush.Color:=clYellow;
    ellipse(950,70,1000,120);
    Brush.COlor:=clBlack;
    Rectangle(398,100,402,166);
    rectangle(350,110,450,113);
    rectangle(370,120,430,123);
    rectangle(390,130,410,133);

    rectangle(450,110,447,107);
    rectangle(350,110,353,107);
    Moveto(450,110);
    lineTo(500,110);
    Moveto(350,110);
    lineTo(300,110);

    rectangle(430,120,427,117);
    rectangle(370,120,373,117);
    Moveto(430,120);
    lineTo(500,120);
    Moveto(370,120);
    lineTo(300,120);

    rectangle(410,130,407,127);
    rectangle(390,130,393,127);
    Moveto(410,130);
    lineTo(500,130);
    Moveto(390,130);
    lineTo(300,130);

    Moveto(550,110);
    lineTo(750,110);
    Moveto(550,120);
    lineTo(750,120);
    Moveto(550,130);
    lineTo(750,130);

    Moveto(800,110);
    lineTo(1000,110);
    Moveto(800,120);
    lineTo(1000,120);
    Moveto(800,130);
    lineTo(1000,130);




    //name tag
    Brush.Color:=clBlue;
    roundrect(0,0,155,40,10,10);
    font.size:=5;
    font.color:=clRed;
    textout(0,0,'PATRONA VALENTIN MARIUS');
    textout(0,15,'Procesarea metalurgica');



    if (t2=0) or (t2=t2max) then directie2:=not directie2;
    if directie2 then
    t2:=t2+1 else
    t2:=1001;


 case faza of
  0:
  begin
  a:=a+1;
  if(a>535) then faza:=1;
  if (t=0) or (t=tmax) then directie:=not directie;
    if directie then
    t:=t+1 else
    t:=0;
  end;
  1:
  begin
  semafor:=True;
  brat11:=brat11+1;
  if(brat11>40) then faza:=2;
  end;
  2:
  begin
  brat12:=brat12+1;
  brat22:=10;
  if(brat12>60) and (hole21=555) then
  begin
  hole11:=555;
  hole12:=560;
  end;

  if(brat12>60)and (brat22=10) then
   begin
  hole21:=555;
  hole22:=560;
  faza:=3;
  end
  end;
  3:
  begin
  if(brat12<=0) then faza:=4;
  brat12:=brat12-1;
  if(brat12=0) then faza:=4;
  end;
  4:
  begin
  if(brat11<=0) then faza:=5;
  brat11:=brat11-1;
  if(brat11=0) and (sina1<0) then
  begin
  faza:=6;
  end
  else
  begin
  if(brat11=0) then faza:=5;
  end;
  end;
  5:
  begin
  sina1:=sina1-1;
  if(sina1<-114) then faza:=1;
  end;
  6:
  begin
  sina1:=sina1+1;
  if(sina1=0) then faza:=7;
  end;
  7:
  begin
  semafor:=false;
  if (t=0) or (t=tmax) then directie:=not directie;
    if directie then
    t:=t+1 else
    t:=0;
  a:=a+1;
  if(a>740) then
  begin

  faza:=8;
  end;

  end;

  8:
  begin
   semafor:=True;
  lasery:=135;
  laserx:=laserx+1;
  Pen.Width:=3;
  moveTo(510,555);
  lineTo(510+laserx,555);
  Pen.Width:=1;
  if (laserx=50) then faza:=9;
  

  end;

  9:
  begin
  lasery:=0;
  laserx:=0;
  vizLinie1:=555;
  faza:=10;

  end;

  10:
  begin
  lasery:=140;
  laserx:=laserx+1;
  Pen.Width:=3;
  moveTo(510,560);
  lineTo(510+laserx,560);
  Pen.Width:=1;
  if (laserx=50) then faza:=11;

  end;

  11:
  begin
  lasery:=0;
  laserx:=0;
  vizLinie2:=560;
  faza:=12;
  end;

  12:
  begin
  semafor:=false;
  if (t=0) or (t=tmax) then directie:=not directie;
    if directie then
    t:=t+1 else
    t:=0;

  dist2:=dist2+1;
  if(dist2>200) then faza:=19;
  end;
  13:
  begin

  wait:=wait+1;
  begin
  with Form1.Image1.Canvas do

    begin
    Pen.Width:=1;
    Pen.Color:=RGB(random(255),random(255),random(255));

    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(787-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(788-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(789-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(790-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(791-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(792-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(793-sina2 ,450+coborarebrat2+coborarebrat2);

     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(833-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(834-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(835-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(836-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(837-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(838-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(839-sina2,450+coborarebrat2+coborarebrat2);

     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(872-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(873-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(874-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(875-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(876-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(877-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(878-sina2,450+coborarebrat2+coborarebrat2);
    Pen.Width:=1;
    Pen.Color:=clBlack;



end;
    end;
  if (wait=10) then
  begin
  color6:=False;
  color5:=False;
  color4:=False;
  color3:=False;
  color2:=True;
  color1:=False;
  wait:=0;
  faza:=14;
  end;
  end;
  14:
  begin
  wait:=wait+1;
  begin
  with Form1.Image1.Canvas do

    begin
    Pen.Width:=1;
    Pen.Color:=RGB(random(255),random(255),random(255));

    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(787-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(788-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(789-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(790-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(791-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(792-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(793-sina2 ,450+coborarebrat2+coborarebrat2);

     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(833-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(834-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(835-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(836-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(837-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(838-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(839-sina2,450+coborarebrat2+coborarebrat2);

     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(872-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(873-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(874-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(875-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(876-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(877-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(878-sina2,450+coborarebrat2+coborarebrat2);
    Pen.Width:=1;
    Pen.Color:=clBlack;




end;
    end;
  if (wait=11) then
  begin
  color6:=False;
  color5:=False;
  color4:=False;
  color3:=True;
  color2:=False;
  color1:=False;
  wait:=0;
  faza:=15;
  end;
  end;
  15:
  begin
  begin
  with Form1.Image1.Canvas do

    begin
    Pen.Width:=1;
    Pen.Color:=RGB(random(255),random(255),random(255));

    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(787-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(788-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(789-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(790-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(791-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(792-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(793-sina2 ,450+coborarebrat2+coborarebrat2);

     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(833-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(834-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(835-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(836-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(837-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(838-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(839-sina2,450+coborarebrat2+coborarebrat2);

     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(872-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(873-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(874-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(875-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(876-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(877-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(878-sina2,450+coborarebrat2+coborarebrat2);
    Pen.Width:=1;
    Pen.Color:=clBlack;




end;
    end;
  wait:=wait+1;
  if (wait=11) then
  begin
  color6:=False;
  color5:=False;
  color4:=True;
  color3:=False;
  color2:=False;
  color1:=False;
  wait:=0;
  faza:=16;
  end;
  end;
  16:
  begin
  wait:=wait+1;
  begin
  with Form1.Image1.Canvas do

    begin
    Pen.Width:=1;
    Pen.Color:=RGB(random(255),random(255),random(255));

    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(787-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(788-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(789-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(790-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(791-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(792-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(793-sina2 ,450+coborarebrat2+coborarebrat2);

     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(833-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(834-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(835-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(836-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(837-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(838-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(839-sina2,450+coborarebrat2+coborarebrat2);

     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(872-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(873-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(874-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(875-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(876-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(877-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(878-sina2,450+coborarebrat2+coborarebrat2);
    Pen.Width:=1;
    Pen.Color:=clBlack;




    end;
    end;
  if (wait=11) then
  begin
  color6:=False;
  color5:=True;
  color4:=False;
  color3:=False;
  color2:=False;
  color1:=False;
  wait:=0;
  faza:=17;
  end;
  end;
  17:
  begin
  wait:=wait+1;
  begin
  with Form1.Image1.Canvas do

    begin
    Pen.Width:=1;
    Pen.Color:=RGB(random(255),random(255),random(255));

    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(787-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(788-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(789-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(790-sina2 ,450+coborarebrat2+coborarebrat2);
     moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(791-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(792-sina2 ,450+coborarebrat2+coborarebrat2);
    moveTo(790-sina2 ,410+coborarebrat2+coborarebrat2);
    lineTo(793-sina2 ,450+coborarebrat2+coborarebrat2);

     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(833-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(834-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(835-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(836-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(837-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(838-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(836-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(839-sina2,450+coborarebrat2+coborarebrat2);

     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(872-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(873-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(874-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(875-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(876-sina2,450+coborarebrat2+coborarebrat2);
     moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(877-sina2,450+coborarebrat2+coborarebrat2);
    moveTo(875-sina2,410+coborarebrat2+coborarebrat2);
    lineTo(878-sina2,450+coborarebrat2+coborarebrat2);
    Pen.Width:=1;
    Pen.Color:=clBlack;




end;
    end;
  if (wait=11) then
  begin
  wait:=0;
  color6:=True;
  color5:=False;
  color4:=False;
  color3:=False;
  color2:=False;
  color1:=False;
  wait:=0;
  faza:=21;
  end;




  end;
  18:
  begin
  end;

    19:
  begin
  semafor:=True;
  sina2:=sina2+1;
  if(sina2>100) then faza:=20;
  end;
  20:
  begin
  visualbug:=3;
  coborarebrat2:=coborarebrat2+1;
  if (coborarebrat2>50) then faza:=13;
  end;
  21:
  begin
  visualbug:=0;
  coborarebrat2:=coborarebrat2-1;
  if(coborarebrat2=0)then faza:=22;
  end;
  22:
  begin
  sina2:=sina2-1;
  if (sina2=0) then faza:=23;
  end;
  23:
  begin
  semafor:=false;
  if (t=0) or (t=tmax) then directie:=not directie;
    if directie then
    t:=t+1 else
    t:=0;

  dist2:=dist2+1;
  if(dist2=620) then
  begin
  produse:=produse+1;
  Label2.Caption := IntToStr(produse);
  end;
  if(dist2>1000) then faza:=25;
  end;
  25:
  begin
  a:=0;
  dist2:=0;
  hole11:=0;
  hole12:=0;
  hole21:=0;
  hole22:=0;
  color6:=False;
  color5:=False;
  color4:=False;
  color3:=False;
  color2:=False;
  color1:=True;
  vizLinie1:=0;
  vizLinie2:=0;
  faza:=0;
  end;
  
  


  end;






  end;


  end;
  


{$R *.dfm}

end.
