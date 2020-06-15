enum ControlMode {
  POSITION(0), 
    TEACH(1), 
    FORCE(2), 
    TORQUE(3),
    UNDEFINED(4);

  private int mode;

  private ControlMode(int _mode) {
    mode = _mode;
  } 

  public int getValue() {
    return mode;
  }
  
  static public ControlMode get(int i) {
    switch(i) {
     case 0:
       return POSITION;
     case 1:
       return TEACH;
     case 2:
       return FORCE;
     case 3:
       return TORQUE;    
     default:
       return UNDEFINED;
    }
  }
}

enum RobotMode {
  NO_CONTROLLER(-1), 
    DISCONNECTED(0), 
    CONFIRM_SAFETY(1), 
    BOOTING(2), 
    POWER_OFF(3), 
    POWER_ON(4), 
    IDLE(5), 
    BACKDRIVE(6), 
    RUNNING(7), 
    UPDATING_FIRMWARE(8);

  private int mode;

  private RobotMode(int _mode) {
    mode = _mode;
  } 

  public int getValue() {
    return mode;
  }
  
  static public RobotMode get(int i) {
    switch(i) {
     case -1:
       return NO_CONTROLLER;
     case 0:
       return DISCONNECTED;
     case 1:
       return CONFIRM_SAFETY;
     case 2:
       return BOOTING;
     case 3:
       return POWER_OFF;
     case 4:
       return POWER_ON;
     case 5:
       return IDLE;
     case 7:
       return RUNNING;
     case 8:
       return UPDATING_FIRMWARE;
     default:
     return NO_CONTROLLER;
    }
  }
}

enum JointMode {
  RESET(235), 
    SHUTTING_DOWN(236), 
    PART_D_CALIBRATION(237), 
    BACKDRIVE(238), 
    POWER_OFF(239), 
    NOT_RESPONDING(245), 
    MOTOR_INITIALISATION(246), 
    BOOTING(247), 
    PART_D_CALIBRATION_ERROR(248), 
    BOOTLOADER(249), 
    CALIBRATION(250), 
    VIOLATION(251), 
    FAULT(252), 
    RUNNING(253), 
    IDLE(255);

  private int mode;

  private JointMode(int _mode) {
    mode = _mode;
  } 

  public int getValue() {
    return mode;
  }
}

enum MessageSource {
  UNDEFINED(-1), 
    JOINT_0(0), 
    JOINT_1(1), 
    JOINT_2(2), 
    JOINT_3(3), 
    JOINT_4(4), 
    JOINT_5(5), 
    TOOL(6), 
    EUROMAP_2(68), 
    EUROMAP_1(67), 
    TEACH_PENDANT_2(66), 
    TEACH_PENDANT_1(65), 
    SAFETY_PROCESSOR_UA(20), 
    SAFETY_PROCESSOR_UB(30), 
    ROBOTINTERFACE(-2), 
    RTMACHINE(-3), 
    SIMULATED_ROBOT(-4), 
    GUI(-5), 
    CONTROLLER(7), 
    RTDE(8);

  private int val;

  private MessageSource(int _val) {
    val = _val;
  } 

  public int getValue() {
    return val;
  }
  
  static public MessageSource get(int i) {
    switch(i){
     case -1:
     return UNDEFINED;
     case 0:
     return JOINT_0;
     case 1:
     return JOINT_1;
     case 2:
     return JOINT_2;
     case 3:
     return JOINT_3;
     case 4:
     return JOINT_4;
     case 5:
     return JOINT_5;
     case 6:
     return TOOL;
     case 68:
     return EUROMAP_2;
     case 67:
     return EUROMAP_1;
     case 66:
     return TEACH_PENDANT_2;
     case 65:
     return TEACH_PENDANT_1;
     case 20:
     return SAFETY_PROCESSOR_UA;
     case 30:
     return SAFETY_PROCESSOR_UB;
     case -2:
     return ROBOTINTERFACE;
     case -3:
     return RTMACHINE;
     case -4:
     return SIMULATED_ROBOT;
     case -5:
     return GUI;
     case 7:
     return CONTROLLER;
     case 8:
     return RTDE;
     default:
     return UNDEFINED;
    }
  }
}

enum MessageType {
  DISCONNECT(-1), 
    ROBOT_STATE(16), 
    ROBOT_MESSAGE(20), 
    HMC_MESSAGE(22), 
    MODBUS_INFO_MESSAGE(5), 
    SAFETY_SETUP_BROADCAST_MESSAGE(23), 
    SAFETY_COMPLIANCE_TOLERANCES_MESSAGE(24), 
    PROGRAM_STATE_MESSAGE(25);

  private int val;

  private MessageType(int _val) {
    val = _val;
  } 

  public int getValue() {
    return val;
  }
  
  static public MessageType get(int i) {
    switch(i){
     case -1:
     return DISCONNECT;
     case 16:
     return ROBOT_STATE;
     case 20:
     return ROBOT_MESSAGE;
     case 22:
     return HMC_MESSAGE;
     case 5:
     return MODBUS_INFO_MESSAGE;
     case 23:
     return SAFETY_SETUP_BROADCAST_MESSAGE;
     case 24:
     return SAFETY_COMPLIANCE_TOLERANCES_MESSAGE;
     case 25:
     return PROGRAM_STATE_MESSAGE;
     default:
     return DISCONNECT;
    }
  }
}
