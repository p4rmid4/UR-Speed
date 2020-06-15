class Speed {
  String s;
  float x, y;

  Speed(float _x, float _y) {
    x = _x; y = _y; 
  }
  
  String toString() {
    return String.format("[%.9s, 0, %.9s,0,0,0]", x, y);
  }
}
