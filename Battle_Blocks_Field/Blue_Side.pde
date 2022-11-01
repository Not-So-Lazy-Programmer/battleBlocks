  // start of Blue_Side.pde
     // VVVVVV circle (ball attack) object programming VVVVVV
public class BlueBall {  
float bluex;
float bluey;
boolean on = false; 
float speed;
  
  void start(float spawn){
    bluex = width;
    bluey = height - random(0,height);
    on = true;  
    bluex = bluex + spawn;
    speed = objectSpeed;
  }
  
  void move(){  
    bluex=bluex-speed;  
    if (bluex <= 0) { 
      damageRed(15);
      on = false;
    }    
  }
  
  //void interact(){
  //  currentObjectTotalBlue--;
  //  //damageRed();
  //}
 
  void display(color objectColor){
    noStroke();
    fill(objectColor);
    ellipse(bluex,bluey,30,30); 
  }   
}       
    
    // VVVVVV rectangle (sheild) object programming VVVVVV
    
public class BlueRect {    
float bluex;
float bluey;
boolean on = false; 
int wallThickness;  
float speed;

  void start(float spawn){
    bluex = width;
    bluey = random(0, height - blueRectLength);
    on = true;  
    bluex = bluex + spawn;      
    wallThickness = 15; 
    speed = objectSpeed;
  }
  
  void move(){    
    bluex=bluex-speed;       
    if (bluex <= redFenceY) {
      damageRed(5);
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
    rect(bluex,bluey,wallThickness,blueRectLength); 
  }                                               
}     


// spike attack VVVVV

public class BlueSpike {
float bluex;
float bluey;
boolean on = false; 
float speed;
float pointyBoiX;
float pointyBoiY;
float lengthT;

  void start(float spawn){
    bluex = width;
    bluey = height - random(10,height-10);
    on = true;
    bluex = bluex + spawn;
    speed = objectSpeed;
    lengthT = 40;
    pointyBoiX = bluex - lengthT;
    pointyBoiY = bluey + 2;
  }
  
  void move(){
    bluex=bluex-speed;
    pointyBoiX = bluex - lengthT;
    pointyBoiX=pointyBoiX-speed;
    if (pointyBoiX <= 0) {
      damageRed(3);
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
  //    currentObjectTotalBlue--;      
  //}
 
  void display(color objectColor){
    noStroke();
    fill(objectColor);
    triangle(bluex,bluey,bluex,bluey + 4,pointyBoiX,pointyBoiY);    //fix this!
  }   
}
// end of Blue_Side.pde
