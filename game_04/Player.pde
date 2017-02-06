class Player
{
  protected int[][] winStrategy = {{1,2,3}, {4,5,6}, {7,8,9}, // horizontal lines
                                   {1,4,7}, {2,5,8}, {3,6,9}, // vertical lines
                                   {1,5,9}, {3,5,7}};         // diagonals
  int[] grid = new int[9];
  int currentState;
  int countMoves = 0;
  
  public Player(int state)
  {
    currentState = state;
    for(int i = 0; i < grid.length; i++)
      grid[i] = Cell.State.EMPTY;
  }

  void move(int num, int state)
  {
    if(grid[num-1] == Cell.State.EMPTY)
    {
      countMoves++;
      grid[num-1] = state;
    }
  }

  boolean isWin()
  {
    for(int i = 0; i < winStrategy.length; i++)
    { 
      int count = 0;
      for(int j = 0; j < winStrategy[i].length; j++)
      {
        int index = winStrategy[i][j];
        if(grid[index-1] == currentState)
          count++;
      }
      if(count > 2)
        return true;
    }
    return false;
  }

  boolean isDeadHeat()
  {
    return countMoves == 9;
  }
  
  int indexToWin(int state)
  {
    for(int i = 0; i < winStrategy.length; i++)
    {
      int count = 0;
      int emptyIndex = -1;
      for(int j = 0; j < winStrategy[i].length; j++)
      {
        int index = winStrategy[i][j];
        if(grid[index-1] == state)
          count++;
        else if(grid[index-1] == Cell.State.EMPTY)
          emptyIndex = j;
      }
      if(count == 2 && emptyIndex > -1)
        return winStrategy[i][emptyIndex];
    }
    return -1;
  }
}