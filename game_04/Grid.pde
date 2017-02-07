class Grid
{
  public GameScene gameScene;

  private Player player = new Player(Cell.State.X);
  private AI ai = new AI(Cell.State.O);
  private Point position;
  private PImage img;
  private PImage xImg, oImg;
  private boolean isAIMove = false;
  private float dt = 0;  
  private Cell[] cells;
  
  public Grid(){}
  
  public Grid(PImage img, Point position)
  {
    LoadImages();
    Initialize(img, position);
  }
  
  private void LoadImages()
  {
    ResourceLoader res = ResourceLoader.getInstance();
    oImg = res.GetImage("1");
    xImg = res.GetImage("2");
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
  
  public void render()
  {
    if(img != null)
      image(img, position.x, position.y);
      
    for(int i = 0; i < cells.length; i++)
      cells[i].render();
    
    update();
  }
  
  private void update()
  {
    dt += 1.0f/30.0f;
    if(dt >= 2.0f)
    {
      dt = 0.0f;
      updateAI();
      
      if(gameScene != null)
      {
        if(ai.isWin())
          gameScene.Lose();
        else if(ai.isDeadHeat())
          gameScene.DeadHeat();
        else if(player.isWin())
          gameScene.Win();
          
        if(gameScene.isEndGame)
          return;
      }
    }
  }

  private void updateAI()
  {
    if(isAIMove) 
    {
      int pos = ai.getNextPosition();
      isAIMove = false;
      if(pos > -1)
        setCell(pos-1, Cell.State.O, oImg);
    }
  }

  public void onMousePressed()
  {    
    if(isAIMove) 
      return;

    for(int i = 0; i < cells.length; i++)
    {
      if(cells[i].contains(mouseX, mouseY) && cells[i].state == Cell.State.EMPTY)
      {
        setCell(i, Cell.State.X, xImg);
        if(!player.isWin())
        { 
          isAIMove = true;
          break;
        }
      }
    }
  }

  private void setCell(int cellNumber, int state, PImage cellImg)
  {
    if(cellNumber < cells.length && cells[cellNumber] != null)
    {
      cells[cellNumber].setState(state, cellImg);
      player.move(cellNumber+1, state);
      ai.move(cellNumber+1, state);
    }
  }
}