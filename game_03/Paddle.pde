class Paddle
{
  public BoxCollider2D collider;
  float x, y, w, h;

  Paddle(float x, float y, float w, float h)
  {
    collider = new BoxCollider2D(x, y, w, h);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void render()
  {
    rect(x, y, w, h);
  }
  
  public void update(int x)
  {
    float dx = clamp(x, 0, width - w);
    this.x = (int)lerp(this.x, dx, 0.15);
    collider = new BoxCollider2D(this.x, this.y, this.w, this.h);
  }
  
  public float clamp(float value, float minValue, float maxValue)
  {
    return max(minValue, min(value, maxValue));
  }
}