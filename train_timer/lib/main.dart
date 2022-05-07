import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:train_timer/TimerParameterDatabase.dart';
import 'package:train_timer/timerPage.dart';
import 'package:train_timer/timerParameter.dart';

import 'listTimerParameterPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Timer', timerParameter: TimerParameter(45, 50, 4)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.timerParameter}) : super(key: key);
  TimerParameter timerParameter;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  get nbreReps => widget.timerParameter.nbreReps;

  get secondsWork => widget.timerParameter.secondsWork;

  get secondsWait => widget.timerParameter.secondsWait;

  int _incrementTime(int time) {
    setState(() {
      time++;
    });
    return time;
  }

  int _decrementTime(int time) {
    setState(() {
      if (time > 0) {
        time--;
      }
    });
    return time;
  }
  final TextStyle textStyle = TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
  );

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.black87,
    minimumSize: Size(20, 20),
    padding: EdgeInsets.symmetric(horizontal: 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),);


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.title),
        ),
        body: Form(
            child: Scrollbar(
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 35),
                  child: LayoutBuilder(
                    builder: (_, constraints) =>
                        Container(
                          width: constraints
                              .widthConstraints()
                              .maxWidth,
                          height: constraints
                              .heightConstraints()
                              .maxHeight,
                          child: Column(

                            children: [
                              ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: double.infinity,
                                    minHeight: 325,
                                    maxWidth: double.infinity,
                                    maxHeight: 330,
                                  ),
                                  child: Card(
                                    color: Colors.grey[300],
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Container(
                                      // color: Colors.grey[300],
                                      child: Column(
                                        children: [
                                          Align(

                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 15, 0, 5),
                                              child: Text(
                                                "Démarage",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Répétitions",
                                            style: textStyle,
                                          ),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                ElevatedButton(
                                                  style: raisedButtonStyle,
                                                  onPressed: () {widget.timerParameter.nbreReps = _decrementTime(widget.timerParameter.nbreReps);},
                                                  child: Icon(Icons.remove,
                                                      color: Colors.white),),
                                                SizedBox(width: 20,),
                                                Text(
                                                  " "+ '$nbreReps' +" ",
                                                  style: textStyle,
                                                ),
                                                SizedBox(width: 20,),
                                                ElevatedButton(
                                                  style: raisedButtonStyle,
                                                  onPressed: () {widget.timerParameter.nbreReps = _incrementTime(widget.timerParameter.nbreReps);},
                                                  child: Icon(Icons.add,
                                                      color: Colors.white),),
                                              ]
                                          ),
                                          Text(
                                            "Travaille",
                                            style: textStyle,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              ElevatedButton(
                                                style: raisedButtonStyle,
                                                onPressed: () {widget.timerParameter.secondsWork = _decrementTime(widget.timerParameter.secondsWork);},
                                                child: Icon(Icons.remove,
                                                    color: Colors.white),),
                                              SizedBox(width: 20,),
                                              Text(
                                                '$secondsWork',
                                                style: textStyle,
                                              ),
                                              SizedBox(width: 20,),
                                              ElevatedButton(
                                                style: raisedButtonStyle,
                                                onPressed: () {widget.timerParameter.secondsWork = _incrementTime(widget.timerParameter.secondsWork);},
                                                child: Icon(Icons.add,
                                                    color: Colors.white),),
                                            ],

                                          ),
                                          Text(
                                            "Repos",
                                            style: textStyle,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              ElevatedButton(
                                                style: raisedButtonStyle,
                                                onPressed: () {widget.timerParameter.secondsWait = _decrementTime(widget.timerParameter.secondsWait);},
                                                child: Icon(Icons.remove,
                                                    color: Colors.white),),
                                              SizedBox(width: 20,),
                                              Text(
                                                '$secondsWait',
                                                style: textStyle,

                                              ),
                                              SizedBox(width: 20,),
                                              ElevatedButton(
                                                style: raisedButtonStyle,
                                                onPressed: () {widget.timerParameter.secondsWait = _incrementTime(widget.timerParameter.secondsWait);},
                                                child: Icon(Icons.add,
                                                    color: Colors.white),),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              ElevatedButton.icon(
                                                onPressed: () =>
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            TimerPage(title: 'Timer',rep:nbreReps,secondsWait:secondsWait ,secondsWork:secondsWork,))),
                                                icon: Icon( // <-- Icon
                                                  Icons.timelapse,
                                                  size: 20.0,
                                                ),
                                                label: Text('Start'), // <-- Text
                                                style: ElevatedButton.styleFrom(
                                                  //onPrimary: Colors.black87,
                                                  primary: Colors.amber,
                                                ),

                                              ),
                                              ElevatedButton.icon(
                                                onPressed: () {
                                                  TimerParameterDatabase.instance.insertTimerParameter(widget.timerParameter);
                                                },
                                                icon: Icon( // <-- Icon
                                                  Icons.save,
                                                  size: 20.0,
                                                ),
                                                label: Text('Save'), // <-- Text
                                                style: ElevatedButton.styleFrom(
                                                  //onPrimary: Colors.black87,
                                                  primary: Colors.amber,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) =>
                                                          ListTimerParameterPage(timerParameter: widget.timerParameter)));
                                                },
                                                child: Text("voir BDD"),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                  )
              ),
            )
        )
    );

  }
}

