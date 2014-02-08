import ddf.minim.*;
Minim minim;
AudioPlayer gunshot;
ArrayList<duck> d;
int menuState = 0;
int num = 5;
int score = 0;
int duckNumber;
int select = 000;
int deselect = 90;
int flock = 0;
aimer a = new aimer();
menu Menu = new menu();

void setup()
{
  size(750, 500);
  smooth();
  d = new ArrayList<duck>();
  minim = new Minim(this);
  gunshot = minim.loadFile("shotgun.mp3");
}

void draw()
{ 
  noCursor();
  background(100, 149, 237);
  fill(50, 205, 50);
  rect(0, 420, 750, 80);
  fill(205, 133, 63);
  rect(180, 320, 25, 130);
  fill(50, 205, 50);
  ellipse(195, 300, 110, 70);
  if(menuState != 1)
  {
    Menu.draw();
  }
  for(int i = 0; i < d.size(); i++)
  {
    d.get(i).update();
    d.get(i).draw();
  }
  pushMatrix();
  a.update();
  a.draw();
  popMatrix(); 
  Score();
  GameOver();
}

void mousePressed()
{
  
  for(int i = 0; i < d.size(); i++)
  {
    if (mouseX > d.get(i).flight.x - 50 && mouseX < d.get(i).flight.x + 50 && 
        mouseY > d.get(i).duckY + d.get(i).flight.y - 30 && mouseY < d.get(i).duckY + d.get(i).flight.y + 30)
    {
        d.remove(i);
        score++;
    }
  }
  for(int i = 0; i < d.size(); i++)
  {
    if (mouseX > (750 - d.get(i).flight.x / -1) - 50 && mouseX < (750 - d.get(i).flight.x / -1) + 50 && 
        mouseY > d.get(i).duckY + d.get(i).flight.y - 30 && mouseY < d.get(i).duckY + d.get(i).flight.y + 30)
    {
        d.remove(i);
        score++;
    }
  }
  gunshot.rewind();
  gunshot.play();
}
void keyPressed()
{
  if(key == ' ')
  {
    if(menuState == 1)
    {
      NewDucks();
    }
  }
  if(key == ENTER)
  {
    if(Menu.enter == select)
    {
      menuState = 1;
    }
    else if(Menu.enter == deselect)
    {
      exit();
    }
  }
  if(keyCode == DOWN)
  {
    Menu.enter = deselect;
    Menu.exit = select;
  }
  if(keyCode == UP)
  {
    if(Menu.enter == deselect)
    {
      Menu.enter = select;
      Menu.exit = deselect;
    }
  }
}

void Score()
{
  if(menuState == 1)
  {
    String s = str(score);
    String sentence = "Score: " + s;
    fill(000);
    textSize(25);
    text(sentence, 15, 30);
    String numFlock = str(flock);
    String sentence2 = "Flock: " + numFlock + "/5";
    text(sentence2, 15, 55);
  }
}

void GameOver()
{
  if(flock == 6)
  {
    menuState = 0;
    Menu.endMessage = "Score: " + str(score) + " / 25\n";
    if(score < 6)
    {
      Menu.endMessage = Menu.endMessage + "Do you even shoot?";
    }
    else if(score > 5 && score < 15)
    {
      Menu.endMessage = Menu.endMessage + "Don't quit your day job";
    }
    else if(score > 14 && score < 20)
    {
      Menu.endMessage = Menu.endMessage + "You've got skills that kills";
    }
    else if(score >= 20 && score < 25)
    {
      Menu.endMessage = Menu.endMessage + "You have become death\nthe destroyer of ducks";
    }
    flock = 0;
    score = 0;
    
  }
}
void NewDucks()
{
  flock++;
  if(flock < 6)
  {
    for(int i = 0; i < num; i++)
    {
      d.add(new duck(int(random(100, 400)), int(random(3, 8)), int(random(0, 2))));
    }
  }
}
