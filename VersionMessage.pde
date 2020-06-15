class VersionMessage {
  ByteBuffer msg;
  int messageSize;
  MessageType messageType;
  long timeStamp;
  MessageSource source;
  int robotMessageType;
  int projectNameSize;
  String projectName;     
  int majorVersion;
  int minorVersion;
  int bugFixVersion;
  int buildNumber;
  String buildDate;

  VersionMessage(ByteBuffer message) { 
    msg = message;    
    messageSize = msg.getInt();
    messageType = MessageType.get(msg.get());
    timeStamp = msg.getLong(); 
    source = MessageSource.get(msg.get()); 
    robotMessageType = msg.get(); 
    projectNameSize = msg.get(); 
    projectName = ""; 
    for (int i = 0; i < projectNameSize; i++) {
      projectName += (char)msg.get();
    }
    majorVersion = msg.get(); 
    minorVersion = msg.get();
    bugFixVersion = msg.getInt();
    buildNumber = msg.getInt();
    buildDate = "";     
    for (int i = msg.position(); i < messageSize; i++) {
      buildDate += (char)msg.get();
    }
  }
  
  void printVersionInfo() {
    println("---- VERSION MESSAGE ----");
    println("Message Size: " + messageSize);
    println("Message Type: " + messageType);
    println("timeStamp: " + timeStamp);
    println("source: " + source);
    println("robotMessageType: " + robotMessageType);
    println("projectNameSize: " + projectNameSize);
    println("projectName: " + projectName);
    println("majorVersion: " + majorVersion);
    println("minorVersion: " + minorVersion);
    println("bugFixVersion: " + bugFixVersion);
    println("buildNumber: " + buildNumber);
    println("buildDate: " + buildDate);
    println();
  }
}
