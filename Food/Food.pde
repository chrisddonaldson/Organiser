Table food;
itemRow[] foods;
itemCatagory[] catagories;
String[] catagoryNames = {"Fresh", "Bakery", "Canned Foods", "Startch", "Cooking", "Sandwitches", "Sauces", "Breakfast", "Beverages", "Drugs", "Beverages", "Snacks","Bathroom", "Hard Goods", "Refrigerator", "Freezer", "Suppliments"};
int activeCatagory;

void setup(){
size(1600,900);
food = loadTable("food.csv","header");
foods = new itemRow[food.getRowCount()];
catagories = new itemCatagory[catagoryNames.length];
for( int i = 0; i<food.getRowCount(); i++){
  println(i);
  foods[i] = new itemRow(food.getString(i,2), food.getInt(i,4),10, 10*i+20);
}
for(int i =0; i<catagoryNames.length; i++){
  catagories[i] = new itemCatagory(catagoryNames[i], 300, 10*i+20, i);
}
}

void draw(){
for( int i = 0; i<food.getRowCount(); i++){
  foods[i].display();
}
for(int i = 0; i<catagoryNames.length; i++){
  catagories[i].display();
}}

class itemCatagory{
  String name;
  int xpos;
  int ypos;
  boolean toggle;
  int arrayPosition;
  itemCatagory(String _name, int _xpos, int _ypos, int _arrayPosition){
    xpos = _xpos;
    ypos = _ypos;
    name = _name;
    arrayPosition = _arrayPosition;
  
  }
void display(){
  text(name, xpos, ypos);
}
}

class itemRow{
String name;
int quanity;
int xpos,ypos;

  itemRow(String _name, int _quanity, int _xpos, int _ypos){
    name = _name;
    quanity = _quanity;
    xpos = _xpos;
    ypos = _ypos;
}

void display(){
text(name, xpos, ypos);
text(quanity, xpos + 100, ypos);
}


}
