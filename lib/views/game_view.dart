import 'package:flutter/material.dart';
import '../viewmodels/game_view_model.dart';
import '../widgets/map_button.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final GameViewModel gameViewModel = GameViewModel();

  @override
  void initState() {
    super.initState();
    gameViewModel.generateMap(10, 10, 10); // 10x10 avec 10 bombes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Démineur")),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: List.generate(
            gameViewModel.cases.length,
                (x) => TableRow(
              children: List.generate(
                gameViewModel.cases[0].length,
                    (y) => MapButton(
                  cell: gameViewModel.cases[x][y],
                  x: x,
                  y: y,
                  gameViewModel: gameViewModel,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
