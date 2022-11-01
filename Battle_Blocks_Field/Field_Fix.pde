 // Start of Field_Fix.pde ----------------------------------------------------------------

public void fieldFix(){  
  fill(0);
  stroke(1);
  background(255);
  redMoney = redMoney + redIncome;
  blueMoney = blueMoney + blueIncome;  
  text("Framerate: " + frameRate,460,350);
  line(redFenceY,0,redFenceY,height);
  line(blueFenceY,0,blueFenceY,height);
  text(objectInteraction, 500, 40);

  //   VVVVV  Red Hud Stuff  VVVVV
  
  noStroke();
  fill(#ff0000);
  text("Q = Squad of balls",redHud + 22,10);
  text("Cost: $" + redBallCost,redHud + 22,20);
  text("Z = Heal " + redRepair + " HP for $" + redRepair,redHud + 22,buttomHud);
  text("W = Moving Wall", redHud + 147, 10);
  text("Cost: $" + redWallCost, redHud + 147, 20);
  text("E = piercing spikes", redHud + 270, 10);  //
  text("Cost: $" + redSpikeCost, redHud + 270, 20);
  text("$" + redIncome + " every frame", redHud, 44);
  text("Calculated money every second: $" + frameRate * redIncome, redHud, 55);
  text("$" + redMoney, redHud, 33);
  rect(0,0,10,healthBarRed);
  text(currentObjectTotalRed,490,20);  // change this so it is displaying object.size]\
  
  
  
  if (redMoneyError == true){
    text("you do not have enough money",30,350);
    redErrorTimer++;
    if (redErrorTimer >= errorTimerLimit){
      redMoneyError = false;
      redErrorTimer = 0;
    }
  }
  if (redRepairMessage == true){
    text("Base Repaired",30,360);
    repairMessageTimerRed++;
    if(repairMessageTimerRed >= errorTimerLimit){
      redRepairMessage = false;
      repairMessageTimerRed = 0;
    }
  }
  if (redMaxHealthMessage == true){
    text("No repairs needed", 30,370);
    redMaxHealthMessageTimer++;
    if(redMaxHealthMessageTimer >= errorTimerLimit){
      redMaxHealthMessage = false;
      redMaxHealthMessageTimer = 0;
    } 
  }
  ellipse(redHud + 10,10,10,10);
  fill(#ff8888);
  rect(redHud + 135,3,2,15);
  fill(#ffaaaa);
  triangle(redHud + 250, 10, redHud + 266, 8, redHud + 266, 13);
  noFill();
  stroke(1);
  rect(redHud,0,20,20);  
  rect(redHud + 125,0,20,20); 
  rect(redHud + 248,0,20,20);

  //    VVVVV  Blue Hud Stuff  VVVVV

  noStroke();
  fill(#0000ff);
  text("I = Squad of balls",blueHud + 22, 10);
  text("Cost: $" + blueBallCost,blueHud + 22, 20);
  text(", = Heal " + blueRepair + " HP for $" + blueRepair,blueHud + 22,buttomHud);
  text("O = Moving Wall", blueHud + 145, 10);
  text("Cost: $" + blueWallCost, blueHud + 145, 20); //
  text("P = piercing spikes", blueHud + 270, 10);  //
  text("Cost: $" + blueSpikeCost, blueHud + 270, 20);
  text("$" + blueIncome + " every frame", blueHud, 44);
  text("Calculated money every second: $" + frameRate * blueIncome, blueHud, 55);
  text("$" + blueMoney, blueHud, 33);
  if (blueMoneyError == true){
    text("you do not have enough money",width - 150,350);
    blueErrorTimer++;
    if (blueErrorTimer == errorTimerLimit){
      blueMoneyError = false;
      blueErrorTimer = 0;
    }
  }
  if (blueRepairMessage == true){
    text("Base Repaired",width - 150,360);
    repairMessageTimerBlue++;
    if(repairMessageTimerBlue >= errorTimerLimit){
      blueRepairMessage = false;
      repairMessageTimerBlue = 0;
    }
  }
  if (blueMaxHealthMessage == true){                    //all of this need to change to blue
    text("No repairs needed",width - 150,370);
    blueMaxHealthMessageTimer++;
    if(blueMaxHealthMessageTimer >= errorTimerLimit){
      blueMaxHealthMessage = false;
      blueMaxHealthMessageTimer = 0;               // all of this needs to change to blue
    } 
  }
  rect(width,0,-10,healthBarBlue);
  text(currentObjectTotalBlue,510,20);
  ellipse(blueHud + 10,10,10,10);
  fill(#8888ff);
  rect(blueHud + 129,3,2,15);
  fill(#aaaaff);
  triangle(blueHud + 242, 10, blueHud + 258, 8, blueHud + 258, 13);
  noFill();
  stroke(1);
  rect(blueHud,0,20,20);
  rect(blueHud + 120,0,20,20);  
  rect(blueHud + 240,0,20,20);
  
}

//  End of Field_Fix.pde ------------------------------------------------------------------------------------
