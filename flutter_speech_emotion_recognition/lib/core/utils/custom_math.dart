class CustomMath {
  factory CustomMath() => _instance;
  static final CustomMath _instance = CustomMath.init();

  CustomMath.init();

  List<T> bigLittle<T extends num>(T a, T b) {
    if (a > b) {
      return [a, b];
    }
    return [b, a];
  }
}
