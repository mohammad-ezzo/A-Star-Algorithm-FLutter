import 'dart:math' as math;

import 'package:a_star/main.dart';
class Spot {
  int h;
  int g;
  int f;
  final int i;
  final int j;
  final List<Spot> neighbors = [];
  bool isWall = false;

  Spot? previous;
  Spot({
    required this.h,
    required this.g,
    required this.f,
    required this.i,
    required this.j,
  }) {
    isWall = math.Random().nextDouble() < 0.3;
  }
  addNeighbors(List<List<Spot>> grid) {
    if (i < columns - 1) {
      neighbors.add(grid[i + 1][j]);
    }
    if (i > 0) {
      neighbors.add(grid[i - 1][j]);
    }
    if (j < rows - 1) {
      neighbors.add(grid[i][j + 1]);
    }
    if (j > 0) {
      neighbors.add(grid[i][j - 1]);
    }
    if (i > 0 && j > 0) {
      neighbors.add(grid[i - 1][j - 1]);
    }
    if (i < columns - 1 && j > 0) {
      neighbors.add(grid[i + 1][j - 1]);
    }
    if (i > 0 && j < rows - 1) {
      neighbors.add(grid[i - 1][j + 1]);
    }
    if (i < columns - 1 && j < rows - 1) {
      neighbors.add(grid[i + 1][j + 1]);
    }
  }

  Spot copyWith({
    int? h,
    int? g,
    int? f,
    int? i,
    int? j,
  }) {
    return Spot(
      h: h ?? this.h,
      g: g ?? this.g,
      f: f ?? this.f,
      i: i ?? this.i,
      j: j ?? this.j,
    );
  }

  @override
  String toString() {
    return 'Spot(h: $h, g: $g, f: $f, i: $i, j: $j, neighbors:${neighbors.length})';
  }

  @override
  bool operator ==(Object other) {
    return other is Spot && other.i == i && other.j == j;
  }

  @override
  int get hashCode {
    return h.hashCode ^ g.hashCode ^ f.hashCode ^ i.hashCode ^ j.hashCode;
  }

  // heuristic
  int distanceFrom(Spot other) {
    return math
        .sqrt(((i - other.i) * (i - other.i)) + ((j - other.j) * (j - other.j)))
        .toInt();
  }
}
