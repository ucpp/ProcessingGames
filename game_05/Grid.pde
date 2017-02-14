class Grid
{
  private Cell[][] cells;
  private final int size = 4;
  
  private Grid()
  {
    initialize();
    for(int i = 0; i < 1; i++)
      addElement();
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
  
  private void moveCell(Cell from, Cell to)
  {
    if(from.value == to.value)
    {
      to.value *= 2;
      from.value = 0;
    }
    else if(to.value == 0)
    {
      to.value = from.value;
      from.value = 0;
    }
  }
  
  private void moveUp()
  {
    addElement();
    for(int i=0; i < cells.length; i++)
    {
      for(int j=cells[i].length-1; j > 0; j--)
        moveCell(cells[i][j], cells[i][j-1]);
    }   
  }
  
  private void moveDown()
  {
    addElement();
    for(int i=0; i < cells.length; i++)
    {
      for(int j=0; j < cells[i].length-1; j++)
        moveCell(cells[i][j], cells[i][j+1]);
    }   
  }
  
  private void moveLeft()
  {
    addElement();
    for(int i=cells.length-1; i > 0; i--)
    {
      for(int j=0; j<cells[i].length; j++)
          moveCell(cells[i][j], cells[i-1][j]);
    }
  }
 
  private void moveRight()
  {
    addElement();
    for(int i=0; i < cells.length-1; i++)
    {
      for(int j=0; j<cells[i].length; j++)
        moveCell(cells[i][j], cells[i+1][j]);
    }
  }
  
  private boolean addElement()
  {
    int randValue = (int)random(size * size);
    
    for(int i=randValue/size; i<cells.length;i++)
    {
      for(int j=randValue%size; j<cells[i].length; j++)
      {
        if(cells[i][j].value == 0)
        {
          cells[i][j].value = 2;
          return true;
        }
      }
    }
    for(int i = 0; i <= randValue/size; i++)
    {
      for(int j=0; j <= randValue%size; j++)
      {
        if(cells[i][j].value == 0)
        {
          cells[i][j].value = 2;
          return true;
        }
      }
    }
    //нет пустого места для установки новой ячейки
    return false;
  }
}