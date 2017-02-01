class Ball
{
  final int radius = 5;
  int speedX = 5;
  int speedY = 5;
  int x;
  int y;
  
  void initialize(int x, int y)
  {
    this.x = x;
    this.y = y;
    speedX *= -1;
    speedY *= -1;
  }
  
  void render()
  {
    ellipse(x, y, radius*2, radius*2);
  }
  
  void update()
  {    
    if(y > height - radius || y < radius)
      speedY *= -1;
    x+= speedX;
    y+= speedY; 
  }
}