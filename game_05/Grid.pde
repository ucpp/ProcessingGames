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
    for(int i=0; i<cells.length;i++)
    {
      for(int j=0; j<cells[i].length; j++)
      {
        cells[i][j]=new Cell();
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
}