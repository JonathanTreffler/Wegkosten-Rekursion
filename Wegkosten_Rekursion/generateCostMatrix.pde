int[][] generateCostMatrix(int size) {
  int[][]costMatrix = new int[size][size];
  for (int i=0; i<size; i++) {
    for (int t=0; t<size; t++) {
      costMatrix[i][t] = int(random(1, 10));
    }
  }
  return costMatrix;
}
