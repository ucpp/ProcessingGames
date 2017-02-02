class Cell
{
  Point position;
  public int w, h;
  public int number;
  public PImage img;
  class State
  {
    static final int
    EMPTY = 0,
    X = 1,
    O = 2;
  }
  public int state = State.EMPTY;
  
  public Cell(int x, int y, int w, int h)
  {
    position = new Point(x, y);
    this.w = w;
    this.h = h;
  }
  
  public void setState(int state, PImage img)
  {
    this.state = state;
    this.img = img;
  }
  
  public boolean contains(int x, int y)
  {
    if(x > position.x && x < position.x + w && y > position.y && y < position.y + w)
      return true;
    return false;
  }
  
  public void render()
  {
    if(state > State.EMPTY)
      image(img, position.x, position.y);
  }
}