class URobot {
  Client client;
  String robotIP;
  int robotPort;
  JointPose homePosition;
  Pose currentPose;
  ByteBuffer msg;
  VersionMessage versionMessage;
  RobotModeData  robotModeData;

  URobot(PApplet parent, String _robotIP) {
    robotIP = _robotIP;
    robotPort = 30002;

    client = new Client(parent, robotIP, robotPort);
    homePosition = new JointPose(0, -PI/2, 0, -PI/2, 0, 0);
    msg = ByteBuffer.allocate(679);
    set_tcp(new Pose(0, 0, 0.135, 0, 0, 0));
    //currentPose = client.available() > 0? getCurrentPose() : new Pose();
  }
  
  public void moveHome() {
    client.write("movej(" + homePosition.toString() + ")\n");
  }
  
  public void movec(Pose p1, Pose p2, float speed) {
    client.write("movec(" + p1.toString() + ", " + p2.toString() + ", v=" + speed + ")\n");
  }

  public void movej(Pose p, float speed) {
    client.write("movej(" + p.toString() + ", v=" + speed + ")\n");
  }

  public void movej(JointPose p, float speed) {
    client.write("movej(" + p.pose + ", v=" + speed + ")\n");
  }
    public void speedl(Speed s, float acc) {
    client.write("speedl(" + s.toString() + ", a=" + acc + ")\n");
  }
 

  public void movel(Pose p) {
    client.write("safetyCheck = is_within_safety_limits(" + p.toString() + ")\n");
    client.write("if safetyCheck:\n");    
    client.write("    movel(" + p.toString() + ")\n");
    client.write("else:\n");
    
  }

  public void movel(JointPose p, float speed) {
    client.write("movel(" + p.pose + ", v=" + speed +")\n");
  }
  public void movel(Pose p, float speed) {
    client.write("movej(" + p.toString() + ", v=" + speed + ")\n");
  }

  public void movep(Pose p, float speed) {
    client.write("movep(" + p.toString() + ", v=" + speed + ")\n");
  }

  public void movep(JointPose p, float speed) {
    client.write("movep(" + p.pose + ", v=" + speed + ")\n");
  }

  public void set_tcp(Pose p) {
    client.write("set_tcp(" + p.toString() + ")\n");
  }

  public Pose getCurrentPose() {    
    int offset = 408;
    float x = (float)msg.getDouble(offset); offset += Double.BYTES;
    float y = (float)msg.getDouble(offset); offset += Double.BYTES;
    float z = (float)msg.getDouble(offset); offset += Double.BYTES;
    float rx = (float)msg.getDouble(offset); offset += Double.BYTES;
    float ry = (float)msg.getDouble(offset); offset += Double.BYTES;
    float rz = (float)msg.getDouble(offset); offset += Double.BYTES;

    Pose p = new Pose(x, y, z, rx, ry, rz);
    currentPose = p;
       
    return currentPose;
  }

  int packageCount = 0;
  public void test() {
    if (client.available() > 0) {
      //println(client.readBytes().length, count);
      switch(packageCount) {
      case 0:
        updateBuffer();
        getVersionMessage();
        break;
      case 2:
        updateBuffer();
        getLoopMessage();
        packageCount = 1;
        break;
      default:
        break;
      }
      packageCount++;
    }
  }

  public void getVersionMessage() {     
    versionMessage = new VersionMessage(msg);
    versionMessage.printVersionInfo();
  }

  public void getLoopMessage() { 
    robotModeData = new RobotModeData(msg);
    //robotModeData.printRobotData();
    
    
    println("---- ROBOT DATA ----");
    getCurrentPose();
    
    println("//// SUB_PACKAGE");        
    println("X: " + currentPose.x);
    println("Y: " + currentPose.y);
    println("Z: " + currentPose.z);
    println("RX: " + currentPose.rx);
    println("RY: " + currentPose.ry);
    println("RZ: " + currentPose.rz); 
    //updateBuffer();
    
     /* int count = 5; 
     while (count < 679) {      
         int packageSize = msg.getInt(count); count += Integer.BYTES;
         int packageType = msg.get(count); count ++;          
         count += packageSize - Integer.BYTES - 1; 
         
         if(packageType == 4) println(count);
         println("---- DATA ----");
         println("Package Size: " + packageSize);
         println("Package Type: " + packageType);
     }*/
  }
  
  void updateBuffer() {
   if(client.available() > 0) {
     msg = ByteBuffer.allocate(679);      
     msg.put(client.readBytes(679));   
   }
  }
}
