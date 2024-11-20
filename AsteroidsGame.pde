Spaceship player = new Spaceship();
Star[] stars = new Star[200];
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean hIsPressed = false;
public void setup() 
{
  size(500,500);
  background(0);
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
  if(wIsPressed == true){
    player.accelerate(0.1);
  }
  if(aIsPressed == true){
    player.turn(-4);
  }
  if(dIsPressed == true){
    player.turn(4);
  }
  if(hIsPressed == true){
    player.hyperspace();
  }
  player.show();
  player.move();
}
public void keyPressed()
{
  if(key == 'w'){
    wIsPressed = true;
  }
  if(key == 'a'){
    aIsPressed = true;
  }
  if(key == 'd'){
    dIsPressed = true;
  }
  if(key == 'h'){
    hIsPressed = true;
  }
}
public void keyReleased()
{
  if (key == 'w'){
    wIsPressed = false;
  }
  if (key == 'a'){
    aIsPressed = false;
  }
  if (key == 'd'){
    dIsPressed = false;
  }
  if (key == 'h'){
    hIsPressed = false;
  }
}
