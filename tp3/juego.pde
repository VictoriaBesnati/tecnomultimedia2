class juego {
  //------------
  String estado;
  PImage [] fondos = new PImage [6];  
  PImage [] accion = new PImage [2];  
  float tiempo = 0;
  float maxtiempo = 10;
  //------------
  gatito g;
  obstaculo o;
  caja c;
  Powerup p;

  juego() {
    //------------
    mundo = new FWorld();
    mundo.setEdges();
    mundo.setEdges(d);
    //------------
    //------------
    g = new gatito();
    o = new obstaculo();
    c = new caja();
    p = new Powerup();
    //------------
    estado = "inicio";
    //------------
    for (int i = 0; i<fondos.length; i++) {
      fondos[i]= loadImage("fondo"+i+".png");
    }
    for (int i = 0; i<accion.length; i++) {
      accion[i]= loadImage("accion"+i+".png");
    }
  }
  void dibujar() {
    println(tiempo);
    //------------
    if (estado.equals("inicio")) {

      image(fondos[0], 0, 0, width, height);
      g.reiniciar();
      c.reiniciar();
      o.reiniciar();
      ID = 0;

      perder = false;
      ganar = false;

      int tamx = 200, tamy = 100;

      if (ID0esta) {
        btn("Jugar", width/2, height-100, tamx, tamy);
        if (posX > width/2 - tamx/2 && posX < width/2 + tamx/2) {
          if (posY > height-100 - tamy/2 && posY < height-100 + tamy/2) {
            estado = "seleccionar";
            musica.play();
          }
        }
      }
    }
    if (estado.equals("seleccionar")) {
      background(b);
      Titulo("Ruleta de gatito", width/2, height/6);
      Titulo2(""+int(tiempo)+"", width/2, height/4);
      //seleccionar(350);
      ID = int(random(1, 3));
      if (ID == 1 ) {
        pushStyle();
        imageMode(CENTER);
        image(gatubi[1], width/2, height/2, 350, 350);
        tiempo += 1/frameRate;
        popStyle();
      }
      if (ID == 2 ) {
        pushStyle();
        imageMode(CENTER);
        image(gatubi[2], width/2, height/2, 350, 350);
        tiempo += 1/frameRate;
        popStyle();
      }
      if (ID == 3 ) {
        pushStyle();
        imageMode(CENTER);
        image(gatubi[3], width/2, height/2, 350, 350);
        tiempo += 1/frameRate;
        popStyle();
      }
      if (tiempo>maxtiempo) {
        estado = "jugar";
        tiempo = 0;
      }
      g.setgatito();
      //------------
    }
    //-----------------------------------------------------------------------------
    if (estado.equals("jugar")) {

      image(fondos[3], 0, 0, width, height);

      if (viento == true) {
        pushStyle();
        image(fondos[4], 0, 0, width, height);
        image(accion[1], 0, 0, width, height);
        popStyle();
      }
      if (muchoviento == true) {
        pushStyle();
        image(fondos[5], 0, 0, width, height);
        image(accion[0], 0, 0, width, height);
        popStyle();
      }

      o.actualizar();
      c.atraer();
      g.atraer();
      g.cambio();
      g.powerup(c.cx(), c.cy(), o.ox(), o.oy());
      p.borrar();

      mundo.step();
      mundo.draw();

      vida(vida);
      if ( ganar == true) {
        estado = "ganar";
        victoria.play();
        victoria.rewind();
      }
      if ( perder == true) {
        estado = "perder";
        derrota.play();
        derrota.rewind();
      }
    }
    //-----------------------------------------------------------------------------
    if (estado.equals("ganar")) {
      ID = 0;
      nro = 0;
      vida = 10;
      image(fondos[1], 0, 0, width, height);
      tiempo += 1/frameRate; 
      if (tiempo>maxtiempo) {
        estado = "jugar";
        ganar = false;
        g.reiniciar();
        c.reiniciar();
        o.reiniciar();
        p.reiniciar();
        o.aggobjeto();
        tiempo = 0;
      }
    }
    //-----------------------------------------------------------------------------
    if (estado.equals("perder")) {
      image(fondos[2], 0, 0, width, height);
      nro = 0;
      ID = 0;
      vida = 10;
      tiempo += 1/frameRate; 
      if (tiempo>maxtiempo) {
        g.reiniciar();
        c.reiniciar();
        o.reiniciar();
        p.reiniciar();
        estado = "inicio";
        perder = false;
        tiempo= 0;
      }
    }
    //-----------------------------------------------------------------------------
  }
}
