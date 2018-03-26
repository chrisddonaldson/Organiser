class apparel{
washingYesNo b1;
ironingYesNo b2;
int xpos,ypos, position;
String label;
PImage img;

apparel(int _xpos, int _ypos, int _position, String _label){ 
  xpos = _xpos;
  ypos = _ypos;
  position = _position;
  label = _label;
  img = loadImage("Clothing/"+label+"/"+position+".jpg");
  b1 = new washingYesNo(xpos+50, ypos+250, position, label);
  b2 = new ironingYesNo(xpos+150, ypos+250, position, label);
}

void display(){
image(img, xpos, ypos, 200, 300);
image(tray, xpos, ypos+250);
b1.display();
b2.display();
}

void update(){
//how many need to be displayed
totalApparel = shirts.length + trousers.length;
int x=0;
int y=200;
int xs = 200;
int ys = 300;
int b = 0;
int rowWidth = 8;
int yf,xf;
if(label == "shirts"){
 xf = position%rowWidth;
 yf = position/rowWidth;
 xpos = x+(xs+b)*xf;
 ypos = y+(ys+b)*yf;
}
if (label == "trousers"){
 xf = (position+shirts.length)%rowWidth;
 yf = (position+shirts.length)/rowWidth;
 xpos = x+(xs+b)*xf;
 ypos = y+(ys+b)*yf;
}
b1.update(xpos, ypos);
b2.update(xpos, ypos);
}

void clicked(){
b1.clicked();
b2.clicked();
}
}



class washingYesNo extends button{ /////////////////////////////WASHING BUTTON
 PImage activeImage;
 String label;
 washingYesNo(int xp, int yp, int _position, String _label){
 super( xp,  yp,  50,  50, _position, _label);
 label = _label;
 } 
 void display(){
  if(toggle){
    activeImage =tick;
    if(overMe){
     fillColor = color(255,25);
    }else{
      fillColor = color(255,0);
    }
    
  }else{
    activeImage = cross;
    if(overMe){
      fillColor = color(255,25);
    }else{
      fillColor = color(255,0);
    }
 
  }
  image(activeImage,xpos+50,ypos+250);
  fill(fillColor);
  rect(xpos+50, ypos+250, 50,50);
}

void clicked(){
if(overRect(xpos+50, ypos+250, 50, 50)){
  toggle = !toggle;
  if(label == "shirts"){
    if(toggle){
      shirtsTable.setInt(position, 2, 1);
  }
    else{
    shirtsTable.setInt(position, 2, 0);
    }
  saveTable(shirtsTable, "data/Clothing/shirts/shirts.csv");
   println("shirts saved");
  }
  if(label == "trousers"){
    if(toggle){
      trousersTable.setInt(position, 2, 1);
  }
    else{
    trousersTable.setInt(position, 2, 0);
    }
  saveTable(trousersTable, "data/Clothing/trousers/trousers.csv");
   println("trousers saved");
  }

}
}
void update(int x, int y){
  
  if(label =="shirts"){
  if(shirtsTable.getInt(position,2)==1){
  toggle =true;
  }
  else{
  toggle =false;
  }
}
if(label == "trousers"){
  if(trousersTable.getInt(position,2)==1){
  toggle =true;
  }
  else{
  toggle =false;
  }
}
  
if(overRect(x+50, y+250, 50, 50)){
overMe = true;
}else{
overMe = false;
}
if(toggle){
activeImage = tick;
}
else{
activeImage = cross;
}
xpos = x;
ypos = y;
}
}

class ironingYesNo extends button{ //////////////////////IRONING BUTTON
 PImage activeImage;
 String label;
 ironingYesNo(int xp, int yp, int _position, String _label){
 super( xp,  yp,  50,  50, _position, _label);
 label = _label;

 } 
 void display(){
  if(toggle){
    if(overMe){
     fillColor = color(255,25);
    }else{
      fillColor = color(255,0);
    }
    activeImage =tick;
  }else{
    if(overMe){
      fillColor = color(255,25);
    }else{
      fillColor = color(255,0);
    }
    activeImage = cross;
  }
  image(activeImage,xpos+150,ypos+250);
  fill(fillColor);
  rect(xpos+150, ypos+250, 50,50);
}
void clicked(){
if(overRect(xpos+150, ypos+250, 50, 50)){
  toggle = !toggle;
  if(label == "shirts"){
    if(toggle){
      shirtsTable.setInt(position, 3, 1);
      
  }
    else{
    shirtsTable.setInt(position, 3, 0);
    }
  saveTable(shirtsTable, "data/Clothing/shirts/shirts.csv");
  }
  if(label == "trousers"){
    if(toggle){
      trousersTable.setInt(position, 3, 1);
  }
    else{
    trousersTable.setInt(position, 3, 0);
    }
  saveTable(trousersTable, "data/Clothing/trousers/trousers.csv");
  }

}
}
void update(int x, int y){

if(label =="shirts"){
  if(shirtsTable.getInt(position,3)==1){
  toggle =true;
  }
  else{
  toggle =false;
  }
}
if(label == "trousers"){
  if(trousersTable.getInt(position,3)==1){
  toggle =true;
  }
  else{
  toggle =false;
  }
}
if(overRect(x+150, y+250, 50, 50)){
overMe = true;
}else{
overMe = false;
}
if(toggle){
activeImage = tick;
}
else{
activeImage = cross;
}
xpos = x;
ypos = y;
}
}
