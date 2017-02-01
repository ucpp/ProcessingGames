public class Vector2
{
  float x;
  float y;
  
  Vector2(){}
  
  Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  // нормализация
  void setNorm()
  {
    float len = getLength();
    if(len > 0)
    {
      x /= len;
      y /= len;
    }
  }
  
  // вычисление длины вектора
  float getLength()
  {
    return sqrt(x*x + y*y);
  }
  
  // проекция вектора на вектор v
  Vector2 proj(Vector2 v)
  {
    float den = v.getDot(v);
    multiplay(getDot(v)/den);
    return new Vector2(x, y);
  }
  
  // длина проекции вектора
  float projLen(Vector2 v)
  {
    float den = v.getDot(v);
    return abs(getDot(v)/den);
  }
  
  // умножение вектора на скалярную величину
  void multiplay(float s)
  {
    this.x *= s;
    this.y *= s;
  }
  
  // скалярное произведение вектора с вектором v
  float getDot(Vector2 v)
  {
    return x * v.x + y * v.y;
  }
}