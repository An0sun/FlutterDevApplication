import 'dart:math';
import 'case_model.dart';

class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  late List<List<CaseModel>> _cases;

  // Getters
  List<List<CaseModel>> get cases => _cases;

  // Init  grille
  void initCases(int line, int col, int bombs) {
    nbLine = line;
    nbCol = col;
    nbBomb = bombs;
    generateMap();
  }

  void generateMap() {
    _cases = List.generate(nbLine, (x) => List.generate(nbCol, (y) => CaseModel()));
  }

  void initBomb() {
    int placed = 0;
    Random random = Random();
    while (placed < nbBomb) {
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      if (!_cases[x][y].hasBomb) {
        _cases[x][y].hasBomb = true;
        placed++;
      }
    }
  }

  void initNumbers() {
    for (int i = 0; i < nbLine; i++) {
      for (int j = 0; j < nbCol; j++) {
        if (!_cases[i][j].hasBomb) {
          _cases[i][j].number = computeNumber(i, j);
        }
      }
    }
  }

  int computeNumber(int x, int y) {
    int count = 0;
    List<List<int>> directions = [
      [0, 1], [1, 0], [0, -1], [-1, 0]
    ];

    for (var dir in directions) {
      var neighbor = getCase(x + dir[0], y + dir[1]);
      if (neighbor != null && neighbor.hasBomb) {
        count++;
      }
    }
    return count;
  }

  CaseModel? getCase(int x, int y) {
    if (x >= 0 && x < nbLine && y >= 0 && y < nbCol) {
      return _cases[x][y];
    }
    return null;
  }

  void reveal(int x, int y) {
    if (_cases[x][y].hidden) {
      _cases[x][y].hidden = false;
    }
  }

  void revealAll() {
    for (var row in _cases) {
      for (var cell in row) {
        cell.hidden = false;
      }
    }
  }

  void explode(int x, int y) {
    if (_cases[x][y].hasBomb) {
      _cases[x][y].hasExploded = true;
      revealAll();
    }
  }

  void toggleFlag(int x, int y) {
    _cases[x][y].hasFlag = !_cases[x][y].hasFlag;
  }
}
