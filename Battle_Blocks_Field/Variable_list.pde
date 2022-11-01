//Start of Variable_list.pde -----------------------------------------------------------------------

int redHud = 15;
int blueHud = 525;
int buttomHud = 680;
boolean redMoneyError = false;
int redErrorTimer = 0;
boolean blueMoneyError = false;
int blueErrorTimer = 0;
int errorTimerLimit = 120;
int healthBarRed;
int healthBarBlue;
boolean redLost = false;
boolean blueLost = false;
boolean redRepairMessage = false;
boolean blueRepairMessage = false;
boolean redMaxHealthMessage = false;
boolean blueMaxHealthMessage = false;
int redMaxHealthMessageTimer = 0;
int blueMaxHealthMessageTimer = 0;
int repairMessageTimerRed = 0;
int repairMessageTimerBlue = 0;
int redFenceY = 100;
int blueFenceY = 900;

int objectInteraction = 0;

float objectSpeed = 3.5;
int redRectLength = 400;
int blueRectLength = 400;

boolean found = false;

int currentObjectTotalBlue = 0;
int currentObjectTotalRed = 0;

float redMoney = 0; //default is 0
float redIncome = 0.2;
float blueMoney = 0; //default is 0
float blueIncome = 0.2;

ArrayList <RedBall> redball = new ArrayList<RedBall>();
ArrayList <BlueBall> blueball = new ArrayList<BlueBall>();
ArrayList <BlueRect> bluerect = new ArrayList<BlueRect>();
ArrayList <RedRect> redrect = new ArrayList<RedRect>();
ArrayList <RedSpike> redspike= new ArrayList<RedSpike>();
ArrayList <BlueSpike> bluespike= new ArrayList<BlueSpike>();

float blueBallCost = 25;
float blueWallCost = 45;
float redBallCost = 25;
float redWallCost = 45;
float redSpikeCost = 35;
float blueSpikeCost = 35;

int redRepair = 25;
int blueRepair = 25;

// End of Variable_list.pde ------------------------------------------------------
