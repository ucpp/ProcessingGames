class AI extends Player
{
  // победные позиции на поле: центр и углы
  int[] winPos = {5, 1, 3, 7, 9};
    
  public AI(int state)
  {
    super(state);
  }

  // вернуть номер ячейки для следующего хода
  int getNextPosition()
  {
    // проверяем можно ли выйграть этим ходом, 
    // если да, то возвращаем его. 
    int numToWinO = indexToWin(Cell.State.O);
    if(numToWinO > -1)
      return numToWinO;
    // проверяем можно ли проиграть за следующий ход
    // если да, то возвращаем защиту против этого.
    int numToWinX = indexToWin(Cell.State.X);
    if(numToWinX > -1)
      return numToWinX;
    // возвращаем победные позиции если свободны
    for(int i = 0; i < winPos.length; i++)
    {
      int index = winPos[i];
      if(grid[index-1] == Cell.State.EMPTY)
        return index;
    }
    // возвращаем любое пустое место на поле
    for(int i = 0; i < grid.length; i++)
    {
      if(grid[i] == Cell.State.EMPTY)
        return i + 1;
    }
    // если не нашли ход, то возвращаем -1
    return -1;
  }
}