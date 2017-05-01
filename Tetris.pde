float cols; //<>//
float rows;
float scl;
float w;
float h;

float index;
color[] colors;

float falling = 0;
float xoff = 0;

boolean block;
float blockheight;

void setup() {
  size(500, 800);
  frameRate(10);
  scl = 20;
  w = 500;
  h = 800;
  cols = w / scl;
  rows = h / scl;
  colors = new color[] {
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(0, 255, 255), 
    color(255, 102, 0), 
    color(153, 0, 255)
  };
  index = random(colors.length);
  //if (index == 6) {
    block = false;
  //}
}

void draw() {
  background(255);
  stroke(0);
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      if (int(index) == 0) {
        blockheight = 2;
        block = (y == falling && x == floor(cols/2-1+xoff)) ||
                (y == falling && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+1+xoff));
      } else if (int(index) == 1) {
        blockheight = 3;
        block = (y == falling && x == floor(cols/2-1+xoff)) ||
                (y == falling+1 && x == floor(cols/2-1+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+2 && x == floor(cols/2+xoff));
      } else if (int(index) == 2) {
        blockheight = 2;
        block = (y == falling && x == floor(cols/2-1+xoff)) ||
                (y == falling+1 && x == floor(cols/2-1+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+1+xoff));
      } else if (int(index) == 3) {
        blockheight = 2;
        block = (y == falling && x == floor(cols/2+xoff)) ||
                (y == falling && x == floor(cols/2+1+xoff)) ||
                (y == falling+1 && x == floor(cols/2+1+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff));
      } else if (int(index) == 4) {
        blockheight = 4;
        block = (y == falling && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+2 && x == floor(cols/2+xoff)) ||
                (y == falling+3 && x == floor(cols/2+xoff));
      } else if (int(index) == 5) {
        blockheight = 3;
        block = (y == falling && x == floor(cols/2-1+xoff)) ||
                (y == falling && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+2 && x == floor(cols/2+xoff));
      } else if (int(index) == 6) {
        blockheight = 2;
        block = (y == falling && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2-1+xoff)) ||
                (y == falling+1 && x == floor(cols/2+xoff)) ||
                (y == falling+1 && x == floor(cols/2+1+xoff));
      }
      if (block) {
        fill(colors[int(index)]);
      } else {
        fill(255);
      }
      rect(x*scl, y*scl, scl-1, scl-1);
    }
  }
  if (falling < rows-blockheight) {
    falling++;
  }
}

void keyPressed() {
  if (key == 'l') {
    xoff--;
  } else if (key == 'r') {
    xoff++;
  }
}