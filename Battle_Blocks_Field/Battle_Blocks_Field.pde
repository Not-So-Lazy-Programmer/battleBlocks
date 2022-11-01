void setup (){
  size(1000,700);
  healthBarRed = height; //1000
  healthBarBlue = height; //1000
}

void draw (){  //  <<<<<  Run the code over and over and over and over and over again!
  
  //  VVVVV  Check if someone won....  VVVVV
  
  if (redLost == true && blueLost == true){
    background(0);
    textSize(40);
    fill(#ffffff);
    text("IT'S A TIE!", width/2, height/2);
  }else if(redLost == true){
    background(0);
    textSize(40);
    fill(#0000ff);
    text("BLUE WINS", width/2 - 100, height/2);
  }else if(blueLost == true){
    background(0);
    textSize(40);
    fill(#ff0000);
    text("RED WINS", width/2 - 100, height/2);
  }else{  //  otherwise, continue running the game XD
    
    fieldFix(); //  <<<<  field visuals and HUD
    
    // VVVVV  Making the objects display and move  VVVVV
    
    for (int i = 0 ; i < redball.size(); i++){
      RedBall privateRed = redball.get(i);
      privateRed.display(#ff0000);
      privateRed.move();    
    }  
    
    for (int i = 0 ; i < blueball.size(); i++){      
      BlueBall privateBlue = blueball.get(i); 
      privateBlue.display(#0000ff);
      privateBlue.move();
    } 
    
    for (int i = 0; i < bluerect.size(); i++){
      BlueRect privateBlue = bluerect.get(i);
      privateBlue.display(#8888ff);
      privateBlue.move();
    }
    
    for (int i = 0; i < redrect.size(); i++){
      RedRect privateRed = redrect.get(i);
      privateRed.display(#ff8888);
      privateRed.move();
    }
    
    for (int i = 0; i < redspike.size(); i++){
      RedSpike privateRed = redspike.get(i);
      privateRed.display(#ffaaaa);
      privateRed.move();
    }
    
    for (int i = 0; i < bluespike.size(); i++){
      BlueSpike privateBlue = bluespike.get(i);
      privateBlue.display(#aaaaff);
      privateBlue.move();
    }
    
    //  VVVVV  Checking if objects are touching  VVVVV
    
    for (int iR = redball.size() -1; iR >= 0; iR--){        
      for(int iB = blueball.size() -1; iB >= 0; iB--){
        //print("R" + redball.size());
        //print("B" + blueball.size());  //was used to check and debug array-crash problem, served me very well.
        //print(" (red" + iR + "check:");
        //print("blue" + iB + "check) ");
        RedBall red = redball.get(iR);  // we have array problems 4/24/2018 - fixed 11/1/2022
        BlueBall blue = blueball.get(iB);   // removing arrays needs to happen after you have checked all the array interactions, not during.
        if (dist(red.redx, red.redy, blue.bluex, blue.bluey) <= 30){  
           //print(" (red " + iR + " and blue " + iB + " have interacted)");           
           red.on = false;           
           blue.on = false;
           objectInteraction++;           
        }          
      }
    }    
    for (int iBS = bluerect.size() -1; iBS >= 0; iBS--){
      for (int iR = redball.size() -1; iR >= 0; iR--){
        BlueRect blueS = bluerect.get(iBS);
        RedBall red = redball.get(iR);
        found = false;
        for(int i = 0; i < blueRectLength && found == false;  i++){         
          if(dist(red.redx, red.redy, blueS.bluex, blueS.bluey + i) <= objectSpeed){                                   
            red.on = false;
            blueS.damage(1);
            found = true;
            objectInteraction++;
          }
        }        
      }
    }    
    for(int iRS = redrect.size() -1; iRS >= 0; iRS--){
      for(int iB = blueball.size() -1; iB >= 0; iB--){
        RedRect redS = redrect.get(iRS);
        BlueBall blue = blueball.get(iB);
        found = false;
        for(int i = 0; i < redRectLength && found == false;  i++){         
          if(dist(redS.redx + redS.wallThickness, redS.redy + i, blue.bluex, blue.bluey) <= objectSpeed){                                   
            blue.on = false;
            redS.damage(1);
            found = true;
            objectInteraction++;
          }
        }        
      }
    }   
    for(int iRS = redrect.size() -1; iRS >= 0; iRS--){
      for (int iBS = bluerect.size() -1; iBS >= 0; iBS--){
        RedRect redS = redrect.get(iRS);    
        BlueRect blueS = bluerect.get(iBS);
        found = false;
        //for(int ir = 0; ir < redRectLength && found == false;  ir++){ 
        if(abs(redS.redx - blueS.bluex) < objectSpeed){             
          blueS.on = false;    
          redS.on = false;
          objectInteraction++;
        }                    
      }
    }    
    for (int iBS = bluerect.size() -1; iBS >= 0; iBS--){
      for (int iRT = redspike.size() -1; iRT >= 0; iRT--){
        BlueRect blueS = bluerect.get(iBS);
        RedSpike redT = redspike.get(iRT);
        found = false;
        for(int i = 0; i < blueRectLength && found == false;  i++){         
          if(dist(redT.pointyBoiX,redT.pointyBoiY,blueS.bluex,blueS.bluey + i) <= objectSpeed){                        
            redT.damage(20);
            blueS.damage(20);
            found = true;
            objectInteraction++;
          }
        }        
      }
    }
    for (int iRS = redrect.size() -1; iRS >= 0; iRS--){
      for (int iBT = bluespike.size() -1; iBT >= 0; iBT--){
        RedRect redS = redrect.get(iRS);
        BlueSpike blueT = bluespike.get(iBT);
        found = false;
        for(int i = 0; i < blueRectLength && found == false;  i++){         
          if(dist(blueT.pointyBoiX,blueT.pointyBoiY,redS.redx,redS.redy + i) <= objectSpeed){                        
            blueT.damage(20);
            redS.damage(20);
            found = true;
            objectInteraction++;
          }
        }        
      }
    }    
    for (int iRT = redspike.size() -1; iRT >= 0; iRT--){   
      for(int iBT = bluespike.size() -1; iBT >= 0; iBT--){
        RedSpike red = redspike.get(iRT);  
        BlueSpike blue = bluespike.get(iBT);   
        if (dist(red.pointyBoiX,red.pointyBoiY,blue.pointyBoiX,blue.pointyBoiY) <= 3){              
           red.on = false;       
           blue.on = false;
           objectInteraction++;
        }          
      }
    }    
    for (int iRT = redspike.size() -1; iRT >= 0; iRT--){   
      for(int iB = blueball.size() -1; iB >= 0; iB--){
        RedSpike red = redspike.get(iRT); 
        BlueBall blue = blueball.get(iB); 
        if (dist(red.pointyBoiX,red.pointyBoiY,blue.bluex,blue.bluey) <= 18){               
           red.on = false;
           objectInteraction++;
        }          
      }
    }    
    for (int iBT = bluespike.size() -1; iBT >= 0; iBT--){   
      for(int iR = redball.size() -1; iR >= 0; iR--){
        BlueSpike blueT = bluespike.get(iBT);  
        RedBall red = redball.get(iR); 
        if (dist(blueT.pointyBoiX,blueT.pointyBoiY,red.redx,red.redy) <= 18){               
           blueT.on = false;
           objectInteraction++;
        }          
      }
    } 
    
    //  VVVVV  Checking if objects need to be deleted  VVVVV
    
    for (int i = 0 ; i < redball.size(); i++){
      RedBall privateRed = redball.get(i);  
      if(privateRed.on == false){
        redball.remove(i);
        currentObjectTotalRed--;
      }
    }    
    for (int i = 0 ; i < blueball.size(); i++){      
      BlueBall privateBlue = blueball.get(i); 
      if(privateBlue.on == false){
        blueball.remove(i);
        currentObjectTotalBlue--;
      }
    }     
    for (int i = 0; i < bluerect.size(); i++){
      BlueRect privateBlue = bluerect.get(i);
      if(privateBlue.on == false){
        bluerect.remove(i);
        currentObjectTotalBlue--;
      }
    }    
    for (int i = 0; i < redrect.size(); i++){
      RedRect privateRed = redrect.get(i);
      if(privateRed.on == false){
        redrect.remove(i);
        currentObjectTotalRed--;
      }
    }    
    for (int i = 0; i < redspike.size(); i++){
      RedSpike privateRed = redspike.get(i);
      if(privateRed.on == false){
        redspike.remove(i); 
        currentObjectTotalRed--;
      }
    }    
    for (int i = 0; i < bluespike.size(); i++){
      BlueSpike privateBlue = bluespike.get(i);
      if(privateBlue.on == false){
        bluespike.remove(i);
        currentObjectTotalBlue--;
      }
    }
    
    
  }
}
  
//  VVVVV  Other functions and extra systems stuff for the game.  VVVVV
  
void damageBlue(int damage){    
   healthBarBlue = healthBarBlue - damage;
   if(healthBarBlue <= 0){
    blueLost = true; 
   }
}

void damageRed(int damage){
   healthBarRed = healthBarRed - damage;
   if(healthBarRed <= 0){
     redLost = true;
   }
}

//  VVVVV  Buttons and purchase systems. VVVVV

void keyPressed(){ // <<<<< Key Pressed! Its a Processing command (I think).
  
  //VVVVV Red button commands. VVVVV
  
  if ((keyPressed == true)){      
    if(key == 'q'){       
      if(redBallCost <= redMoney){ 
        redMoney = redMoney -redBallCost;
        for(int i = 0; i <= 5; i++){
          redball.add(new RedBall());
          RedBall red = redball.get(redball.size()-1);  
          red.start(random(-200,-20));
          currentObjectTotalRed++;         
        }
      }else if(redBallCost > redMoney){  
        redMoneyError = true;
      }
    }
    if(key == 'z'){
      if(healthBarRed < height){
        if(redRepair < redMoney){
          redMoney = redMoney - redRepair;
          healthBarRed = healthBarRed + redRepair;
          redRepairMessage = true;
        }else if(redRepair > redMoney){
          redMoneyError = true;
        }
      }else if(healthBarRed >= height){
        redMaxHealthMessage = true;
      }
    }
    if(key == 'w'){    
      if(redWallCost <= redMoney){
        redMoney = redMoney - redWallCost;
        redrect.add(new RedRect());
        RedRect red = redrect.get(redrect.size()-1);
        red.start(random(10,200));
        currentObjectTotalRed++;     
      }else if(redWallCost > redMoney){
        redMoneyError = true;
      }
    }
    if(key == 'e'){       
      if(redSpikeCost <= redMoney){    // finish this
        redMoney = redMoney -redSpikeCost;
        for(int i = 0; i <= 1; i++){
          redspike.add(new RedSpike());
          RedSpike red = redspike.get(redspike.size()-1);  
          red.start(random(-200,-50));
          currentObjectTotalRed++;         
        }
      }else if(redSpikeCost > redMoney){  
        redMoneyError = true;
      }
    }
  }
   
  //VVVVV Blue button commands VVVVV
  
  if ((keyPressed == true)){    
    if(key == 'i'){
      if (blueBallCost <= blueMoney){ 
        blueMoney = blueMoney - blueBallCost;
        for(int i = 0; i <= 5; i++){
          blueball.add(new BlueBall());
          BlueBall blue = blueball.get(blueball.size()-1); 
          blue.start(random(20,200));
          currentObjectTotalBlue++;         
        }
      }else if(blueBallCost > blueMoney){   
        blueMoneyError = true;
      }
    }
    if(key == 'o'){    
      if(blueWallCost <= blueMoney){
        blueMoney = blueMoney - blueWallCost;
        bluerect.add(new BlueRect());
        BlueRect blue = bluerect.get(bluerect.size()-1);
        blue.start(random(10,200));
        currentObjectTotalBlue++;     
      }else if(blueWallCost > blueMoney){
        blueMoneyError = true;
      }
    }            
    if(key == ','){
      if(healthBarBlue < height){
        if(blueRepair <= blueMoney){
          blueMoney = blueMoney - blueRepair;
          healthBarBlue = healthBarBlue + blueRepair;
          blueRepairMessage = true;
          if (healthBarBlue > height){
            healthBarBlue = height;
          }
        }else if(blueRepair > blueMoney){
          blueMoneyError = true;
        }
      } else if(healthBarBlue >= height){
          blueMaxHealthMessage = true;
      }
    }
    if(key == 'p'){       
      if(blueSpikeCost <= blueMoney){    // finish this
        blueMoney = blueMoney - blueSpikeCost;
        for(int i = 0; i <= 1; i++){
          bluespike.add(new BlueSpike());
          BlueSpike blue = bluespike.get(bluespike.size()-1);  
          blue.start(random(50,200));
          currentObjectTotalBlue++;         
        }
      }else if(blueSpikeCost > blueMoney){  
        blueMoneyError = true;
      }
    }
  }    
}
