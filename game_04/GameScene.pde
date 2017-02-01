class GameScene extends BaseScene
{
  Grid grid = new Grid(); 
  PImage imgX, imgO;

  public GameScene()
  { 
    initialize();
  }
  
  void initialize()
  {
    super.initialize();
    ResourceLoader res = ResourceLoader.getInstance();
    imgX = res.GetImage("1");
    imgO = res.GetImage("2");
    PImage img = res.GetImage("grid");
    Point pos = new Point((256 - img.width)/2, (256 - img.height)/2);
    grid = new Grid(img, pos);
  }
  
  void render()
  {
    super.render();
 
    image(grid.img, grid.position.x, grid.position.y);
    for(int i = 0; i < grid.cells.length; i++)
      image(imgX, grid.cells[i].position.x, grid.cells[i].position.y); 
  }
}