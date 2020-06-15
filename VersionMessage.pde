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
    int count = 0;
    messageSize = msg.getInt(count); count += Integer.BYTES;
    messageType = MessageType.get(msg.get(count)); count ++;
    timeStamp = msg.getLong(count); count += Long.BYTES;
    source = MessageSource.get(msg.get(count)); count++;
    robotMessageType = msg.get(count); count ++;
    projectNameSize = msg.get(count); count ++;
    projectName = ""; 
    for (int i = 0; i < projectNameSize; i++, count++) {
      projectName += (char)msg.get(count);
    }
    majorVersion = msg.get(count); count ++;
    minorVersion = msg.get(count); count ++;
    bugFixVersion = msg.getInt(count); count += Integer.BYTES;   
    buildNumber = msg.getInt(count); count += Integer.BYTES;
    buildDate = "";
    for (int i = 0, j = messageSize - count; i < j; i++, count++) {
      buildDate += (char)msg.get(count);
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
