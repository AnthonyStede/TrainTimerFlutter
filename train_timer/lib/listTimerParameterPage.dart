

import 'package:flutter/material.dart';
import 'package:train_timer/TimerParameterDatabase.dart';
import 'package:train_timer/timerParameter.dart';

class ListTimerParameterPage extends StatefulWidget {
  const ListTimerParameterPage({Key? key, required this.timerParameter}) : super(key : key);
  final TimerParameter timerParameter;
  @override
  State<StatefulWidget> createState() {
    return ListTimerParameterPageState();
  }
}

class ListTimerParameterPageState extends State<ListTimerParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des TimerParameters"),
      ),
      body: FutureBuilder<List<TimerParameter>>(
        future: TimerParameterDatabase.instance.timerParameters(),
        builder: (BuildContext context, AsyncSnapshot<List<TimerParameter>> snapshot) {
          if(snapshot.hasData) {
            List<TimerParameter>? timerParameters = snapshot.data;
            return ListView.builder(
              itemCount: timerParameters!.length,
              itemBuilder: (context, index) {
                final timerParameter = timerParameters[index];
                return TimerParameterItemWidget(timerParameter: timerParameter);
              },
            );
          }
          else {
            return Center(child: Text("no data"));
          }
        }
      ),
    );
  }
}


class TimerParameterItemWidget extends StatelessWidget {
  TimerParameterItemWidget({Key? key, required this.timerParameter}) : super(key: key);
  final TimerParameter timerParameter;

  final TextStyle textStyle = TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 60,
          maxWidth: double.infinity,
          maxHeight: 70,
        ),
        child: Card(
          margin: EdgeInsets.all(8),
          color: Colors.grey[300],
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Text(" exercice : " + timerParameter.secondsWork.toString(), style: textStyle),
              Text(" repos : " + timerParameter.secondsWait.toString(), style: textStyle),
              Text(" repetitions : " + timerParameter.nbreReps.toString(), style: textStyle)
            ],
          ),
        )
    );
  }
}