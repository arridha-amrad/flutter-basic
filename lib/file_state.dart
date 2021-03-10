import 'dart:math';

enum TileState { EMPTY, CROSS, CIRCLE }

// this function will break our list into list-of-list

List<List<TileState>> chunk(List<TileState> list, int size) {
  return List.generate(
      (list.length / size).ceil(),
      (int index) =>
          list.sublist(index * size, min(index * size + size, list.length)));
}
