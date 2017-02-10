class StartScene extends BaseScene
{  
  void render()
  {
    super.render();
    text("2048 game", width/2, height/5  - settings.fontSize/2);
    text("Press to start", width/2, height - height/5  - settings.fontSize/2);
  }
}