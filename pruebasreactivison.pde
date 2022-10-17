import TUIO.*;
TuioProcessing tuioClient;
float posX;
float posY;
float posX1;
float posY1;
float posX2;
float posY2;
float angulo;
float angulo1;
float angulo2;
void setup() {

  size(600, 600);
  background(0);
  tuioClient = new TuioProcessing(this);
  fill(255);
  rectMode(CENTER);
}
void draw() {

  ArrayList<TuioObject> listadoobjetost = tuioClient.getTuioObjectList();
  for (int i = 0; i < listadoobjetost.size(); i++) {
    TuioObject patronAux = listadoobjetost.get(i);
    int ID = patronAux.getSymbolID();
    if (ID == 0) {
      angulo = patronAux.getAngle();
      posX=patronAux.getScreenX(width);
      posY=patronAux.getScreenY(height);
    } 
    if (ID == 1) {
      angulo1 = patronAux.getAngle();
      posX1=patronAux.getScreenX(width);
      posY1=patronAux.getScreenY(height);
    } 
    if (ID == 2) {
      angulo2 = patronAux.getAngle();
      posX2=patronAux.getScreenX(width);
      posY2=patronAux.getScreenY(height);
    } 

    pushMatrix();
    rotate(angulo);
    fill(255, 0, 0);
    rect(posX, posY, 200, 50);
    popMatrix();

    pushMatrix();
    rotate(angulo1);
    fill(0, 255, 0);
    rect(posX1, posY1, 200, 50);
    popMatrix();

    pushMatrix();
    rotate(angulo2);
    fill(0, 0, 255);
    rect(posX2, posY2, 200, 50);
    popMatrix();
  }
}
