class Cell
{
  private Point position;
  private int w, h;
  private int value = 0;
  
  public Cell(int x, int y, int w, int h)
  {
    position = new Point(x, y);
    this.w = w;
    this.h = h;
  }
  
  public void render()
  {
    fill(255);
    rect(position.x, position.y, w, h);
    if(value != 0)
    {
      fill(0);
      int x = position.x + w/2;
      int y = position.y + h/2;
      text(value, x, y);
    }
  }
}