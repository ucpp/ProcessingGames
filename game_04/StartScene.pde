class StartScene extends BaseScene
{
  void initialize()
  {
    super.initialize();
  }
  
  void render()
  {
    super.render();
    text("Press to start", width/2, height/2  - settings.fontSize/2);
  }
}