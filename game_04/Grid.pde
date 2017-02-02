class Grid
{
  Point position;
  PImage img;
  private PImage xImg, oImg;
  public Player player = new Player();
  public Player ai = new Player();
  public boolean isAIMove = false;
  
  class Player
  {
    void move(){}
    
  }
  
  Cell[] cells;
  
  public Grid(){}
  
  public Grid(PImage img, Point position)
  {
    Initialize(img, position);
  }
  
  public void Initialize(PImage img, Point position)
  {
    ResourceLoader res = ResourceLoader.getInstance();
    oImg = res.GetImage("1");
    xImg = res.GetImage("2");
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
  
  public void render()
  {
    if(img != null)
      image(img, position.x, position.y);
      
    for(int i = 0; i < cells.length; i++)
      cells[i].render();
      
    update();
  }
  
  public void onMousePressed()
  {
    if(isAIMove) 
      return;
    
    for(int i = 0; i < cells.length; i++)
    {
      if(cells[i].contains(mouseX, mouseY))
      {
        cells[i].setState(Cell.State.X, xImg);
        isAIMove = true;
      }
    }
  }
  
  private void update()
  {
    if(isAIMove) 
    {
       for(int i = 0; i < cells.length; i++)
       {
         if(cells[i].state == Cell.State.EMPTY)
         {
           cells[i].setState(Cell.State.O, oImg);
           isAIMove = false;
           break;
         }
       }
    }
  }
}