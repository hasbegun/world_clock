class TimeArguments {
  String location;
  String flag;
  String time;
  bool isDayTime;

  TimeArguments({required this.location, required this.flag,
    required this.time, required this.isDayTime});

  void setLocation(location) {
    this.location = location;
  }
  void setFlag(flag) {
    this.flag = flag;
  }
  void setTime(time) {
    this.time = time;
  }
  void setIsDayTime(isDayTime) {
    this.isDayTime = isDayTime;
  }

}
