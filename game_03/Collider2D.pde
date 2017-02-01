public class BoxCollider2D extends ColliderAABB 
{
  BoxCollider2D(float x, float y, float w, float h)
  {
    super(new Vector2(x, y), new Vector2(w, h));
  }
}

public class ColliderAABB
{
  public Vector2 P = new Vector2();//положение в пространстве
  Vector2 E = new Vector2();// размеры
  Vector2 vMin = new Vector2();// минимальная точка
  Vector2 vMax = new Vector2();// максимальная точка
 
  ColliderAABB() { }
  
  ColliderAABB(Vector2 offset, Vector2 size)
  {
    Vector2[] vertices = new Vector2[4];
    vertices[0] = new Vector2(offset.x, offset.y);
    vertices[1] = new Vector2(offset.x + size.x, offset.y);
    vertices[2] = new Vector2(offset.x + size.x, offset.y + size.y);
    vertices[3] = new Vector2(offset.x, offset.y + size.y);
    initialize(vertices);
  }
  
  ColliderAABB(Vector2[] vertices)
  {
     initialize(vertices);
  }
  
  private void initialize(Vector2[] vertices)
  {
     vMin = new Vector2(vertices[0].x, vertices[0].y);
     vMax = new Vector2(vertices[0].x, vertices[0].y);
     // ищем минимальную/максимальную точки
     for (int i=1; i<vertices.length; i++) 
     {
        vMax.x = max(vMax.x, vertices[i].x);
        vMax.y = max(vMax.y, vertices[i].y);
        vMin.x = min(vMin.x, vertices[i].x);
        vMin.y = min(vMin.y, vertices[i].y);
     }
     // вычисляем размеры
     E.x = (vMax.x - vMin.x) / 2.0f;
     E.y = (vMax.y - vMin.y) / 2.0f;
     
     // и положение в пространстве
     P.x = vMin.x + E.x;
     P.y = vMin.y + E.y;
  }
  
  public boolean OverlapsAABB(ColliderAABB aabb)
  {
    Vector2 T = new Vector2(aabb.P.x - P.x, aabb.P.y - P.y);
    return abs(T.x) <= (E.x + aabb.E.x) && abs(T.y) <= (E.y + aabb.E.y);
  }
  
  boolean OverlapsCircle(CircleCollider2D cc)
  {
    float d = 0, a;

      // если центр сферы лежит перед AABB,
      if (cc.P.x < vMin.x)
      {
         // то вычисляем квадрат расстояния по этой оси
         a = cc.P.x - vMin.x;
         d += a * a;
      }
      // если центр сферы лежит после AABB,
      if (cc.P.x > vMax.x)
      {
         // то вычисляем квадрат расстояния по этой оси
         a = cc.P.x - vMax.x;
         d += a * a;
      }
      
       // если центр сферы лежит перед AABB,
      if (cc.P.y < vMin.y)
      {
         // то вычисляем квадрат расстояния по этой оси
         a = cc.P.y - vMin.y;
         d += a * a;
      }

      // если центр сферы лежит после AABB,
      if (cc.P.y > vMax.y)
      {
         // то вычисляем квадрат расстояния по этой оси
         a = cc.P.y - vMax.y;
         d += a * a;
      }

      return d <= (cc.R * cc.R);
  }
}

public class CircleCollider2D
{
  Vector2 P = new Vector2();
  float R = 0;
  
  CircleCollider2D(){}
  CircleCollider2D(Vector2 v, float r)
  {
    P = new Vector2(v.x, v.y);
    R = r;
  }
}