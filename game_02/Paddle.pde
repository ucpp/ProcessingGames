class Paddle
{
  final int w = 50;
  final int h = 10;
  int x;
  int y;
  
  void initialize(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void render()
  {
    rect(this.x - h/2, this.y - w/2, h, w);
  }
  
  void update(int y)
  {
    int dy = clamp(y, w/2+5, height - (w/2 + 6));
    this.y = (int)lerp(this.y, dy, 0.15);
  }
  
  boolean contains(int x, int y)
  {
    if(abs(x - this.x) < 1 && y > this.y - w/2 && y < this.y + w/2)
      return true;
    return false;
  }
}