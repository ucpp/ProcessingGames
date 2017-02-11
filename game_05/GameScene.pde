class GameScene extends BaseScene
{  
  private Grid grid;
  
  
  void initialize()
  {
    super.initialize();
    grid = new Grid();
  }
  
  void render()
  {
    super.render();
    grid.render();
    text("", width/2, height/2  - settings.fontSize/2);
  }
}