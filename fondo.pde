class fondo {

  float tr1, tr2;// tr tamaño rectangulo
  float prey, y, miy; // direccion de y
  float vel, prex, x;
  String estado;
  int cm;//cantidad de marcos //r random
  int [] r = new int [11];
  color [] c = new color[13];

  fondo() {
    estado = "estado1";
    tr1= 0;
    tr2 = 0;

    cm = 2;

    this.y = 0;
    this.x = 0;

    //-----------------------Paleta-----------------------

    c[0] = #b04334; // ladrillo
    c[1] = #c22c23; // rojo c22c23
    c[2] = #ac9465; // marron
    c[3] = 0;       // negro
    c[4] = #889896; // gris_intermedio
    c[5] = #c7e8ed; // celeste
    c[6] = #b2c4b9; // gris_claro_celeste
    c[7] = #9e9e9e; // gris_claro
    c[8] = 255;     // blanco
    c[9] = #daeff8; // blanco_celeste
    c[10] = #79838c; // gris_oscuro
    c[11] = #509997; // verde_agua
    c[12] = #398b84; // verde_agua_2

    //-----------------------Fondo-----------------------

    r[0] = int(random(0, 2));
    r[1] = int(random(10, 12));
    r[2] = int(random(3, 5));
    r[3] = int(random(6, 7));
    r[4] = int(random(8, 10));

    //-----------------------Marcos-----------------------

    r[5] = int(random(0, 8));
    r[6] = int(random(0, 8));
    r[7] = int(random(0, 8));
    r[8] = int(random(20, 40));
    r[9] = int(random(20, 40));
    r[10] = int(random(20, 40));
  }
  void DyV(float y2, float x2) {//-----------------------Direccion Y y velocidad-----------------------
    //----------------------- Y -----------------------
    prey = y;
    y = y2; 
    miy = y - prey;
    //----------------------- Velocidad -----------------------
    prex = x;
    x = x2;
    vel = dist(x, y, prex, prey);
  }
  void dibujar() {//-----------------------Dibujar-----------------------
    //quad(x1, y1, x2, y2, x3, y3, x4, y4)

    noStroke();
    //-----------------------Fondo-----------------------
    println(vel);

    if (miy < 0) {
      estado = "estado2";
    } else if (miy > 0) {
      estado = "estado3";
    } else if (miy == 0) {
      estado = "estado1";
    }

    if (estado.equals("estado1")) {

      fill(c[r[0]]);
      quad(0, 0, width/2, 0, width/2, height/3, 0, height/3 ); // 1 arriba izquierda

      fill(c[r[1]]);
      quad(width/2, 0, width, 0, width, height/3, width/2, height/3);//2 arriba derecha

      fill(c[r[2]]);
      quad(width/2, height/3, width, height/3, width, height/1.5, width/2, height/1.5);// 3 abajo derecha

      fill(c[r[3]]);
      quad(0, height/3, width/2, height/3, width/2, height/1.5, 0, height/1.5);// abajo izquierda

      fill(c[r[4]]);
      quad(0, height/1.5, width, height/1.5, width, height, 0, height);// abajo grande
    } else if (estado.equals("estado2")) {

      tr1++;

      fill(c[r[0]]);
      quad(0, 0, width/2, 0, width/2, height/3+tr1, 0, height/3+tr1 ); // 1 arriba izquierda

      fill(c[r[1]]);
      quad(width/2, 0, width, 0, width, height/3+tr1, width/2, height/3+tr1);//2 arriba derecha

      fill(c[r[2]]);
      quad(width/2, height/2, width, height/2, width, height/1.5+tr1, width/2, height/1.5+tr1);// 3 abajo derecha

      fill(c[r[3]]);
      quad(0, height/2, width/2, height/2, width/2, height/1.5+tr1, 0, height/1.5+tr1);// abajo izquierda

      fill(c[r[4]]);
      quad(0, height/1.5+tr1, width, height/1.5+tr1, width, height, 0, height);// abajo grande
      /*
      if (tr1 > width) {
       tr1 = 0;
       }
       */
    } else if (estado.equals("estado3")) {

      tr1--;

      fill(c[r[0]]);
      quad(0, 0+tr1, width/2, 0+tr1, width/2, height/3+tr1, 0, height/3+tr1 ); // 1 arriba izquierda

      fill(c[r[1]]);
      quad(width/2, 0+tr1, width, 0+tr1, width, height/3+tr1, width/2, height/3+tr1);//2 arriba derecha

      fill(c[r[2]]);
      quad(width/2, height/3+tr1, width, height/3+tr1, width, height/1.5, width/2, height/1.5);// 3 abajo derecha

      fill(c[r[3]]);
      quad(0, height/3+tr1, width/2, height/3+tr1, width/2, height/1.5, 0, height/1.5);// abajo izquierda

      fill(c[r[4]]);
      quad(0, height/1.5+tr1, width, height/1.5+tr1, width, height, 0, height);// abajo grande
    }
    //-----------------------Marcos-----------------------
    pushStyle();
    rectMode(CENTER);
    noFill();

    if (vel == 0) {
      cm = 1;
    } else if (vel > 20) {
      cm = 2;
    } else if (vel > 50) {
      cm = 3;
    }

    if (cm == 1) {
      strokeWeight(r[8]);
      stroke(c[r[5]]);
      rect(width/2, height/2, width-r[8], height-r[8]);
    } else if (cm == 2) {
      strokeWeight(r[8]);
      stroke(c[r[5]]);
      rect(width/2, height/2, width-r[8], height-r[8]);
      strokeWeight(r[9]);
      stroke(c[r[6]]);
      rect(width/2, height/2, width-r[9]-r[8], height-r[9]-r[8]);
    } else if (cm == 3) {
      strokeWeight(r[8]);
      stroke(c[r[5]]);
      rect(width/2, height/2, width-r[8], height-r[8]);
      strokeWeight(r[9]);
      stroke(c[r[6]]);
      rect(width/2, height/2, width-r[9]-r[8], height-r[9]-r[8]);
      strokeWeight(r[10]);
      stroke(c[r[7]]);
      rect(width/2, height/2, width-r[10]-r[9]-r[8], height-r[10]-r[9]-r[8]);
    }
    popStyle();
  }
}
