import 'dart:async';
import 'package:flutter/material.dart';



class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static const maxSecondsWork = 60;
  static const maxSecondsWait = 10;
  static const maxRep = 2;
  String task = "START";
  Color bgColor = Colors.lightBlueAccent;
  Color textColor = Colors.blue;
  bool onStart = true;
  int rep = maxRep;
  int secondsWork = maxSecondsWork;
  int secondsWait = maxSecondsWait;
  int seconds = 5;
  int state = 0;
  int circularSeconds = 5;
  Timer? timer;
  void startTimer(){
    final timerDone = seconds == 0;
    timer = Timer.periodic(Duration(seconds : 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      }
      else{
        if(rep > 0){
          if(state == 0){
            state = 1;
            seconds = maxSecondsWork;
            circularSeconds = maxSecondsWork;
            setState(() {
              task = "WORK";
              textColor = Colors.green;
              bgColor = Colors.lightGreen;
            });
          }
          else if(state == 1){
            state = 2;
            seconds = maxSecondsWait;
            circularSeconds = maxSecondsWait;
            setState(() {
              task = "REST";
              textColor = Colors.pink;
              bgColor = Colors.pinkAccent;
              rep--;
            });
          }
          else{
            state = 1;
            seconds = maxSecondsWork;
            circularSeconds = maxSecondsWork;
            setState(() {
              task = "WORK";
              textColor = Colors.green;
              bgColor = Colors.lightGreen;
            });
          }
        }
        else{
          //goBackToMenu
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(

        child: ListView(
          children: [
            Center(child: buildText()),
            Center(child: buildTimer()),
            Center(child: buildTextRep()),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
  Widget buildTimer() => SizedBox(
    width: 200,
    height: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: seconds/circularSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 12,
          backgroundColor: Colors.greenAccent,
        ),
        Center(child: buildTime()),
      ],
    ),
  );
  Widget buildTime() {
    return Text(
        '$seconds',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 80,
        )
    );
  }
  Widget buildText() {
    return Text(
        task + "\n",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: 100,
        )
    );
  }
  Widget buildTextRep() {
    return Text(
        "\n REPS : " + '$rep',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 60,
        )
    );
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
}