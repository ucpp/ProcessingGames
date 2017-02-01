class Cell
{
  Point position;
  public int w, h;
  
  public Cell(int x, int y, int w, int h)
  {
    position = new Point(x, y);
    this.w = w;
    this.h = h;
  }
}