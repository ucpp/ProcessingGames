class ScenesManager
{
  BaseScene currentScene = null;

  void startGame()
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
    else if(currentScene instanceof GameScene)
      currentScene.onMousePressed();
   }
}