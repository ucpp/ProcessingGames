class Brick
{
  public BoxCollider2D collider;
  // цвет блока
  public color col;
  float x, y, w, h;
  
  Brick(float x, float y, float w, float h)
  {
    collider = new BoxCollider2D(x, y, w, h);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void render()
  {
    fill(col);
    rect(x, y, w, h);
  }
}