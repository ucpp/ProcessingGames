class Cell
{
  class State
  {
    static final int
    EMPTY = 0, // пустая клетка
    X = 1,     // крестик
    O = 2;     // нолик
  }
  public int state = State.EMPTY;

  private Point position;
  private int w, h;
  private PImage img;

  public Cell(int x, int y, int w, int h)
  {
    position = new Point(x, y);
    this.w = w;
    this.h = h;
  }
  
  // установить состояние ячейки
  public void setState(int state, PImage img)
  {
    this.state = state;
    this.img = img;
  }
  
  // проверка на вхождение точки в ячейку, для проверки клика мышью
  public boolean contains(int x, int y)
  {
    if(x > position.x && x < position.x + w && y > position.y && y < position.y + w)
      return true;
    return false;
  }
  
  // если ячейка не пустая, нарисовать изображение
  public void render()
  {
    if(state > State.EMPTY)
      image(img, position.x, position.y);
  }
}