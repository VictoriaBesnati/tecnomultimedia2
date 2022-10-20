boolean verbose = false;
boolean callback = true;

float posX;
float posY;
float posX1;
float posY1;
float posX2;
float posY2;

float angulo;
float angulo1;
float angulo2;

int ID0 = 0;
int ID1 = 1;
int ID2 = 2;

boolean ID0esta = false;
boolean ID1esta = false;
boolean ID2esta = false;

//-----------------------------------
void addTuioObject(TuioObject obj){
  
  //---------------------
  if( obj.getSymbolID() == ID0){
    posX = obj.getX() * width;
    posY = obj.getY() * height;
    angulo = obj.getAngle();
    ID0esta = true;
  }
  //---------------------
  if( obj.getSymbolID() == ID1){
    posX1 = obj.getX() * width;
    posY1 = obj.getY() * height;
    angulo1 = obj.getAngle();
    ID1esta = true;
  }
  //---------------------
   if( obj.getSymbolID() == ID2){
    posX2 = obj.getX() * width;
    posY2 = obj.getY() * height;
    angulo2 = obj.getAngle();
    ID2esta = true;
  }  
}
void updateTuioObject(TuioObject obj){
  
  //---------------------
   if( obj.getSymbolID() == ID0){
    posX = obj.getX() * width;
    posY = obj.getY() * height;
    angulo = obj.getAngle();
  }
  //---------------------
  if( obj.getSymbolID() == ID1){
    posX1 = obj.getX() * width;
    posY1 = obj.getY() * height;
    angulo1 = obj.getAngle();
  }
  //---------------------
   if( obj.getSymbolID() == ID2){
    posX2 = obj.getX() * width;
    posY2 = obj.getY() * height;
    angulo2 = obj.getAngle();
  }  
  
  
}
void removeTuioObject(TuioObject obj){
  if( obj.getSymbolID() == ID0){
    ID0esta = false;
  }
  //---------------------
  if( obj.getSymbolID() == ID1){
    ID1esta = false;
  }
  //---------------------
   if( obj.getSymbolID() == ID2){
    ID2esta = false;
  }  
  
}
//-----------------------------------
void addTuioCursor(TuioCursor curs){
  
}
void updateTuioCursor(TuioCursor curs){
  
}
void removeTuioCursor(TuioCursor curs){
  
}
//-----------------------------------
void addTuioBlob(TuioBlob blb){
  
}
void updateTuioBlob(TuioBlob blb){
  
}
void removeTuioBlob(TuioBlob blb){
  
}
//-----------------------------------
void refresh(TuioTime frameTime){
  if(verbose)println("frame #"+frameTime.getFrameID()+ " (" +frameTime.getTotalMilliseconds()+ " )");
  if (callback) redraw();
}
