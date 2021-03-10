import 'package:flutter/material.dart';
import 'package:try_flutter/board_tile.dart';
import 'package:try_flutter/file_state.dart';

void main() {
  runApp(MyApp());
}

class Key {
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Key.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _boardState = List.filled(9, TileState.EMPTY);

  var _currentTileState = TileState.CROSS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Stack(
          children: [Image.asset("images/board.png"), _boardTiles()],
        ),
      ),
    ));
  }

  Widget _boardTiles() {
    double _boardDimension = MediaQuery.of(context).size.width;
    return Container(
        width: _boardDimension,
        height: _boardDimension,
        child: Column(
            children: chunk(_boardState, 3).asMap().entries.map((entrie) {
          final chunkIndex = entrie.key;
          final chunkValue = entrie.value;

          return Row(
            children: chunkValue.asMap().entries.map((e) {
              final innerIndex = e.key;
              final tileState = e.value;
              final tileIndex = (chunkIndex * 3) + innerIndex;

              return BoardTile(
                  boardDimension: _boardDimension,
                  onPressed: () => _updateSelectedIndex(tileIndex),
                  tileState: tileState);
            }).toList(),
          );
        }).toList()));
  }

  void _updateSelectedIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTileState;
        _currentTileState = _currentTileState == TileState.CIRCLE
            ? TileState.CROSS
            : TileState.CIRCLE;
      });

      final TileState? winner = _findWinner();
      if (winner != null) {
        print("winner : $winner");
        showWinnerDialog(winner);
      }
    }
  }

  void showWinnerDialog(TileState winner) {
    final context = Key.navigatorKey.currentState?.overlay?.context;
    showDialog(
        context: context!,
        builder: (_) {
          return AlertDialog(
            title: Text("Winner"),
            content: Image.asset(
                winner == TileState.CIRCLE ? "images/o.png" : "images/x.png"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _boardState = List.filled(9, TileState.EMPTY);
                      _currentTileState = TileState.CROSS;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("New Game"))
            ],
          );
        });
  }

  TileState? _findWinner() {
    TileState? Function(int, int, int) winnerForMatch = (a, b, c) {
      if (_boardState[a] != TileState.EMPTY) {
        if ((_boardState[a] == _boardState[b]) &&
            (_boardState[b] == _boardState[c])) {
          return _boardState[a];
        }
      }
      return null;
    };

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    TileState? winner;

    for (var i = 0; i < checks.length; i++) {
      if (checks[i] != null) {
        winner = checks[i];
        break;
      }
    }

    return winner;
  }
}
