PImage img;
int offset = 1;

import java.util.*;
ArrayList<Integer> palette = new ArrayList<>();

void setup() {
  size(500, 500);
  img = loadImage("image.png");
  background(0);
  noStroke();
  image(img, 0, 0);
  //loadPalette();
  //Collections.sort(palette);
  //drawPalette();
}

void loadPalette() {
  loadPixels();
  for (int i = 0; i < pixels.length; i += 1)
  {
    if (!palette.contains(pixels[i])) {
      palette.add(pixels[i]);
    }
  }
}

void drawPalette() {
  background(0);
  int available_pixels = width * height;
  int pixels_by_color = available_pixels / palette.size();
  int color_square_size = floor(sqrt(pixels_by_color));
  int square_by_row = width / color_square_size;
  int row = 0;
  for (int i = 0; i < palette.size(); i += 1)
  {
    fill(palette.get(i));
    rect((i % square_by_row) * color_square_size, row * color_square_size, color_square_size, color_square_size);
    if (i != 0 && i % square_by_row == 0) {
      row += 1;
    }
  }
}

void editPixels() {
  loadPixels();
  for (int i = 0; i < pixels.length; i += 1)
  {
    if (i % offset != 0) pixels[i] = color(0);
  }
  updatePixels();
}

void mouseWheel(MouseEvent event) {
  offset += event.getCount();
  offset = max(1, offset);
}

void draw() {
  background(0);
  image(img, 0, 0);
  editPixels();
  text(offset, 30, 30);
}
