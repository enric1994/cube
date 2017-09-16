import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer sample;
FFT fftLog;


Cube c;

PVector pos, rot;

void setup() {
  frameRate(120);
  smooth(0);
  size(1920, 1080, OPENGL); 
  minim=new Minim(this);
  sample=minim.loadFile("sample.mp3", 1024);
  sample.play();
  fftLog=new FFT(sample.bufferSize(), sample.sampleRate());
  fftLog.logAverages(20, 250);

  pos=new PVector(0, 0, 0);
  rot=new PVector (0, 0, 0);
  c=new Cube(9, 50, rot, pos);
}
void draw() {
  colorMode(RGB);
  smooth(0);
  background(#B4D2F5);
  lights();
  directionalLight(304, 104, 304, 100, 100, -1);

  //xzPlain(50, 1000);
  rotateCamera(0.0001, 500, -550);
  //randomBlocks.display();


  //  if(millis()<15000)c.dismountCube();
  //  if(millis()>15000 && millis()<25000)c.dismountCubeInPlains();
  //  if(millis()>25000 && millis()<35000)c.mountCube();
  //  if(millis()>45000 && millis()<55000)c.mountCubeInPlains();
  c.display();
  if (key=='s')c.dismountCubeInPlains();
  if (key=='a')c.mountCubeInPlains();
  if (key=='w')c.moveRandom();
  if (key=='q')c.moveReset();
  if (key=='x')c.dismountCube();
  if (key=='z')c.mountCube();
}