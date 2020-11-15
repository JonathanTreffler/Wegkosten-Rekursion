void printFormatedMatrix(int[][] tab) {
  int max = Integer.MIN_VALUE;
  // groesste zahl ermitteln;
  for (int x = 0; x < tab.length; x++) {
    for (int y = 0; y < tab[0].length; y++) {
      if (tab[x][y] > max) {
        max = tab[x][y];
      }
    }
  }
  int size = (max+"").length();
  for (int x = 0; x < tab.length; x++) {
    for (int y = 0; y < tab[0].length; y++) {
      print((new String(new char[size + 2 - (tab[x][y]+"").length()]).replace('\0', ' ')) + tab[x][y]);
    }
    println();
  }
}
