// Paleta ¿Clase de todas las configuraciones?
//ARRAY DE COLORES TRABAJAR CON HSB POR EL PROYECTOR
//hay q elegir paleta yo elegi esta a al azar
//elegir tipografia

PFont letra;
color a = #FFCBF2;//rosita
color b = #ECBCFD;//violeta rosa
color c2 = #DEAAFF;//violeta
color d = #D8BBFF;//violeta intermedio
color e = #C0FDFF;//celeste

void Titulo(String texto, int x, int y) {

  pushStyle();

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(19);
  textFont(letra);
  text(texto, x, y);
  fill(e);
  text(texto, x-6, y-6);
  popStyle();
}
void Titulo2() {
}
void texto() {
}
void btn(String texto, int x, int y, int tamx, int tamy) {
  pushStyle();

  rectMode(CENTER);

  fill(c2);
  noStroke();
  rect(x+3, y+3, tamx+6, tamy+6, 20);

  fill(a);
  noStroke();
  rect(x, y, tamx, tamy, 20);
  //----------------------------------
  fill(0);

  textAlign(CENTER, CENTER);
  textSize(10);
  textFont(letra);

  text(texto, x-tamx/160, y-tamy/9);
  popStyle();
}
String nombre(FBody body) {
  String nombre = "nada";
  if (body != null) {
    nombre = body.getName();
    if (nombre == null) {
      nombre = "nada";
    }
  }
  return nombre;
}
void vida(int v) {
  pushStyle();
  rectMode(CORNER);
  int tamx = 200;
  if (v == 10) {
    tamx = 200;
  }
  if (v == 9) {
    tamx = 180;
  }
  if (v == 8) {
    tamx = 160;
  }
  if (v== 7) {
    tamx = 140;
  }
  if (v == 6) {
    tamx = 120;
  }
  if (v == 5) {
    tamx = 100;
  }
  if (v == 4) {
    tamx = 80;
  }
  if (v == 3) {
    tamx = 50;
  }
  if (v == 2) {
    tamx = 30;
  }
  if (v == 1) {
    tamx = 10;
  }
  strokeWeight(2);
  stroke(0);
  fill(a);
  rect(width-tamx-100, 40, tamx, 20);
  
  if (v>=5) {
    image(corazon[1], width-147, 10, 80, 80);
  } else {
    image(corazon[2], width-147, 10, 80, 80);
  }

  popStyle();
}
void seleccionar(int tamg) {
  pushStyle();
  imageMode(CENTER);
  //GATO 1
  if (dist(mouseX, mouseY, width/6, height/2) < tamg/2) {
    if (mousePressed) {
      ID = 1;
      image(gatubi[1], width/6, height/2, tamg, tamg);
    }
    image(gatubi[1], width/6, height/2, tamg, tamg);
  } else {
    image(gatubi[0], width/6, height/2, tamg, tamg);
  }
  image(tm, width/6, height-180, 340, 200);
  //GATO 2
  if (dist(mouseX, mouseY, width/2, height/2) < tamg/2) {
    if (mousePressed) {
      ID = 2;
      image(gatubi[3], width/2, height/2, tamg, tamg);
    }
    image(gatubi[3], width/2, height/2, tamg, tamg);
  } else {
    image(gatubi[2], width/2, height/2, tamg, tamg);
  }
  image(tl, width/2, height-180, 340, 200);
  //GATO 3
  if (dist(mouseX, mouseY, width-200, height/2) < tamg/2) {
    if (mousePressed) {
      ID = 3;
      image(gatubi[5], width-200, height/2, tamg, tamg);
    }
    image(gatubi[5], width-200, height/2, tamg, tamg);
  } else {
    image(gatubi[4], width-200, height/2, tamg, tamg);
  }
  image(tn, width-200, height-180, 340, 200);
  popStyle();
}
