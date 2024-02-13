String mensWear= "Men's Wear ";
String womensWear= "Women's Wear ";
String kidsWear = "kids Wear";
int projectTypeInt = 0;
String projectTypeString = "";


String convertTypeToString(int projectTypeInt){
  if(projectTypeInt == 0 ){
    projectTypeString = mensWear;
  }else if (projectTypeInt ==1 ){
    projectTypeString = womensWear;
  }else if (projectTypeInt == 2){
    projectTypeString = kidsWear;
  }
  return projectTypeString;
}