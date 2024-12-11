Spaceship player = new Spaceship();
Star[] stars = new Star[200];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
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
  for(int i = 0; i<5; i++){
    asteroids.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
  for(int i = 0; i<asteroids.size(); i++){
    asteroids.get(i).move();
    asteroids.get(i).show();
    float padistance = dist((float)player.getCenterX(), (float)player.getCenterY(), (float)asteroids.get(i).getCenterX(), (float)asteroids.get(i).getCenterY());
    if(padistance < 20){
      asteroids.remove(i);
      i--;
    }
  }
  for(int i = 0; i<bullets.size(); i++){
    bullets.get(i).move();
    bullets.get(i).show();
    if(bullets.get(i).getCenterX()<1 || bullets.get(i).getCenterX()>499){
      bullets.remove(i);
      i--;
      break;
    }
    if(bullets.get(i).getCenterY()<1 || bullets.get(i).getCenterY()>499){
      bullets.remove(i);
      i--;
      break;
    }
    for(int k = 0; k<asteroids.size(); k++){
      float abdistance = dist((float)asteroids.get(k).getCenterX(), (float)asteroids.get(k).getCenterY(), (float)bullets.get(i).getCenterX(), (float)bullets.get(i).getCenterY());
      if (abdistance < 20){
        bullets.remove(i);
        asteroids.remove(k);
        break;
      }
    }
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
  if(key == ' '){
   bullets.add(new Bullet(player));
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
