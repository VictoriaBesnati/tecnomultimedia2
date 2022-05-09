float an, dir, vel, x, y;

void setup() {
  size (600, 600);
  background(0);
  noiseDetail(10000, 0.05);
  dir = radians(noise(2, 360));
  vel=1;
  x = random(50, width-50);
  y = random(50, height-50);
}
void draw() {
  an = radians(noise(-100, 100));
  dir = dir + an;
  float dx = -vel*cos(dir);
  float dy = -vel*sin(dir);
  x = x+dx;
  y = y+dy;
  fill(255);
  circle(x, y, 50);

  if ( x<0 || x>width ) {
    x = x * -1;
  }
  if ( y<0 || y>height ) {
    y = y * -1;
  }
}
