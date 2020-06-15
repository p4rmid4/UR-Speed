/*
Approach to send URScript commands to a UR-Robot 
 URScript Reference: http://www.me.umn.edu/courses/me5286/robotlab/Resources/scriptManual-3.5.4.pdf
 */

import processing.net.*;
import java.nio.*;

URobot robot;

void setup() {
  size(640, 480);
  robot = new URobot(this, "192.168.0.53"); //192.168.56.102 <--- this is the old IP  
  robot.moveHome();
  delay(3000);
}

void draw() {
  background(0);
  robot.test();
}



void keyPressed() {
  if (key == 'h') {
    robot.moveHome();
  }
  
}


void mousePressed() {
  
}
