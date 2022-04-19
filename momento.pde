class momento {
  fondo f;
  pinceladas p;
  float tiempo; // para los momentos? 

  momento() {
    tiempo = 0;
    f = new fondo();
    p = new pinceladas();
  }
  void dibujar() {
    
    f.DyV(mouseY, mouseX);
    f.dibujar();
    
  }
}
