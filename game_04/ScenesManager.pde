class ScenesManager
{
  BaseScene currentScene = null;
  
  void initialize()
  {
    currentScene = new StartScene();
  }
  
  void render()
  {
    currentScene.render();
  }
 
  void onMousePressed()
  {
    if(currentScene instanceof StartScene)
      currentScene = new GameScene();
    else if(currentScene instanceof WinScene || currentScene instanceof LoseScene)
      currentScene = new StartScene();
    else if(currentScene instanceof GameScene)
      currentScene.onMousePressed();
   }
}