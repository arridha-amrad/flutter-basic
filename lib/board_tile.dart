import 'package:flutter/material.dart';
import 'package:try_flutter/file_state.dart';

class BoardTile extends StatelessWidget {
  final double boardDimension;
  final VoidCallback onPressed;
  final TileState tileState;

  BoardTile({
    Key? key,
    required this.boardDimension,
    required this.onPressed,
    required this.tileState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boardDimension / 3,
      height: boardDimension / 3,
      child: TextButton(onPressed: onPressed, child: _widgetForTileState()),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.CIRCLE:
        {
          widget = Image.asset("images/o.png");
        }
        break;

      case TileState.CROSS:
        {
          widget = Image.asset("images/x.png");
        }
        break;

      default:
        {
          widget = Container();
        }
        break;
    }

    return widget;
  }
}
