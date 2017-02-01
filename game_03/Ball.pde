class Ball
{
  CircleCollider2D collider;
  Vector2 position = new Vector2();
  int R = 1;
  int speedX = -3;
  int speedY = -3;
  
  Ball(){}
  Ball(int x, int y, int r)
  {
    R = r;
    position = new Vector2(x, y);
    collider = new CircleCollider2D(position, R);
  }
  
  public void render()
  {
    ellipse(position.x, position.y, R*2, R*2);
  }
  
  public void update()
  {
    // проверка на столкновение с левой и правой границами экрана
    if(position.x > width - R || position.x < R)
      speedX *= -1;
    // проверка на столкновение с верхней границей экрана
    if(position.y + R <= 0)
        speedY *= -1;
    position.x += speedX;
    position.y += speedY;
    setPosition(position.x, position.y);
  }
  
  public void setPosition(float x, float y)
  {
    position = new Vector2(x, y);
    collider = new CircleCollider2D(position, R);
  }
}