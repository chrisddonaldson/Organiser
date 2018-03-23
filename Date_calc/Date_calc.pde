
String date1 ="2/3/2018";
String date2 ="28/2/2018";
Table workouts;
int daysTotal;

workoutBlock[] icons;

void setup(){
size(1600,900);
workouts = loadTable("Workouts.csv", "header");
icons = new workoutBlock[workouts.getRowCount()];
for ( int i = 0; i<workouts.getRowCount(); i++){
icons[i] = new workoutBlock(workouts.getString(i,0),10, 40*i+100, workouts.getString(i,1));
daysTotal = daysTotal + icons[i].reportDays();
}


} //<>//



void draw(){
println(calculateDateDifference(date1,date2));

for ( int i = 0; i<workouts.getRowCount(); i++){
icons[i].display();

}
text(daysTotal, 100 ,40*workouts.getRowCount() + 100);
}


//WORKOUT Block Class
class workoutBlock{
  String name;
  int xpos;
  int ypos;
  String dateDone;
  int d=day();
  int m=month();
  int y=year();
  
  
  String today =  d + "/" + m + "/"+ y;
  int daysPassed;
  
  workoutBlock(String _name, int _xpos, int _ypos, String _dateDone){
  name = _name;
  xpos = _xpos;
  ypos = _ypos;
  dateDone = _dateDone;
  daysPassed = calculateDateDifference(today, dateDone);
  }
  
  void display(){
  
  text (name, xpos, ypos);
  text (daysPassed, xpos+90, ypos);
  }
  
  int reportDays(){
  return daysPassed;
  }
  
  
}

//DATE CALCULATIONS ----------------------------------------------------------------------------------------------------
int calculateDateDifference(String date1, String date2){
  String[] dateList1 = split(date1, "/");
  String[] dateList2 = split(date2, "/");
  int dx = int(dateList1[0]);
  int mx = int(dateList1[1]);
  int yx = int(dateList1[2]);
  int dy = int(dateList2[0]);
  int my = int(dateList2[1]);
  int yy = int(dateList2[2]);
  return convertToDays(dx,mx,yx) - convertToDays(dy,my,yy);
  
}


int convertToDays(int d, int m, int y){
 int[] leapYear = {31,29,31,30,31,30,31,31,30,31,30,31};
int[] notLeapYear = {31,28,31,30,31,30,31,31,30,31,30,31};
  int runningTotal = 0;
  //count days from years
  for(int i =0; i<y; i++){
    if((i % 4 == 0) && (i % 100 != 0) || (i % 400 == 0)){
      //leap year, sum leap year array
     for(int p = 0; p<12;p++){
        runningTotal = runningTotal + leapYear[p];
     }
     }
     else{
     //leap year, sum leap year array
       for(int p = 0; p<12;p++){
       runningTotal = runningTotal + notLeapYear[p];
     }
     }
  }
  //count days from months
    if((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0)){
      //leap year, sum leap year array
     for(int p = 0; p<m-1;p++){
        runningTotal = runningTotal + leapYear[p];
     }
     }
     else{
     //leap year, sum leap year array
       for(int p = 0; p<m-1;p++){
       runningTotal = runningTotal + notLeapYear[p];
     }
     }
  //count days
  runningTotal = runningTotal + d;
  return runningTotal;
}
