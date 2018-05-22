class Block {
  int bandNumber;
  float baseSize;
  float level;
  color selectColor;
  PVector rotation, originalRotation, randomRotation;
  PVector position, randomPosition, originalPosition;

  color colorTwo;


  Block(int _bandNumber, float _baseSize, float _level, color _selectColor
    , PVector _rotation, 
  PVector _position) { 
    bandNumber=_bandNumber;
    baseSize=_baseSize;
    level=_level;  
    selectColor=_selectColor;
    rotation=_rotation.get();
    position=_position.get();
    originalRotation=rotation.get();
    originalPosition=position.get();
    randomRotation=randomRotation.random3D();
    randomRotation.mult(2);
    randomPosition=randomPosition.random3D();
    randomPosition.mult(950);
    
    
    
  }
  void display() {
    fftLog.forward(sample.mix);
    pushMatrix();
    stroke(0);
    if(key=='v')stroke(0);
    noStroke();
    
    fill(selectColor);

    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);

    translate(position.x, position.y, position.z); 

colorTwo=selectColor;

    float h=level*sensibility(fftLog.getAvg(bandNumber));

    beginShape(QUADS);

    fill(selectColor);
    vertex(baseSize/2, baseSize/2, baseSize/2);
    fill(colorTwo);
    vertex(baseSize/2, baseSize/2, -baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, baseSize/2, -baseSize/2);
    fill(colorTwo);
    vertex(-baseSize/2, baseSize/2, baseSize/2);

    fill(selectColor);
    vertex(baseSize/2, -baseSize/2 - h, baseSize/2);
    fill(colorTwo);
    vertex(baseSize/2, -baseSize/2 - h, -baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, -baseSize/2 - h, -baseSize/2);
    fill(colorTwo);
    vertex(-baseSize/2, -baseSize/2 - h, baseSize/2);

    fill(selectColor);
    vertex(baseSize/2, baseSize/2, -baseSize/2);
    fill(selectColor);
    vertex(baseSize/2, -baseSize/2 - h, -baseSize/2);
    fill(colorTwo);
    vertex(baseSize/2, -baseSize/2 - h, baseSize/2);
    fill(selectColor);
    vertex(baseSize/2, baseSize/2, baseSize/2);

    fill(colorTwo);
    vertex(-baseSize/2, baseSize/2, -baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, -baseSize/2 - h, -baseSize/2);
    fill(colorTwo);
    vertex(-baseSize/2, -baseSize/2 - h, baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, baseSize/2, baseSize/2);

    fill(colorTwo);
    vertex(baseSize/2, baseSize/2, baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, baseSize/2, baseSize/2);
    fill(colorTwo);
    vertex(-baseSize/2, -baseSize/2 - h, baseSize/2);
    fill(selectColor);
    vertex(baseSize/2, -baseSize/2 - h, baseSize/2);

    fill(colorTwo);
    vertex(baseSize/2, baseSize/2, -baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, baseSize/2, -baseSize/2);
    fill(selectColor);
    vertex(-baseSize/2, - baseSize/2 - h, -baseSize/2);
    fill(colorTwo);
    vertex(baseSize/2, -baseSize/2 - h, -baseSize/2);

    endShape();
    popMatrix();
  }
  void moveRandom() {


    position.x=position.x+(randomPosition.x-position.x)*0.1;
    position.y=position.y+(randomPosition.y-position.y)*0.1;
    position.z=position.z+(randomPosition.z-position.z)*0.1;

    rotation.x=rotation.x+(randomRotation.x-rotation.x)*0.06;
    rotation.y=rotation.y+(randomRotation.y-rotation.y)*0.06;
    rotation.z=rotation.z+(randomRotation.z-rotation.z)*0.06;
  }
  void moveReset() {  

    position.x=position.x+(originalPosition.x-position.x)*0.14;
    position.y=position.y+(originalPosition.y-position.y)*0.14;
    position.z=position.z+(originalPosition.z-position.z)*0.14;

    rotation.x=rotation.x+(originalRotation.x-rotation.x)*0.06;
    rotation.y=rotation.y+(originalRotation.y-rotation.y)*0.06;
    rotation.z=rotation.z+(originalRotation.z-rotation.z)*0.06;
  }
}
float sensibility(float fft) {
  float r=0;
  r=lerp(r, fft, 0.3);
  return r;
}
color generateColor(float i,float j){
colorMode(HSB);
return color(j*20,40+i*15,255);

}