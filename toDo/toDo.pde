String[] catagoryNames = { "LTN", "FG","CP","9U" };// "MISC"
catagoryButton[] mainButtons;
int menuSelection;

void setup(){
  size(1600,900);
  noStroke();
  int index = 0;
  mainButtons = new catagoryButton[catagoryNames.length];
  for (int i = 0; i<catagoryNames.length; i++){ //<>//
      mainButtons[index++] = new catagoryButton(0,61*i,100,61,catagoryNames[i], index);
  }
  }
  
  void draw(){
  background(255);
  for(int i= 0; i<catagoryNames.length; i++){
    mainButtons[i].display();
  }
  
  }


class catagoryButton{
  int xpos,ypos,xsize,ysize;
  color activeC;
  color hoverC = color(22,225,125);
  color onC = color(22,225,22);
  color offC = color(225,22,22);
  String name;
  boolean toggle = false;
  int debounce;
  int index;
  Table productsTable;
  productImage[] productImages;
  catagoryButton(int _xpos, int _ypos, int _xsize, int _ysize, String _name, int _index){
    xpos = _xpos;
    ypos = _ypos;
    xsize = _xsize;
    ysize = _ysize;
    name = _name;
    index = _index;
    productsTable = loadTable("data/"+name+"/"+name+".csv","header");
    println(productsTable.getRowCount());
    
    productImages = new productImage[productsTable.getRowCount()];
    int max=productsTable.getRowCount();
    int count = 0;
    int x = 125;
    int y =0;
    
    while(count<max){
     while(x<=1350 && count<max){
       productImages[count] = new productImage(x,y,count,name, productsTable);
       x=x+225;
       count++;
     }
    y = y+325;
    x = 125;
  }
}
  void display(){
  
  if(overRect(xpos,ypos,xsize,ysize)&&mousePressed&&debounce<0){
    if(toggle == false){
      toggle = true;
      debounce = 50;
      menuSelection = index;
    }else{
      toggle = false;
      debounce = 20;
    }
  }  
  debounce--;
  if(menuSelection == index){
    activeC = onC;
  } 
  else{
    activeC = offC;
  } 
  
  if(overRect(xpos,ypos,xsize,ysize)){
    activeC = hoverC;
  }
  
  fill(activeC);  
  rect(xpos,ypos,xsize,ysize);
  fill(0,0,0);
  
  textSize(16);
  text(name, xpos+10,ypos+ysize/2);
  
  if(menuSelection == index){
  for(int i = 0; i <productsTable.getRowCount();i++ ){
      productImages[i].display();
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
}

class productImage{
int xpos;
int ypos;
int xsize = 200;
int ysize = 200;
String catagoryName;
int index;
PImage img;
String title;
String toDo;
Table productsTable;

 productImage(int _xpos, int _ypos, int _index, String _catagoryName, Table _productsTable){
 xpos = _xpos;
 ypos = _ypos;
 catagoryName = _catagoryName;
 index = _index;
 productsTable = _productsTable;
 img = loadImage(catagoryName +"/"+ productsTable.getString(index,0)+".jpg");////////////////////
 title = productsTable.getString(index,0);
 toDo = productsTable.getString(index,1);
 }
 
 void display(){
 image(img, xpos, ypos, xsize, ysize);
 fill(0,0,0);
 textSize(16);
 text(title, xpos +10, ypos+200+20);
 textSize(12);
 text(toDo, xpos +10, ypos+200+32,180,100);
 }

}