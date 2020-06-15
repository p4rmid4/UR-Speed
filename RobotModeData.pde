class RobotModeData {
 ByteBuffer msg;
 int packageSize;
 int packageType;
 long timeStamp;
 boolean isRealRobotConnected;
 boolean isRealRobotEnabled;
 boolean isRobotPowerOn;
 boolean isEmergencyStopped;
 boolean isProtectiveStopped;
 boolean isProgramRunning;
 boolean isProgramPaused;
 RobotMode robotMode;
 ControlMode controlMode;
 double targetSpeedFraction;
 double speedScaling;
 double targetSpeedFractionLimit;
  
  RobotModeData(ByteBuffer message) {
    msg = message;    
    packageSize = msg.getInt();
    packageType = msg.get();
    timeStamp = msg.getLong(); 
    isRealRobotConnected = boolean(msg.get());
    isRealRobotEnabled = boolean(msg.get());
    isRobotPowerOn = boolean(msg.get());
    isEmergencyStopped = boolean(msg.get());
    isProtectiveStopped = boolean(msg.get());
    isProgramRunning = boolean(msg.get());
    isProgramPaused = boolean(msg.get());
    robotMode = RobotMode.get(msg.get());
    controlMode = ControlMode.get(msg.get());
    targetSpeedFraction = msg.getDouble();
    speedScaling = msg.getDouble();
    targetSpeedFractionLimit = msg.getDouble();
  }
  
  void printRobotData() {
    println("---- ROBOT MODE DATA ----");
    println("Package Size: " + packageSize);
    println("Package Type: " + packageType);
    println("timeStamp: " + timeStamp);
    println("isRealRobotConnected: " + isRealRobotConnected);
    println("isRealRobotEnabled: " + isRealRobotEnabled);
    println("isRobotPowerOn: " + isRobotPowerOn);
    println("isEmergencyStopped: " + isEmergencyStopped);
    println("isProtectiveStopped: " + isProtectiveStopped);
    println("isProgramRunning: " + isProgramRunning);
    println("isProgramPaused: " + isProgramPaused);
    println("robotMode: " + robotMode);
    println("controlMode: " + controlMode);
    println("targetSpeedFraction: " + targetSpeedFraction);
    println("speedScaling: " + speedScaling);
    println("targetSpeedFractionLimit: " + targetSpeedFractionLimit);
    println();
  }
}
