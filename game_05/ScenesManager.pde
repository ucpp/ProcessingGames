class ScenesManager
{
  //текущая сцена
  BaseScene currentScene = null;
  
  // запустить игру со стартовой сцены
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
  }
  
  void onKeyPressed(int k)
  {
    currentScene.onKeyPressed(k);
  }
}