// Learning 3D mechanics
// Push and Pop matrix are used to avoid translating each object and for the rotation of the camera
// 03/17/2022
// https://github.com/Parsa-Sha/Learning3D


float currentRotationX, currentRotationY;
float randomWidths[] = new float[100];

void setup() {
  size(630, 360, P3D);
  rectMode(CENTER);
  sphereDetail(15);
  for(int i = 0; i < randomWidths.length; i++){
    randomWidths[i] = noise(i) * 120;
  }
  lights();
}

void draw() {
  background(0);
  pushMatrix();
  if(mousePressed){ // Keeping track of where it is rotated currently to update when mouse is pressed and released
    currentRotationY += (mouseY - pmouseY);
    currentRotationX += (mouseX - pmouseX);
  }
  translate(width/2, height/2, -200);
  rotateX(-currentRotationY * TWO_PI / width);
  rotateY(currentRotationX * TWO_PI / height);
  
  colorMode(HSB);
  directionalLight(0, 0, 255, -HALF_PI, -HALF_PI, -1); 
  colorMode(RGB);
   
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text("INVASION", 0, -200, 0);
  
  fill(145, 160, 189);
  noStroke();
  sphere(120); // Main spherical body
  
  for(int i = 0; i < 100; i++){ // Outer ring
    pushMatrix();
    rotateY(i*3.6*TWO_PI/360);
    translate(250, 0, 0);
    box(randomWidths[i], 3, 3);
    popMatrix();
  }

  for(int i = 0; i < 100; i++){ // Inner ring
    pushMatrix();
    rotateY(i*3.6*TWO_PI/360);
    translate(190, 0, 0);
    box(1, 1, 1);
    popMatrix();
  }

  translate(75, 75, 0); // Right Claw
  
  pushMatrix();
  for(int i = 0; i < 5; i++){
    box(50 - i*10, 50 - i*10, 10);
    translate(-(5-(i+1))*10/2, (5-(i+1))*10, 0);
  }
  popMatrix();
  
  translate(-150, 0, 0); // Left Claw
  
  pushMatrix();
  for(int i = 0; i < 5; i++){
    box(50 - i*10, 50 - i*10, 10);
    translate((5-(i+1))*10/2, (5-(i+1))*10, 0);
  }
  popMatrix();
  
  translate(75, 0, 75); // Front Claw
  
  pushMatrix();
  for(int i = 0; i < 5; i++){
    box(10, 50 - i*10, 50 - i*10);
    translate(0, (5-(i+1))*10, -(5-(i+1))*10/2);
  }
  popMatrix();
  
  translate(0, 0, -150); // Back Claw
  
  pushMatrix();
  for(int i = 0; i < 5; i++){
    box(10, 50 - i*10, 50 - i*10);
    translate(0, (5-(i+1))*10, (5-(i+1))*10/2);
  }
  popMatrix();
  
  translate(0, 100, 75);
  stroke(250, 0, 0);
  noFill();
  sphere(10);
  
  popMatrix();
}
