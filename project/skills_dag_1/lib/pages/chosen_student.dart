import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skills_dag_1/models/callResponse.dart';
import 'package:skills_dag_1/models/student.dart';
import 'package:skills_dag_1/pages/arrival.dart';
import 'package:skills_dag_1/pages/sign_in.dart';
import 'package:skills_dag_1/utils/bloc.dart';
import 'package:skills_dag_1/utils/httpservice.dart';

class ChosenStudent extends StatefulWidget {
  final String student;
  const ChosenStudent({super.key, required this.student});

  @override
  State<ChosenStudent> createState() => _ChosenStudentState();
}

class _ChosenStudentState extends State<ChosenStudent> {
  final Bloc bloc = Bloc();
  late Student student;
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = Student.FromJson(jsonDecode(widget.student));
    bloc.setValue(student);
  }

  final image = Image.asset("Color.fromARGB(255, 41, 170, 226)");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 170, 226),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Assistentie"),
      ),
      body: (!isLoading)? Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 100,
              foregroundImage: ExactAssetImage("assets/Studenten/daan_willems.jpeg"),
            ),
            Text(student.name, 
            style: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 45
            ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 41, 170, 226)),
              ),
              onPressed: () {}, 
              child: Text("${student.minuten} minuten lopen"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("OPDRACHT",
                style: TextStyle(
                  color: Color.fromARGB(255, 41, 170, 226)
                ),
                ),
                SizedBox(
                  height: 250,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    decoration: inputdecfield(),
                  ),
                )
              ],
            ),
             SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.value.text.isEmpty) {
                      return;
                    }
                    showLoading();
                    final Response response = await Httpservice.CallStudent(student.id.toString(), controller.value.text);
                    print(response.body);
                    final data = jsonDecode(response.body);
                    final call = Callresponse.FromJson(data);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ArrivalPage(minuten: call.minutes, msg: "message ${call.msg}", id: student.id,)));
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(24)),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 41, 170, 226)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    ))
                  ),
                  child: Text(
                    "Roep Student op",
                    style: TextStyle(
                      fontFamily: "Frutiger",
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                )
          ],
        ),
      ): Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  void showLoading() {
    return setState(() {
                    isLoading = true;
                  });
  }
}