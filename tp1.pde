/*
 | TP1 | Tmm2 | FdA | UNLP |
 ------- TP1 Etapa 2: Prototipo -------
 Comision: Lisandro | Prof.Lisandro Peralta
 Alumnas: D´angelo Victoria (88529/7) y Besnati Victoria(88151/1)
 Video: https://youtu.be/RHjw6LA3Ous
*/

momento m;
void setup(){
  //frameRate(5);
  size(600,600);
  background(0);
  m = new momento();
}

void draw(){
  m.dibujar();
}
