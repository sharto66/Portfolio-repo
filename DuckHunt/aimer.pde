class aimer extends GameLogic
{
  void draw()
  {
    translate(position.x, position.y);
    stroke(255, 0, 0);
    noFill();
    ellipse(0, 0, 45, 45);
    stroke(255, 0, 0);
    strokeWeight(4);
    line(30, 0, -30, 0);
    line(0, 30, 0, -30);
    noStroke();
  }
  
  void update()
  {
    position.x = mouseX;
    position.y = mouseY;
  }
}
