import 'package:flutter/material.dart';
import '../models/case_model.dart';
import '../models/map_model.dart';

class GameViewModel {
  MapModel mapModel = MapModel();

  // Getters
  List<List<CaseModel>> get cases => mapModel.cases;

  // Générer la grille de jeu
  void generateMap(int line, int col, int nbBomb) {
    mapModel.initCases(line, col, nbBomb);
    mapModel.initBomb();
    mapModel.initNumbers();
  }

  // Gestion du clic sur une case
  void click(int x, int y) {
    CaseModel? cell = mapModel.getCase(x, y);
    if (cell == null || cell.hasFlag) return;

    if (cell.hasBomb) {
      mapModel.explode(x, y);
    } else {
      mapModel.reveal(x, y);
    }
  }

  // Gestion du long press pour poser un drapeau
  void onLongPress(int x, int y) {
    CaseModel? cell = mapModel.getCase(x, y);
    if (cell == null || !cell.hidden) return;

    mapModel.toggleFlag(x, y);
  }

  // Gestion de l'affichage des icônes des cases
  Widget getIcon(CaseModel cell) {
    if (cell.hidden) {
      return cell.hasFlag
          ? Image.asset('assets/imagesDemineur/tile_2_1.png', height: 32)
          : Image.asset('assets/imagesDemineur/tile_2_0.png', height: 32);
    } else {
      if (cell.hasBomb) {
        return Image.asset('assets/imagesDemineur/tile_2_2.png', height: 32);
      } else if (cell.number != null && cell.number! > 0) {
        return Image.asset('assets/imagesDemineur/tile_0_${cell.number}.png', height: 32);
      } else {
        return Image.asset('assets/imagesDemineur/tile_0_0.png', height: 32);
      }
    }
  }
}
