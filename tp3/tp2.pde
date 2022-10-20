/*
 | TP1 | Tmm2 | FdA | UNLP |
 ----------- TP2: Prototipo 1 ---------------
 Comision: Lisandro | Prof.Lisandro Peralta.
 Alumnas:  D'Angelo Victoria(88529/7).
 Besnati Victoria(88151/1).
 Nayla Aguilar(88106/6).
 -------------------------------------------
 Video: 
 -------------------------------------------
 */

import ddf.minim.*;
import fisica.*;
import TUIO.*;

Minim minim;
AudioPlayer musica; //musica fondo
AudioPlayer maullido; 
AudioPlayer victoria; 
AudioPlayer derrota; 
FWorld mundo;
TuioProcessing tuioClient;

boolean ganar = false;
boolean perder = false;
boolean cambio = false;
boolean viento = false;
boolean muchoviento = false;
boolean perdervida = false;
boolean pw = false;
int nro;
int ID = 3;
int vida = 10;

PImage [] gatubi = new PImage [6]; 
PImage [] corazon = new PImage [3]; 
PImage tm;
PImage tl; 
PImage tn; 
boolean conTUIO = true;

juego j;

void setup() {
  size(1024, 768);
  surface.setTitle("--Michiball--");
  Fisica.init(this);

  minim = new Minim (this);
  musica=minim.loadFile("musica.mp3", 2048); //intrumental de fondo
  maullido=minim.loadFile("maullido.mp3", 2048); //colisiones
  victoria=minim.loadFile("victoria.mp3", 2048); //estado ganar
  derrota=minim.loadFile("derrota.mp3", 2048);  //estado perder

  letra =createFont("Blueberry Days.ttf", 60);

  for (int i = 0; i<gatubi.length; i++) {
    gatubi[i]= loadImage("michi"+i+".png");
  }
  for (int i = 1; i<corazon.length; i++) {
    corazon[i]= loadImage("corazon"+i+".png");
  }

  tm = loadImage("tarjetamilo.png");
  tl = loadImage("tarjetalucy.png");
  tn = loadImage("tarjetanygma.png");

  j = new juego();
  tuioClient = new TuioProcessing(this);
}
void draw() {
  j.dibujar();
}
void contactStarted(FContact contacto) {

  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();

  String nombre1 = nombre(body1);
  String nombre2 = nombre(body2);

  //--------------------------------------------------------------------------------------------------------------------------------------
  //-------------------- Colision con caja------------------- Ganar
  if (nombre1.equals("gato") && nombre2.equals("caja")) {
    ganar = true;
  }
  if (nombre1.equals("caja") && nombre2.equals("gato")) {
    ganar = true;
  }
  //-------------------- Colision con Piso ------------------- Perder
  if (nombre1.equals("gato") && nombre2.equals("piso")) {
    perder = true;
  }
  if (nombre1.equals("piso") && nombre2.equals("gato")) {
    perder = true;
  }
  //-------------------- Colision con obstaculos-------------------Menos vida
  if (nombre1.equals("ob") && nombre2.equals("gato") || nombre1.equals("gato") && nombre2.equals("ob")) {
    vida--;
    perdervida = true;
    maullido.rewind();
    maullido.play();
  } else {
    perdervida = false;
  }
  if (vida <= 0) {
    perder = true;
    maullido.play();
  }
  //-----------------------------------------------------------
  if (nombre1.equals("plataforma") && nombre2.equals("gato") || nombre1.equals("gato") && nombre2.equals("plataforma")) {
    cambio=true;
  } else {
    cambio=false;
  }
  //-------------------- Colision con powerup-------------------
  if (nombre1.equals("gato") && nombre2.equals("powerup")) {
    pw = true;
    nro = int(random(1, 10));
  } else {
    pw = false;
  }
  if (nombre1.equals("powerup") && nombre2.equals("gato")) {
    pw = true;
    nro = int(random(1, 10));
  } else {
    pw = false;
  }
}
