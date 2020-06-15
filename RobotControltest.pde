/*
Approach to send URScript commands to a UR-Robot 
 URScript Reference: http://www.me.umn.edu/courses/me5286/robotlab/Resources/scriptManual-3.5.4.pdf
 */

import processing.net.*;
import java.nio.*;

URobot robot;
float xVal = 0;
float yVal = -0.8; //the distance from the origin of the robot to the drawing surface
float zVal = 0;
float xBeg; //begin point
float yBeg; //begin point
PVector vel;
PVector mouse;
PVector robotPos;

void setup() {
  size(640, 480);
  robot = new URobot(this, "192.168.56.102");
  mouse = new PVector();
  vel = new PVector();
  
  xBeg = map(width/2, 0, width, -0.5, 0.5);
  yBeg = map(height/2, 0, height, 0.9, -0.3);
  robotPos = new PVector(xBeg, yBeg);
  robot.movej(new Pose(robotPos.x, yVal, robotPos.y, 0, 0, 0), 0.3);
  delay(5000);
}

void draw() {
  background(0);
  fill(150, 0, 0);
  circle(200, 40, 5);
  circle(100, 300, 5);
  circle(500, 400, 5);
  robot.test(); 
  mover();

  text("X = " + xVal, 10, 20);
  text("Y = " + yVal, 10, 40);
  text("Z = " + zVal, 10, 60);
}

boolean rotationMode = false;

Pose cPose;
Speed s;

void keyPressed() {
  if (key == 'h') {
    robot.moveHome();
  }
  if (key == 'r') {
    rotationMode = !rotationMode;
    cPose = robot.getCurrentPose();
  }
  if (key == 'w') {
    yVal -= 0.02;
  }
  if (key == 's') {
    yVal += 0.02;
  }
  if (key == 'a') {
    Pose a = new Pose(0.37, -0.8, 0.336, PI/2.0, 0, 0); //point to
    Pose b = new Pose(0, -0.6, 0.86, PI/2.0, 0, 0); //passing through
    robot.movec(b, a, 0.1);
  }
}


void mousePressed() {
  xVal = map (mouseX, 0, width, -0.5, 0.5);
  //yVal = map ((mouseY-mouseX), 0, 100, 0.3, -0.1); //extra
  zVal = map (mouseY, 0, height, 0.9, -0.3);
  mouse = new PVector(xVal, zVal);
  vel = PVector.sub(mouse, robotPos);
  vel.setMag(0.01);
}

void mover() {

  //float scale = 0.05;
  robotPos.add(vel);
    fill(200,0,0);
  circle (map(robotPos.x, -0.5, 0.5,0,width),map(robotPos.y,0.9, -0.3,0,height),20);
  float dist = PVector.dist(mouse, robotPos);
  print ("this is the dist",dist);
  if(dist < 0.1) {
    vel = new PVector();
  }
  
  robot.speedl(new Speed(vel.x, vel.y), 0.01);
}

void testFunction() {
 String msg = "this is only a test";
 println(msg);
}
