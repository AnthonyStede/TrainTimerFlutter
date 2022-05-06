import 'dart:async';
import 'package:flutter/material.dart';
import 'package:train_timer/timerParameter.dart';



class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title,required this.rep,required this.secondsWait,required this.secondsWork}) : super(key: key);
  final String title;
  final int rep;
  final int secondsWork;
  final int secondsWait;
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  String task = "START";
  Color bgColor = Colors.lightBlueAccent;
  Color textColor = Colors.blue;
  bool onStart = true;
  int seconds = 5;
  int state = 0;
  int circularSeconds = 5;
  Timer? timer;
  int showRep =0;

  void startTimer(int rep,int secondsWork,int secondsWait){
    final timerDone = seconds == 0;
    showRep = rep;
    timer = Timer.periodic(Duration(seconds : 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      }
      else{
        if(rep > 0){
          if(state == 0){
            state = 1;
            seconds = secondsWork;
            circularSeconds = secondsWork;
            setState(() {
              task = "WORK";
              textColor = Colors.green;
              bgColor = Colors.lightGreen;
            });
          }
          else if(state == 1){
            state = 2;
            seconds = secondsWait;
            circularSeconds = secondsWait;
            setState(() {
              task = "REST";
              textColor = Colors.pink;
              bgColor = Colors.pinkAccent;
              rep--;
              showRep--;
            });
          }
          else{
            state = 1;
            seconds = secondsWork;
            circularSeconds = secondsWork;
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
      appBar: AppBar(
        title: Text("Compteur"),
        leading: BackButton(),
      ),
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
        "\n REPS : " + '$showRep',
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
    var rep= widget.rep; // int.parse(widget.rep);
    var secondsWork= widget.secondsWork; // int.parse(widget.secondsWork);
    var secondsWait= widget.secondsWait; // int.parse(widget.secondsWait);
    startTimer(rep,secondsWork,secondsWait);
  }
}
