class duck extends GameLogic
{
  int duckY, duckX;
  int speed;
  float diagonal = random(-0.4f, 0.4f);
  duck(int y, int duckSpeed, int direction)
  {
    duckY = y;
    if(direction == 0)
    {
      speed = duckSpeed;
      duckX = 0;
    }
    else if(direction == 1)
    {
      speed = duckSpeed * -1;
      duckX = 750;
    }
  }
  void draw()
  {
    pushMatrix();
    translate(flight.x, flight.y);
    fill(255, 165, 0);
    stroke(000);
    //rect(duckX, duckY, 50, 50);
    ellipse(duckX, duckY, 70, 30);
    stroke(255);
    fill(0, 102, 0);
    if(duckX == 750)
    {
      ellipse(duckX-37, duckY-16, 22, 15);
    }
    else if(duckX == 0)
    {
      ellipse(duckX+37, duckY-16, 22, 15);
    }
    popMatrix();
  }
  
  void update()
  {
    flight.x += speed;
    flight.y += diagonal;
  }
}
