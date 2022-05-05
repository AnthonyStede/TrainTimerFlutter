import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:train_timer/timerPage.dart';
import 'package:train_timer/timerParameter.dart';


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
      home: MyHomePage(title: 'Timer', timerParameter: TimerParameter("0","0","0")),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.timerParameter}) : super(key: key);
  final String title;
  TimerParameter timerParameter;
  get nbreReps => timerParameter.nbreReps;
  get secondsWork => timerParameter.secondsWork;
  get secondsWait => timerParameter.secondsWait;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Work Time",
                      labelText: "Work Time",
                    ),
                      onChanged: (value) {
                      timerParameter.secondsWork = value as String;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Rest Time",
                      labelText: "Rest Time",
                    ),
                    onChanged: (value) {
                      timerParameter.secondsWait = value as String;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "number of repetitions",
                      labelText: "number of repetitions",
                    ),
                    onChanged: (value) {
                      timerParameter.nbreReps = value as String;
                    },
                  ),
                  TextButton(

                    child: const Text("GO !"),
                    onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                          TimerPage(title: 'Timer',rep:nbreReps,secondsWait:secondsWait ,secondsWork:secondsWork,)))
                  )
                ]
              ]
            )
          )
        )
      )
    );

  }
}

