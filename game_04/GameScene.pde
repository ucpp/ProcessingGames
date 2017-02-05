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
  }
  
  void render()
  {
    super.render();
    grid.render(); 
    delay(100);
  }
  
  void onMousePressed()
  {
     grid.onMousePressed();
  }
}