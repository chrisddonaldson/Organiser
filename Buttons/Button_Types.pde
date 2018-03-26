class uiButton extends button{
  uiButton(int xp, int yp, int _position, String _label){
  super(xp, yp, 90, 30, _position, _label);
  } 
}

class uiButtonTeir2a extends button{ ////////////////////////2a ////////////////
  uiButtonTeir2a(int xp, int yp, int _position, String _label){
  super(xp, yp, 90, 30, _position, _label);
  }
  
  void clicked(){
if(overRect(xpos, ypos, xsize, ysize)){
  if(teir2aActiveButton == position){
    teir2aActiveButton = 10;
  }
  else{
  teir2aActiveButton = position;
  }
}
}

void update(){
if(overRect(xpos, ypos, xsize, ysize)){
overMe = true;
}else{
overMe = false;
}

if(teir2aActiveButton == position){
toggle = true;
}
else{
toggle = false;
}
}
}

class uiButtonTeir2b extends button{ /////////////////////////////////////////////2b
  uiButtonTeir2b(int xp, int yp, int _position, String _label){
  super(xp, yp, 90, 30, _position, _label);
  }
  
  void clicked(){
if(overRect(xpos, ypos, xsize, ysize)){
  if(teir2bActiveButton == position){
    teir2bActiveButton = 10;
  }
  else{
  teir2bActiveButton = position;
  }
}
}
void update(){
if(overRect(xpos, ypos, xsize, ysize)){
overMe = true;
}else{
overMe = false;
}

if(teir2bActiveButton == position){
toggle = true;
}
else{
toggle = false;
}

}
}
