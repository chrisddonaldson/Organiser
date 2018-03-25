uiButton[] teir1;
uiButton[] teir2a;
uiButton[] teir2b;
int teir1ActiveButton;

void setup(){
size(1600,900);
noStroke();
teir1 = new uiButton[2];
teir2a = new uiButton[3];
teir2b = new uiButton[4];
for (int i = 0; i<teir1.length; i++){
  teir1[i] = new uiButton(0,35*i,i);
}
for (int i = 0; i<teir2a.length; i++){
  teir1[i] = new uiButton(90,35*i,i);
}
for (int i = 0; i<teir2b.length; i++){
  teir1[i] = new uiButton(90,35*i,i);
}
}
void draw(){
for (int i = 0; i<teir1.length; i++){
 teir1[i].update();
 teir1[i].display();
}
}

void mouseClicked(){ 
for (int i = 0; i<teir1.length; i++){
 teir1[i].clicked();
}
}



class button{
color fillColor;
color fontColor;
boolean overMe;
boolean toggle;
int position;
int xpos, ypos, ysize, xsize;

  button(int xp, int yp, int xs, int ys, int _position){
  xpos = xp;
  ypos = yp;
  xsize = xs;
  ysize = ys;
  position = _position;
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
  text(position, 10 +xpos, ypos +20);
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
println(teir1ActiveButton);
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
