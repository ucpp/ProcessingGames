class GameScene extends BaseScene
{  
  void render()
  {
    super.render();
    text("", width/2, height/2  - settings.fontSize/2);
  }
}