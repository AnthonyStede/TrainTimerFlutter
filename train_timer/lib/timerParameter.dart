import 'package:flutter/material.dart';

class TimerParameter {
  int secondsWork;
  int secondsWait;
  int nbreReps;

  TimerParameter(this.secondsWork, this.secondsWait, this.nbreReps);

  Map<String, dynamic> toMap(){
    return {
      'secondsWork' : secondsWork,
      'secondsWait' : secondsWait,
      'nbreReps' : nbreReps
    };
  }

  factory TimerParameter.fromMap(Map<String, dynamic> map) => new TimerParameter(
      map['secondsWork'],
      map['secondsWait'],
      map['nbreReps']
  );
}