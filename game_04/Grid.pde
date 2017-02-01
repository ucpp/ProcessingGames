class Grid
{
  Point position;
  PImage img;
  Cell[] cells;
  
  public Grid(){}
  
  public Grid(PImage img, Point position)
  {
    Initialize(img, position);
  }
  
  public void Initialize(PImage img, Point position)
  {
    this.img = img; 
    this.position = position;
    cells = new Cell[9];
    if(img != null)
    {
      int stepX = img.width/3;
      int stepY = img.height/3;
    
      for(int y = 0; y < 3; y++)
      {
        for(int x = 0; x < 3; x++)
          cells[y*3 + x] = new Cell(position.x + x * stepX + 5, position.y + y * stepY + 5, stepX-2, stepY-2);
      }
    }
  }
}