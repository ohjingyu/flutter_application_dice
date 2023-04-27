class Dice {
  final int size;
  late var dice = [];

  Dice({required this.size}) {
    for (int i = 1; i <= size; i++) {
      dice.add(i);
    }
  }
  void shake() {
    dice.shuffle();
  }

  int pick() {
    int res = dice.first;
    dice.removeAt(0);
    return res;
  }
}
