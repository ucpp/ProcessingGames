class GameScene extends BaseScene
{  
  private int[][] grid;
  private final int gridSize = 4;
  
  void initialize()
  {
    super.initialize();
    grid = new int[gridSize][gridSize];
    for(int i=0; i<grid.length;i++)
    {
      for(int j=0; j<grid[i].length; j++)
        grid[i][j]=0;
    }
  }
  
  void render()
  {
    super.render();
    text("", width/2, height/2  - settings.fontSize/2);
  }
}