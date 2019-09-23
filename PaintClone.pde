//finish this paint program.
//if you press more green enough times it goes back to black
//if you press the less green button when the cursor is black it should go to green
//hint modulo command %
//further hint the modulo command in processing doesn't play nice with negatives

//make buttons for blue and red
//debounce the buttons
//hint make a mousePressed method

//Pat on the back for marking your up/down buttons in a nice way.

//Jonathan Layes

PImage plus;
PImage minus;

color cursorcolor = 0;

int red = 0;
int green = 0;
int blue = 0;
int step = 5;

int size = 1;


void setup() {

  size(600, 600);
  background(255);
  buttons();

  plus = loadImage("Plus Image.png"); //positive image
  minus = loadImage("Minus Image.png"); // negative image
}

void draw() {

  buttons();
  Skins();
  cursorcolor = color(red, green, blue);
}
//Skin for buttons: positive and negative
void Skins() {

  //RED button
  tint(199, 90, 90);//RED tint
  image(plus, 0, 0, 50, 50);
  image(minus, 50, 0, 50, 50);

  //GREEN button
  tint(90, 199, 90);//GREEN tint
  image(plus, 0, 50, 50, 50);
  image(minus, 50, 50, 50, 50);

  //BLUE button
  tint(90, 90, 199);//BLUE tint
  image(plus, 0, 100, 50, 50);
  image(minus, 50, 100, 50, 50);
}
void mouseClicked() { //single click buttons

  //positive red
  if (red == 0 && (mouseButton == LEFT)&&  mouseX<50 && mouseY<50) {
    red = (red +step) % 255;
  } else if (red > 0 && (mouseButton == LEFT)&&  mouseX<50 && mouseY<50) {
    red = (red +step) % 255;
  }
  //negative red
  if (red == 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<50) {
    red = (red -step);
  }
  if (red < 0) {
    red = 255;
  } else if (red > 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<50) {
    red = (red -step);
  }
  //positive green
  if (green == 0 && (mouseButton == LEFT)&& mouseX<50 && mouseY<100 && mouseY>50) {
    green = (green +step) % 255;
  } else if (green > 0 && (mouseButton == LEFT)&& mouseX<50 && mouseY<100 && mouseY>50) {
    green = (green +step) % 255;
  }
  //negative green
  if (green == 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<100 && mouseY>50) {
    green = (green -step);
  }  
  if (green < 0) {
    green = 255;
  } else if (green > 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<100 && mouseY>50) {
    green = (green -step);
  }
  if (green < 0) {
    green = 255;
  }
  //positive blue
  if (blue == 0 && (mouseButton == LEFT)&& mouseX<50 && mouseY<150 && mouseY>100) {
    blue = (blue +step) % 255;
  } else if (blue > 0 && (mouseButton == LEFT)&& mouseX<50 && mouseY<150 && mouseY>100) {
    blue = (blue +step) % 255;
  }
  //negative blue
  if (blue == 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<150 && mouseY>100) {
    blue = blue -step;
  }
  if (blue < 0) {
    blue = 255;
  } else if (blue > 0 && (mouseButton == LEFT)&& 50<mouseX && mouseX<100 && mouseY<150 && mouseY>100) {
    blue = blue -step;
  }
  if (blue < 0) {
    blue = 255;
  }
}

void buttons() {// RGB buttons

  stroke(255);

  //RED:
  //more red button

  fill(red, 0, 0);
  rect(0, 0, 50, 50);


  //less red button
  fill(red, 0, 0);
  rect(50, 0, 50, 50);

  //GREEN:
  //more green button
  fill(0, green, 0);
  rect(0, 50, 50, 50);

  //less green button
  fill(0, green, 0);
  rect(50, 50, 50, 50);

  //BLUE:
  //more blue button
  fill(0, 0, blue);
  rect(0, 100, 50, 50);

  //less blue button
  fill(0, 0, blue);
  rect(50, 100, 50, 50);


  //drawing part
  if (mousePressed) {

    brushSize();
  }
}

// brushSize = prevents the brush size from looping
// when holding down left or right keys
void brushSize() { 
  if (size > 0) {
    fill(cursorcolor);
    noStroke();
    ellipse(mouseX, mouseY, size, size);
  }
}


void reboot() { // erasing picture
  background(255);
}
// Down = to clear picture
// Right = increase size of brush | Left = decrease size of brush
void keyPressed() { 

  if (key == CODED && keyCode == DOWN) {
    reboot(); 
    buttons();
    Skins();
  }

  if (key == CODED && keyCode == RIGHT ) {
    size = size +1;
  }
  if (key == CODED && keyCode == LEFT ) {
    size = size -1;
  }
}
