class menu
{
  int buttonHeight = 50;
  int buttonWidth = 185;
  int buttonX = 297;
  int buttonY = 120;
  int space = 80;
  int enter = 000;
  int exit = 90;
  String endMessage = "";
  
  void draw()
  {
    fill(255);
    stroke(000);
    rect(240, 50, 300, 400);
    stroke(enter);
    rect(buttonX, buttonY + space, buttonWidth, buttonHeight);
    stroke(exit);
    rect(buttonX, buttonY + space*2, buttonWidth, buttonHeight);
    fill(000);
    textSize(25);
    text("PLAY", 360, 235);
    text("EXIT", 360, 235 + space);
    textSize(15);
    String instructions = "Arrow keys + Enter for menu\nMouse click to shoot\nSpace bar for ducks";
    text(instructions, 290, 370);
    textSize(32);
    text("DUCK HUNT", 295, 100);
    textSize(20);
    text(endMessage, 287, 132);
  }
}
