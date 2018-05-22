  void rotateCamera(float velocity,float radius,float yHeight){  
  
 camera(radius*cos(velocity*millis()),yHeight+0.5*radius*cos(velocity*millis()),+radius*cos(velocity*millis())+radius*sin(velocity*millis()),0,0,0,0,1,0);

}
void xzPlain(int separation,int size) {
  colorMode(RGB, 100);
  stroke(0);
  for (int x=-size; x<size; x=x+separation) {
    for (int z=-size; z<size; z=z+separation) {
      line(x, 0, -size, x, 0, size);
      line(-size, 0, z, size, 0, z);
    }
  }
  line(0,-1000,0,0,1000,0);
}