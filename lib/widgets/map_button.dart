import 'package:flutter/material.dart';
import 'package:tp3demine/models/case_model.dart';
import 'package:tp3demine/viewmodels/game_view_model.dart';


class MapButton extends StatelessWidget {
  final CaseModel cell;
  final int x, y;
  final GameViewModel gameViewModel;

  const MapButton({
    Key? key,
    required this.cell,
    required this.x,
    required this.y,
    required this.gameViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gameViewModel.click(x, y),
      onLongPress: () => gameViewModel.onLongPress(x, y),
      child: gameViewModel.getIcon(cell),
    );
  }
}