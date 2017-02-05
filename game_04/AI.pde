class AI extends Player
{
  int[] winPos = {5, 1, 3, 7, 9};
    
  public AI(int state)
  {
    super(state);
  }

  int getPos()
  {
    int numToWinO = indexToWin(Cell.State.O);
    if(numToWinO > -1)
      return numToWinO;

    int numToWinX = indexToWin(Cell.State.X);
    if(numToWinX > -1)
      return numToWinX;
    
    for(int i = 0; i < winPos.length; i++)
    {
      int index = winPos[i];
      if(grid[index-1] == Cell.State.EMPTY)
        return index;
    }
    for(int i = 0; i < grid.length; i++)
    {
      if(grid[i] == Cell.State.EMPTY)
        return i + 1;
    }
    return -1;
  }
}