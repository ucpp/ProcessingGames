class GameScene extends BaseScene
{
  Grid grid = new Grid(); 
  
  public GameScene()
  { 
    initialize();
  }
  
  void initialize()
  {
    super.initialize();
    PImage img = ResourceLoader.getInstance().GetImage("grid");
    Point pos = new Point((256 - img.width)/2, (256 - img.height)/2);
    grid = new Grid(img, pos);
    frameRate(5);
  }
  
  void render()
  {
    super.render();
    grid.render(); 
  }
  
  void onMousePressed()
  {
     grid.onMousePressed();
  }
}