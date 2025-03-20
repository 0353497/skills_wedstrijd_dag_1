import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skills_dag_1/pages/rating.dart';

class OwnTimer extends StatefulWidget {
  final int id;
  final int minuten;
  const OwnTimer({super.key, required this.minuten, required this.id});

  @override
  State<OwnTimer> createState() => _OwnTimerState();
}

class _OwnTimerState extends State<OwnTimer> {
  late int seconds;
  final Stopwatch watch = Stopwatch();
  late double? progress = null;
  late Duration timeleft;
  late Timer timer;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeleft =  Duration(minutes: widget.minuten);
    seconds = (widget.minuten * 60);
    watch.start();
    if (watch.isRunning && mounted) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        progress = (watch.elapsed.inSeconds / seconds);
        setState(() {
          checkifHasElapsed(watch.elapsed.inSeconds);
        });
      });
    }

  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    timer.cancel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    watch.stop();
    timer.cancel();
  }
  

  checkifHasElapsed(int amountSeconds){
    if (seconds < amountSeconds){
      //timer has elapsed
      timer.cancel();
      watch.stop();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  Rating(id: widget.id,)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
    children:
    [
      SizedBox(
      width: 200,
      height: 200,
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 41, 170, 226),
        value:
        progress ?? 1,
        strokeWidth: 10,
      ),
    ),
   Positioned(
    top: 80,
    left: 70,
    child: Text("${(widget.minuten- watch.elapsed.inMinutes) -1}:${(60 -(widget.minuten * 60 % 60)) - (watch.elapsed.inSeconds % 60) }", 
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "BebasNeue",
      fontSize: 40
    ),
    )
    ),
      Positioned(
    top: 50,
    left: 60,
    child: Text("arriveert over")
    )
   ]
  );
  }
}