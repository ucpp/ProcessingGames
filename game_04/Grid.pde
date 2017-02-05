class Grid
{
  Point position;
  PImage img;
  private PImage xImg, oImg;
  public Player player = new Player(Cell.State.X);
  public AI ai = new AI(Cell.State.O);
  public boolean isAIMove = false;
    
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
        {
          cells[y*3 + x] = new Cell(position.x + x * stepX + 5, position.y + y * stepY + 5, stepX-2, stepY-2);
          cells[y*3 + x].number = y*3 + x + 1;
        }
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

    if(ai.isWin())
      sm.Lose();
    else if(ai.isDeadHeat())
      sm.DeadHeat();
    else if(player.isWin())
      sm.Win();
  }
  
  public void onMousePressed()
  {
    if(isAIMove) 
      return;
    
    for(int i = 0; i < cells.length; i++)
    {
      if(cells[i].contains(mouseX, mouseY) && cells[i].state == Cell.State.EMPTY)
      {
        cells[i].setState(Cell.State.X, xImg);
        player.move(cells[i].number, Cell.State.X);
        ai.move(cells[i].number, Cell.State.X);
        if(!player.isWin())
        { 
          isAIMove = true;
          break;
        }
      }
    }
  }
  
  private void update()
  {
    if(isAIMove) 
    {
       int pos = ai.getPos();
       isAIMove = false;
       if(pos > -1)
       {
          ai.move(pos, Cell.State.O);
          player.move(pos, Cell.State.O);
          for(int i = 0; i < cells.length; i++)
          {
              if(cells[i].number == pos)
                cells[i].setState(Cell.State.O, oImg);
          }
       }
    }
  }
}