//class Column {
//  Block[] blocks;
//  int numberOfBlocks;
//  float baseSize;
//  PVector rotation, originalRotation, randomRotation;
//  PVector position, randomPosition, originalPosition;

//  Column(int _numberOfBlocks, float _baseSize, PVector _rotation, PVector _position) {
//    numberOfBlocks=_numberOfBlocks;
//    baseSize=_baseSize;
//    rotation=_rotation.get();
//    position=_position.get();
//    originalRotation=_rotation.get();
//    originalPosition=_position.get();
//    randomRotation=randomRotation.random3D();
//    randomRotation.mult(2);
//    randomPosition=randomPosition.random3D();
//    randomPosition.mult(250);

//    blocks=new Block[numberOfBlocks];
//    PVector movPosition=new PVector(0, 0, 0);
//    PVector movRotation=new PVector(0, 0, 0);


//    for (int i=0; i<numberOfBlocks; i++) {
//      movPosition.z=i*baseSize ;

//      switch((int)random(0, 4)) {
//      case 0:
//        movRotation.set(PI/2, 0, PI);  
//        break;
//      case 1:
//        movRotation.set(PI/2, 0, PI/2);
//        break;
//      case 2:
//        movRotation.set(PI/2, 0, 3*PI/2);
//        break;
//      case 3:
//        movRotation.set(PI/2, 0, 0);
//        break;
//      }

//      blocks[i]=new Block((int)random(0,100), baseSize, random(0, 7), generateColor(0.01*i), 
//      movRotation, movPosition);
//    }
//  }
//  void display() {
//    pushMatrix();
//    rotateX(rotation.x);
//    rotateY(rotation.y);
//    rotateZ(rotation.z);
//    translate(position.x, position.y, position.z);
//    rotateY(-millis()*0.0005);
//    for (int i=0; i<blocks.length; i++) {

//      blocks[i].display();
//    }
//    popMatrix();
//  }
//  void dismountColumn() {
//    for (int i=0; i<this.blocks.length; i++) {
//      this.blocks[i].moveRandom();
//    }
//  }

//  void mountColumn() {
//    for (int i=0; i<this.blocks.length; i++) {
//      this.blocks[i].moveReset();
//    }
//  }
//  void moveRandom() {
//    position.x=position.x+(randomPosition.x-position.x)*0.04;
//    position.y=position.y+(randomPosition.y-position.y)*0.04;
//    position.z=position.z+(randomPosition.z-position.z)*0.04;

//    rotation.x=rotation.x+(randomRotation.x-rotation.x)*0.04;
//    rotation.y=rotation.y+(randomRotation.y-rotation.y)*0.04;
//    rotation.z=rotation.z+(randomRotation.z-rotation.z)*0.04;
//  }


//  void moveReset() {
//    position.x=position.x+(originalPosition.x-position.x)*0.04;
//    position.y=position.y+(originalPosition.y-position.y)*0.04;
//    position.z=position.z+(originalPosition.z-position.z)*0.04;

//    rotation.x=rotation.x+(originalRotation.x-rotation.x)*0.04;
//    rotation.y=rotation.y+(originalRotation.y-rotation.y)*0.04;
//    rotation.z=rotation.z+(originalRotation.z-rotation.z)*0.04;

//  }
//}