class obstaculo { //<>//

  FBox p1;
  FBox p2;
  FBox p3;

  FBox o1;
  FBox o2;
  FBox o3;
  FBox o4;
  FBox o5;

  FBox o6;
  FBox o7;
  FBox o8;
  FBox o9;
  FBox o10;

  int tamx = 400;
  int tamy = 50;
  int tamo = 100;

  float limitx1 = 60;
  float limitx2 = width-60;

  float limity1 = height/4;
  float limity2 = height-200;

  PImage [] plataforma = new PImage [3];  
  PImage [] ob = new PImage [3];

  obstaculo() {
    iniciar();
    agg();

    for (int i = 1; i < plataforma.length; i++) {
      plataforma[i]= loadImage("p"+i+".png");
    }

    for (int i = 1; i < ob.length; i++) {
      ob[i]= loadImage("obstaculo"+i+".png");
    }
  }
  void iniciar() {
    //--------------------------------------------
    p1 = new FBox(tamx, tamy);
    p1.setName("plataforma");
    p1.setPosition(width/2, height/2);
    p1.setRotation(angulo);
    p1.setStatic(true);
    p1.attachImage( plataforma[1]);

    p2 = new FBox(tamx, tamy);
    p2.setName("plataforma");
    p2.setPosition(width/2, height/2);
    p2.setRotation(angulo1);
    p2.setStatic(true);
    p2.attachImage( plataforma[2]);

    p3 = new FBox(tamx, tamy);
    p3.setName("plataforma");
    p3.setPosition(width/2, height/2);
    p3.setRotation(angulo2);
    p3.setStatic(true);
    p3.attachImage( plataforma[1]);

    //--------------------------------------------
    //Estatico
    o1 = new FBox(tamo, tamo);
    o1.setName("ob");
    o1.setPosition(600, 0);
    o1.setStatic(true);
    o1.setGrabbable(false);
    o1.attachImage( ob[1]);

    o2 = new FBox(tamo, tamo);
    o2.setName("ob");
    o2.setPosition(width/2, height/2);
    o2.setStatic(true);
    o2.setGrabbable(false);
    o2.attachImage( ob[1]);

    o3 = new FBox(tamo, tamo);
    o3.setName("ob");
    o3.setPosition(width-30, height/3);
    o3.setStatic(true);
    o3.setGrabbable(false);
    o3.attachImage( ob[1]);

    o4 = new FBox(100, 100);
    o4.setName("ob");
    o4.setPosition(40, height-400);
    o4.setStatic(true);
    o4.setGrabbable(false);
    o4.attachImage( ob[1]);

    o5 = new FBox(100, 100);
    o5.setName("ob");
    o5.setPosition(width/4, height-200);
    o5.setStatic(true);
    o5.setGrabbable(false);
    o5.attachImage( ob[1]);
  }
  void reiniciar() {
    //--------------------------------------------

    p1.setPosition(width/2, height/2);
    p1.setRotation(angulo);
    p1.setStatic(true);
    p1.attachImage( plataforma[1]);

    p2.setPosition(width/2, height/2);
    p2.setRotation(angulo1);
    p2.setStatic(true);
    p2.attachImage( plataforma[2]);

    p3.setPosition(width/2, height/2);
    p3.setRotation(angulo2);
    p3.setStatic(true);
    p3.attachImage( plataforma[1]);

    //--------------------------------------------
    //Estatico
    o1.setName("ob");
    o1.setPosition(600, 0);
    o1.setStatic(true);
    o1.setGrabbable(false);
    o1.attachImage( ob[1]);


    o2.setName("ob");
    o2.setPosition(width/2, height/2);
    o2.setStatic(true);
    o2.setGrabbable(false);
    o2.attachImage( ob[1]);

    //Random
    o3.setName("ob");
    o3.setPosition(width-100, height-300);
    o3.setStatic(true);
    o3.setGrabbable(false);
    o3.attachImage( ob[1]);

    o4.setName("ob");
    o4.setPosition(60, height-200);
    o4.setStatic(true);
    o4.setGrabbable(false);
    o4.attachImage( ob[1]);

    o5.setName("ob");
    o5.setPosition(width/4, height-500);
    o5.setStatic(true);
    o5.setGrabbable(false);
    o5.attachImage( ob[1]);
  }
  void actualizar() {
    if (conTUIO) {
      if (ID0esta) {
        p1.setRotation(angulo);
        p1.setPosition(posX, posY);
      }
      if (ID1esta) {
        p2.setRotation(angulo1);
        p2.setPosition(posX1, posY1);
      }
      if (ID2esta) {
        p2.setRotation(angulo2);
        p3.setPosition(posX2, posY2);
      }
    }
  }

  void agg() {

    mundo.add(p1);
    mundo.add(p2);
    mundo.add(p3);

    mundo.add(o1);
    mundo.add(o2);
    mundo.add(o3);
    mundo.add(o4);
    mundo.add(o5);
  }
  void aggobjeto() {  

    FBox nuevo = new FBox(100, 100);
    nuevo.setName("ob");
    nuevo.setPosition(random(limitx1, limitx2), random(limity1, limity2));
    nuevo.setStatic(true);
    nuevo.setGrabbable(false);
    nuevo.attachImage( ob[2]);
    mundo.add(nuevo);
  }
  float ox () {
    float ox;
    ox = o1.getX();
    return ox;
  }
  float oy () {
    float oy;
    oy = o1.getY();
    return oy;
  }
}
