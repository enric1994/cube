class Cube {
  Plain[] plains;

  int numberOfBlocks;
  float baseSize;
  PVector rotation, originalRotation, randomRotation;
  PVector position, randomPosition, originalPosition;

  Cube(int _numberOfBlocks, float _baseSize, PVector _rotation, PVector _position) {
    numberOfBlocks=_numberOfBlocks;
    baseSize=_baseSize;
    rotation=_rotation.get();
    position=_position.get();
    originalRotation=_rotation.get();
    originalPosition=_position.get();
    randomRotation=randomRotation.random3D();
    randomRotation.mult(2);
    randomPosition=randomPosition.random3D();
    randomPosition.mult(450);

    plains=new Plain[6];
    PVector movPosition=new PVector(0, 0, 0);
    PVector movRotation=new PVector(0, 0, 0);

    //1 up
    movRotation.set(0, 0, 0);
    movPosition.set(0, -numberOfBlocks*baseSize/2, 0);
    plains[0]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);

    //2 down

      movRotation.set(PI, 0, 0);
    movPosition.set(0, baseSize-numberOfBlocks*baseSize/2, baseSize);    
    plains[1]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);

    //3

    movRotation.set(0, 0, PI/2);
    movPosition.set(0, baseSize-numberOfBlocks*baseSize/2, 0);    
    plains[2]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);

    //4

    movRotation.set(-PI/2, 0, 0);
    movPosition.set(0, baseSize-numberOfBlocks*baseSize/2, 0);    
    plains[3]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);

    //5
    movRotation.set(-PI/2, 0, -PI);
    movPosition.set(baseSize, -numberOfBlocks*baseSize/2, 0);    
    plains[4]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);

    //6

    movRotation.set(0, 0, -PI/2);
    movPosition.set(baseSize, -numberOfBlocks*baseSize/2, 0);    
    plains[5]=new Plain(numberOfBlocks, baseSize, movRotation, movPosition);
  }

  void display() {
    pushMatrix();
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    translate(position.x, position.y, position.z);
    for (int j=0; j<this.plains.length; j++) {
      this.plains[j].display();
    }
    popMatrix();
  }
  void dismountCubeInPlains() {
    for (int i=0; i<this.plains.length; i++) {
      this.plains[i].moveRandom();
    }
  }

  void mountCubeInPlains() {
    for (int i=0; i<this.plains.length; i++) {
      this.plains[i].moveReset();
    }
  }
  void dismountCube() {
    for (int i=0; i<this.plains.length; i++) {
      this.plains[i].dismountPlain();
    }
  }
  void mountCube() {
    for (int i=0; i<this.plains.length; i++) {
      this.plains[i].mountPlain();
    }
  }

  void moveRandom() {
    position.x=position.x+(randomPosition.x-position.x)*0.04;
    position.y=position.y+(randomPosition.y-position.y)*0.04;
    position.z=position.z+(randomPosition.z-position.z)*0.04;

    rotation.x=rotation.x+(randomRotation.x-rotation.x)*0.04;
    rotation.y=rotation.y+(randomRotation.y-rotation.y)*0.04;
    rotation.z=rotation.z+(randomRotation.z-rotation.z)*0.04;
  }


  void moveReset() {
    position.x=position.x+(originalPosition.x-position.x)*0.04;
    position.y=position.y+(originalPosition.y-position.y)*0.04;
    position.z=position.z+(originalPosition.z-position.z)*0.04;

    rotation.x=rotation.x+(originalRotation.x-rotation.x)*0.04;
    rotation.y=rotation.y+(originalRotation.y-rotation.y)*0.04;
    rotation.z=rotation.z+(originalRotation.z-rotation.z)*0.04;
  }
}