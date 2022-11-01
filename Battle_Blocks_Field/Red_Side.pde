//Start of Red_Side.pde --------------------------------------------------------------------------------

public class RedBall {
float redx;
float redy;
boolean on = false; 
float speed;

  void start(float spawn){
    redx = width - width;
    redy = height - random(0,700);
    on = true;
    redx = redx + spawn;
    speed = objectSpeed;
  }
  
  void move(){
      redx=redx+speed;
      if (redx >= 1000) {
        damageBlue(15);
        on = false;
      }    
  }
  
  //void interact(){
  //    currentObjectTotalRed--;    
  //}
 
  void display(color objectColor){
    noStroke();
    fill(objectColor);
    ellipse(redx,redy,30,30); 
  }   
}
    
    
    // VVVVVV rectangle (sheild) object programming VVVVVV
    
public class RedRect {    //finish moving wall for red
float redx;
float redy;
boolean on = false; 
int wallThickness;  
float speed;


  void start(float spawn){
    redx = width - width;
    redy = random(0, height - redRectLength);
    on = true;  
    redx = redx - spawn;      
    wallThickness = 16; 
    speed = objectSpeed;
  }
  
  void move(){    
    redx=redx+speed;       
    if (redx >= blueFenceY) {
      damageBlue(5);
      on = false;
    }
  }
  
  void damage(int damage){
    wallThickness = wallThickness - damage;    
    if(wallThickness <= 0){
      on = false;  
    }
  }
  
  //void interact(){
  //  currentObjectTotalBlue--;    
  //}
 
  void display(color objectColor){   
    noStroke();
    fill(objectColor);
    rect(redx,redy,wallThickness,redRectLength); 
  }                                               
} 

// spike attack VVVVV

public class RedSpike {
float redx;
float redy;
boolean on = false; 
float speed;
float pointyBoiX;
float pointyBoiY;
float lengthT;

  void start(float spawn){
    redx = width - width;
    redy = height - random(0,height-10);
    on = true;
    redx = redx + spawn;
    speed = objectSpeed;
    lengthT = 40;
    pointyBoiX = redx + lengthT;
    pointyBoiY = redy + 2;
  }
  
  void move(){
    redx=redx+speed;
    pointyBoiX = redx + lengthT;
    pointyBoiX=pointyBoiX+speed;
    if (pointyBoiX >= 1000) {
      damageBlue(3);
      on = false;
    }    
  }
  
  void damage(int damage){
    lengthT = lengthT - damage;    
    if(lengthT <= 0){
      on = false;  
    }
  }
  
  //void interact(){
  //    currentObjectTotalRed--;      
  //}
 
  void display(color objectColor){
    noStroke();
    fill(objectColor);
    triangle(redx,redy,redx,redy + 4,pointyBoiX,pointyBoiY);    //fix this!
  }   
}


//End of Red_Side.pde -------------------------------------------------------------------------------
