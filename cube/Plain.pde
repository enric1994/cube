class Plain {
  Block[] blocks;
  int numberOfBlocks;
  float baseSize;
  PVector rotation, originalRotation, randomRotation;
  PVector position, randomPosition, originalPosition;

  Plain(int _numberOfBlocks, float _baseSize, 
  PVector _rotation, PVector _position) {

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


    blocks=new Block[numberOfBlocks*numberOfBlocks];
    PVector movRotation=new PVector(0, 0, 0);
    PVector movPosition=new PVector(0, 0, 0);

    for (int i=0; i<numberOfBlocks; i++) {
      for (int j=0; j<numberOfBlocks; j++) {
        movPosition.x=(-baseSize*numberOfBlocks/2+j*baseSize);
        movPosition.z=(-baseSize*numberOfBlocks/2+i*baseSize);

        blocks[i*numberOfBlocks+j]=new Block((int)random(500,1000)
          , baseSize, random(0, 3), 
        generateColor(i,j), movRotation, movPosition);
      }
    }
  }

  void display() {
    pushMatrix();
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    translate(position.x, position.y, position.z);
    for (int i=0; i<blocks.length; i++) {
      blocks[i].display();
    }
    popMatrix();
  }
  void dismountPlain() {
    for (int i=0; i<this.blocks.length; i++) {
      this.blocks[i].moveRandom();
    }
  }

  void mountPlain() {
    for (int i=0; i<this.blocks.length; i++) {
      this.blocks[i].moveReset();
    }
  }

  //NOT WORKING
  void moveRandom() {
    position.x=position.x+(randomPosition.x-position.x)*0.1;
    position.y=position.y+(randomPosition.y-position.y)*0.1;
    position.z=position.z+(randomPosition.z-position.z)*0.1;

    rotation.x=rotation.x+(randomRotation.x-rotation.x)*0.1;
    rotation.y=rotation.y+(randomRotation.y-rotation.y)*0.1;
    rotation.z=rotation.z+(randomRotation.z-rotation.z)*0.1;
  }
  void moveReset() {
    position.x=position.x+(originalPosition.x-position.x)*0.1;
    position.y=position.y+(originalPosition.y-position.y)*0.1;
    position.z=position.z+(originalPosition.z-position.z)*0.1;

    rotation.x=rotation.x+(originalRotation.x-rotation.x)*0.1;
    rotation.y=rotation.y+(originalRotation.y-rotation.y)*0.1;
    rotation.z=rotation.z+(originalRotation.z-rotation.z)*0.1;
  }
}