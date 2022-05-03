import 'dart:async';
import 'package:flutter/material.dart';
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
      home: MyHomePage(title: 'Timer', timerParameter: TimerParameter(0,0,0)),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.timerParameter}) : super(key: key);
  final String title;
  TimerParameter timerParameter;

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
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "temps d'exercice",
                      labelText: "temps d'exercice",
                    ),
                    onChanged: (value) {
                      timerParameter.secondsWork = value as int;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "temps de repos",
                      labelText: "temps de repos",
                    ),
                    onChanged: (value) {
                      timerParameter.secondsWait = value as int;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "nombres de répétitions",
                      labelText: "nombres de répétitions",
                    ),
                    onChanged: (value) {
                      timerParameter.nbreReps = value as int;
                    },
                  ),
                  TextButton(
                    child: const Text("GO !"),
                    onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const TimerPage(title: 'Timer')))

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

