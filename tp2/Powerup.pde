class Powerup {
  FBox p;
  int tam = 60;
  PImage  pu ;

  Powerup() {
    
    pu = loadImage("powerup.png");

    iniciar();
    agg();
    
  }
  void iniciar() {
    p = new FBox(tam, tam);
    p.setPosition(width/2, height/3);
    p.setName("powerup");
    p.setStatic(true);
    p.setGrabbable(false); 
    p.attachImage(pu);
  }

  void reiniciar() {
    p.setPosition(random(width/4, width-200), random(height/4, height-200));
    p.setName("powerup");
    p.setGrabbable(false); 
    p.attachImage(pu);
    mundo.add(p);
  }
  void borrar() {
    if (pw == true) {
      mundo.removeBody(p);
    }
  }
  void agg() {
    mundo.add(p);
  }
}
