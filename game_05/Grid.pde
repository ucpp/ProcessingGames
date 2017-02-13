class Grid
{
  private Cell[][] cells;
  private final int size = 4;
  
  private Grid()
  {
    initialize();
  }
   
  private void initialize()
  {
    cells = new Cell[size][size];
    int cellWidth = width/4;
    int cellHeight = height/4;
    for(int y=0; y<cells.length;y++)
    {
      for(int x=0; x<cells[y].length; x++)
      {
        cells[x][y] = new Cell(cellWidth*x, cellHeight*y, cellWidth, cellHeight);
      }
    }
  }
  
  private void render()
  {
    if(cells == null)
      return;
    for(int i=0; i<cells.length;i++)
    {
      for(int j=0; j<cells[i].length; j++)
      {
        cells[i][j].render();
      }
    }
  }
  
  private void moveUp(){}
  private void moveDown(){}
  private void moveLeft(){}
  private void moveRight(){}
  
}