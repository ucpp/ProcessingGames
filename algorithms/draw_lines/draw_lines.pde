class Point
{
  public int x, y;
  
  Point(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}

void setup() 
{ 
  size(400, 200); 
  Point A = new Point(25, 25);
  Point B = new Point(375, 175);

  DrawBresenhamLine(A, B);
  //DrawLineDDA(A, B);
}

void DrawLineDDA(Point A, Point B)
{
  int lengthX = abs(B.x - A.x);
  int lengthY = abs(B.y - A.y);
  int len = max(lengthX, lengthY);
  
  if (len == 0)
  {
    point(A.x, A.y);
    return;
  }
  float dx = (float)(B.x - A.x) / len;
  float dy = (float)(B.y - A.y) / len;
  float x = A.x;
  float y = A.y;
  len++;
  while(len-- > 0)
  {
    x+=dx;
    y+=dy;
    point(x, y);
  }
}

void DrawBezierLine(Point p0, Point p1)
{
  float step = 1.0/max(abs(p1.x - p0.x), abs(p1.y-p0.y)); 
  for(float t = 0.0; t <= 1.0; t += step) 
  { 
    float x = round((1-t) * p0.x + t * p1.x); 
    float y = round((1-t) * p0.y + t * p1.y); 
    point(x, y); 
  } 
}

void DrawBresenhamLine(Point A, Point B)
{ 
      int lengthX = abs(B.x - A.x);
      int lengthY = abs(B.y - A.y);
 
      int len = max(lengthX, lengthY);
 
      if (len == 0)
      {
          point(A.x, A.y);
          return;
      }
      
      int dx = (B.x - A.x >= 0 ? 1 : -1);
      int dy = (B.y - A.y >= 0 ? 1 : -1);
       
      // Начальные значения
      int x = A.x;
      int y = A.y;
 
      if (lengthY <= lengthX)
      {
            int e = -lengthX;
            len++;
            while(len-- > 0)
            {
                  point(x, y);
                  x += dx;
                  e += 2 * lengthY;
                  if (e > 0) 
                  {
                        e -= 2 * lengthX;
                        y += dy;
                  }
            }
      }
      else
      {
            int e = - lengthY;
            len++;
            while(len-- > 0)
            {
                  point(x, y);
                  y += dy;
                  e += 2 * lengthX;
                  if (e > 0) 
                  {
                        e -= 2 * lengthY;
                        x += dx;
                  }
            }
      }
}