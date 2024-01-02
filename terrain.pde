int c, r;
int s = 20;
int W = 2000;
int H = 1600;

float f = 0;

float[][] t;

void setup() {
  size(800, 600, P3D);
  c = W / s;
  r = H / s;
  t = new float[c][r];
}

void draw() {
  f -= 0.1;
  float yOff = f;
  for (int y = 0; y < r; y++) {
    float xOff = 0;
    for (int x = 0; x < c; x++) {
      t[x][y] = map(noise(xOff, yOff), 0, 1, -100, 100);
      xOff += 0.2;
    }
    yOff += 0.2;
  }

  background(0);
  translate(width / 2, height / 2 + 50);
  rotateX(PI / 3);
  translate(-W / 2, -H / 2 - 50);
  for (int y = 0; y < r - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < c; x++) {
      float currentHeight = t[x][y];
      float col = map(currentHeight, -100, 100, 0, 255);
      fill(col, 50, 255 - col);
      vertex(x * s, y * s, currentHeight);
      
      currentHeight = t[x][y + 1];
      col = map(currentHeight, -100, 100, 0, 255);
      fill(col, 50, 255 - col);
      vertex(x * s, (y + 1) * s, currentHeight);
    }
    endShape();
  }
}
