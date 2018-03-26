uiButton[] teir1;
uiButtonTeir2a[] teir2a;
uiButtonTeir2b[] teir2b;
int teir1ActiveButton;
int teir2aActiveButton;
int teir2bActiveButton;
String[] uiArrayTeir1 = {"Work", "Personal"};
String[] uiArrayTeir2a = {"LTN", "CP", "FG", "KEN"};
String[] uiArrayTeir2b = {"Food", "Clothing", "Gym", "Chores"};

String date1 ="2/3/2018";
String date2 ="28/2/2018";
Table workouts;
int daysTotal;
workoutBlock[] icons;

PImage tick;
PImage cross;
PImage tray;
Table shirtsTable;
Table trousersTable;
apparel[] shirts;
apparel[] trousers;
int totalApparel;


void setup(){ //////////////////////////////////////////////////////////////////////SETUP
size(1600,900);
noStroke();
//////////////////////////////////////////////////////UI///////////////////////////////////////////////
teir1 = new uiButton[uiArrayTeir1.length];
teir2a = new uiButtonTeir2a[uiArrayTeir2a.length];
teir2b = new uiButtonTeir2b[uiArrayTeir2b.length];
for (int i = 0; i<teir1.length; i++){
  teir1[i] = new uiButton(0,30*i,i, uiArrayTeir1[i]);
}
for (int i = 0; i<teir2a.length; i++){
  teir2a[i] = new uiButtonTeir2a(90*i+90,0,i, uiArrayTeir2a[i]);
}
for (int i = 0; i<teir2b.length; i++){
  teir2b[i] = new uiButtonTeir2b(90*i+90,0,i,uiArrayTeir2b[i]);
}
///////////////////////////////////////////////////////workouts///////////////////////////////////////////
workouts = loadTable("Workouts.csv", "header");
icons = new workoutBlock[workouts.getRowCount()];
for ( int i = 0; i<workouts.getRowCount(); i++){
icons[i] = new workoutBlock(workouts.getString(i,0),10, 40*i+100, workouts.getString(i,1), i);
daysTotal = daysTotal + icons[i].reportDays();
}
///////////////////////////////////////////CLOTHINGS ////////////////////////////////////////////////////////////
tick = loadImage("Clothing/tick.png");
cross = loadImage("Clothing/cross.png");
tray = loadImage("Clothing/tray.png");

shirtsTable = loadTable("Clothing/shirts/shirts.csv","header");
trousersTable = loadTable("Clothing/trousers/trousers.csv","header");

shirts = new apparel[shirtsTable.getRowCount()];
trousers = new apparel[trousersTable.getRowCount()];

for(int i =0; i <shirtsTable.getRowCount(); i++){ //<>//
shirts[i] = new apparel(100,100,i, "shirts");
}
for(int i =0; i <trousersTable.getRowCount(); i++){
trousers[i] = new apparel(100,100,i, "trousers");
}
}
void draw(){
  background(255);
  
//UI SETTING///////////////////////////////////////////////////////////////////
for (int i = 0; i<teir1.length; i++){
 teir1[i].update();
 teir1[i].display();
}

if (teir1ActiveButton == 0){
for (int i = 0; i<teir2a.length; i++){
 teir2a[i].update();
 teir2a[i].display();
 teir2bActiveButton = 10;
}
}
if (teir1ActiveButton == 1){
for (int i = 0; i<teir2b.length; i++){
 teir2b[i].update();
 teir2b[i].display();
 teir2aActiveButton = 10;
}
}
//PROGRAM SELECTOR////////////////////////////////////////////////////////////////////
if(teir1ActiveButton == 1 && teir2bActiveButton == 2){
for(int i = 0; i<icons.length; i++){ 
  icons[i].display();
  text(daysTotal, 100 ,40*workouts.getRowCount() + 130);
}
}

if(teir1ActiveButton == 1 && teir2bActiveButton == 1){
for(int i =0; i <shirtsTable.getRowCount(); i++){
shirts[i].update();
shirts[i].display();
}
for(int i =0; i <trousersTable.getRowCount(); i++){
trousers[i].update();
trousers[i].display();
}
}
}



void mouseClicked(){ 
for (int i = 0; i<teir1.length; i++){
 teir1[i].clicked();
}
for (int i = 0; i<teir2a.length; i++){
 teir2a[i].clicked();
}
for (int i = 0; i<teir2b.length; i++){
 teir2b[i].clicked();
}
for (int i =0; i<icons.length; i++){
  icons[i].clicked();
}
for (int i =0; i<shirts.length; i++){
  shirts[i].clicked();
}
for (int i =0; i<trousers.length; i++){
  trousers[i].clicked();
}

}



class button{
color fillColor;
color fontColor;
boolean overMe;
boolean toggle;
int position;
int xpos, ypos, ysize, xsize;
String label;

  button(int xp, int yp, int xs, int ys, int _position, String _label){
  xpos = xp;
  ypos = yp;
  xsize = xs;
  ysize = ys;
  position = _position;
  label = _label;
  }



void display(){
  if(toggle){
    if(overMe){
     fillColor = color( 255,225,106);
    }else{
      fillColor = color(255,195,92);
    }
    
  }else{
    if(overMe){
      fillColor = color(195,106,255);
    }else{
      fillColor = color(135,92,255);
    }
  }
  fill(fillColor);
  rect(xpos,ypos,xsize,ysize);
  fill(0);
  text(label, 10 +xpos, ypos +20);
}

void update(){
if(overRect(xpos, ypos, xsize, ysize)){
overMe = true;
}else{
overMe = false;
}

if(teir1ActiveButton == position){
toggle = true;
}
else{
toggle = false;
}
}

void clicked(){
if(overRect(xpos, ypos, xsize, ysize)){
  if(teir1ActiveButton == position){
    teir1ActiveButton = 10;
  }
  else{
  teir1ActiveButton = position;
  }
}
}

}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
