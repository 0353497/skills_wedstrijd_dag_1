import 'package:flutter/material.dart';
import 'package:skills_dag_1/components/timer.dart';
import 'package:skills_dag_1/pages/rating.dart';

class ArrivalPage extends StatefulWidget {
  final String msg;
  final int minuten;
  final int id;
  const ArrivalPage({super.key, required this.msg, required this.minuten, required this.id});

  @override
  State<ArrivalPage> createState() => _ArrivalPageState();
}

class _ArrivalPageState extends State<ArrivalPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 170, 226),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Assistentie"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.check),
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 41, 170, 226),)
                  ),
                  label: Text("Oproep geaccepteerd")
                  ),
                  Card(
                    elevation: 8,
                    color: Colors.white,
                    shadowColor: Color.fromARGB(49, 41, 170, 226),
                    child: Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Text('"${widget.msg}"'),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                OwnTimer(minuten: widget.minuten, id: widget.id,),
                // ElevatedButton(onPressed: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  Rating(id: widget.id,)));
                // }, child: Text("skip"))
              ],
            ),
            //so it looks nice
            Row(),
          ],
        ),
      ),
    );
  }
}