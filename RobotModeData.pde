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
    int count = 5;
    packageSize = msg.getInt(count); count += Integer.BYTES;
    packageType = msg.get(count); count++;
    timeStamp = msg.getLong(count); count += Long.BYTES; 
    isRealRobotConnected = boolean(msg.get(count)); count++;
    isRealRobotEnabled = boolean(msg.get(count)); count++;
    isRobotPowerOn = boolean(msg.get(count)); count++;
    isEmergencyStopped = boolean(msg.get(count)); count++;
    isProtectiveStopped = boolean(msg.get(count)); count++;
    isProgramRunning = boolean(msg.get(count)); count++;
    isProgramPaused = boolean(msg.get(count)); count++;
    robotMode = RobotMode.get(msg.get(count)); count++;
    controlMode = ControlMode.get(msg.get(count)); count++;
    targetSpeedFraction = msg.getDouble(count); count += Double.BYTES;
    speedScaling = msg.getDouble(count); count += Double.BYTES;
    targetSpeedFractionLimit = msg.getDouble(count); count += Double.BYTES;
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
