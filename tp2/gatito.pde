class gatito {

  FCircle gatu;

  int tam = 80;
  float Vel = 50;
  float s;
  float dx;
  float d;
  float d2;
  PImage [] gc = new PImage [3];
  PImage [] gv = new PImage [3];
  PImage [] gg = new PImage [3];

  gatito() {   


    for (int i = 0; i<gg.length; i++) {
      gg[i]= loadImage("gg"+i+".png");
    }
    for (int i = 0; i<gv.length; i++) {
      gv[i]= loadImage("gv"+i+".png");
    }
    for (int i = 0; i<gc.length; i++) {
      gc[i]= loadImage("gc"+i+".png");
    }


    iniciar();
    mundo.add(gatu);
  }
  void setgatito() {
    //gato1 - Elastico
    if (ID == 1) {
      gatu.setRestitution(1);
      gatu.setDensity(0.4);
      gatu.setFriction(1);
      gatu.attachImage(gc[0]);

      //limitar velocidad
      float velocidad = dist(0, 0, gatu.getVelocityX(), gatu.getVelocityY());      
      if (velocidad>Vel) {       
        float angulo = atan2(gatu.getVelocityY(), gatu.getVelocityX());
        float vx = Vel*cos(angulo);
        float vy = Vel*sin(angulo);
        gatu.setVelocity(vx, vy);
      }
    }
    //gato2 - Obeso
    if (ID == 2) {
      gatu.setFill(182, 150, 112);
      gatu.setRestitution(0.5);
      gatu.setDensity(1.5);
      gatu.setFriction(0.2);
      gatu.attachImage(gg[0]);
    }
    //gato3 - Volador
    if (ID == 3) {
      gatu.setFill(113, 110, 108);
      gatu.setRestitution(1);
      gatu.setDensity(0.1);
      gatu.setFriction(0);
      gatu.attachImage(gv[0]);
    }
  }
  void iniciar() {

    gatu = new FCircle(tam);
    gatu.setPosition(100, 0);
    gatu.setName("gato");
    gatu.setGrabbable(false);
    gatu.setVelocity(400, 0); 
    gatu.setNoStroke();
  }
  void reiniciar() {

    gatu.setPosition(100, 0);
    gatu.setName("gato");
    gatu.setGrabbable(false);
    gatu.setVelocity(400, 0); 
    gatu.setNoStroke();
  }
  void cambio() {
    if (ID == 1) {
      gatu.attachImage(gc[0]);
      if (cambio == true) {
        gatu.attachImage(gc[1]);
      }
      if (perdervida == true) {
        gatu.attachImage(gc[2]);
      }
    }
    if (ID == 2) {
      gatu.attachImage(gg[0]);
      if (cambio == true) {
        gatu.attachImage(gg[1]);
      }
      if (perdervida == true) {
        gatu.attachImage(gg[2]);
      }
    }
    if (ID == 3) {
      gatu.attachImage(gv[0]);
      if (cambio == true) {
        gatu.attachImage(gv[1]);
      }
      if (perdervida == true) {
        gatu.attachImage(gv[2]);
      }
    }
  }
  void atraer() {
    s = second();
    if ( s == 29 || s == 58 || s == 30 || s == 59) {
      muchoviento = true;
    }else{
      muchoviento = false;
    }
    if ( s == 30 || s == 59) {    
      float l = random(100, 600);
      dx = l - gatu.getX();
      gatu.addForce(dx*90, 0);
    }
  }
  void powerup(float cx, float cy, float ox, float oy) {
    if (nro == 0) {
      mundo.setGravity(0, height);
    }
    if (nro == 1) {
      float l = random(100, 600);
      d = l - gatu.getX();
      gatu.addForce(0, d*100);
    }
    if (nro == 2) {
      float l = random(100, 200);
      d = l - gatu.getX();
      gatu.addForce(d*100, d*100);
    }
    if (nro == 3) {
      float l = random(100, 200);
      d = l - gatu.getX();
      gatu.addForce(d*100, 0);
    }
    if (nro == 4) {
      float l = cx;
      float ly = cy;
      d = l - gatu.getX();
      d2 = ly - gatu.getY();
      gatu.addForce(d*100, d2*100);
    }
    if (nro == 5) {
      float l = ox;
      float ly = oy;
      d = l - gatu.getX();
      d2 = ly - gatu.getY();
      gatu.addForce(d*100, d2*100);
    }
    if (nro == 6) {
      gatu.setVelocity(10, 0);
    }
    if (nro == 7) {
      mundo.setGravity(0, -100);
    }
    if (nro == 8) {
      mundo.setGravity(0, 2000);
    }
    if (nro == 9) {
      mundo.setGravity(100, 0);
    }
    if (nro == 10) {
      mundo.setGravity(-100, 2000);
    }
    if (nro == 1 || nro == 2 || nro == 3 ||nro == 4 ||nro == 5) {
      if ( s == 10 || s == 20 || s == 30 ||s == 40 || s == 50 || s == 59) {    
        nro = 0;
      }
    }
  }
}
