//WORKOUT Block Class
class workoutBlock{
  String name;
  int xpos;
  int ypos;
  int xsize = 120;
  int ysize = 30;
  String dateDone;
  int d=day();
  int m=month();
  int y=year();
  int position;
  
  
  String today =  d + "/" + m + "/"+ y;
  int daysPassed;
  
  workoutBlock(String _name, int _xpos, int _ypos, String _dateDone, int _position){
  name = _name;
  xpos = _xpos;
  ypos = _ypos;
  dateDone = _dateDone;
  daysPassed = calculateDateDifference(today, dateDone);
  position = _position;
  }
  
  void display(){
  fill(color(135,92,255));
  rect (xpos, ypos, xsize, ysize);
  fill(0);
  text (name, xpos+5, ypos+18);
  text (daysPassed, xpos+90, ypos+18);
  }
  
void clicked(){
  if(overRect(xpos, ypos, xsize, ysize)){
    if(teir1ActiveButton == 1 && teir2bActiveButton == 2){
      workouts.setString(position,1,today);
      saveTable(workouts, "data/Workouts.csv");
      dateDone = workouts.getString(position,1);
      daysPassed = calculateDateDifference(today, dateDone);
      daysTotal = 0;
      for(int i = 0; i<icons.length; i++){
      daysTotal = daysTotal + icons[i].reportDays();
      }
    
  }

}
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
