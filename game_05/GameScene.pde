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
  
  void onKeyPressed(int k)
  {
    if(k == UP)
      grid.moveUp();
    else if(k == DOWN)
      grid.moveDown();
    else if(k == LEFT)
      grid.moveLeft();
    else if(k == RIGHT)
      grid.moveRight();
  }
}