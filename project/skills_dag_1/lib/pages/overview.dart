import 'package:flutter/material.dart';
import 'package:skills_dag_1/components/dropdown.dart';
import 'package:skills_dag_1/pages/chosen_student.dart';
import 'package:skills_dag_1/utils/bloc.dart';
import 'package:skills_dag_1/utils/httpservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool hasSetDropdown = Bloc().getHasSetDropdown;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 170, 226),
        foregroundColor: Colors.white,
        title: Text("Overzicht"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Expanded(
        child: Image.asset(
          height: double.infinity,
          "assets/plattegronden/stf25-plattegrond.png",
          fit: BoxFit.cover,
        ),
      ),
      bottomSheet:  BottomSheet(onClosing: () {}, builder: (context) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("KIES STAND",
                  style: TextStyle(
                    color: Color.fromARGB(255, 41, 170, 226),
                  ),
                ),
                OwnDropdown(),
                SizedBox(
                width: double.infinity,
                child: (true) ? ElevatedButton(
                  onPressed: () async{
                    final response =  await Httpservice.sendPost("competitionNumber", "4.5");
                    print(response.body);
                    final data = response.body;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChosenStudent(student: data,)));
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
                    "Zoek een student",
                    style: TextStyle(
                      fontFamily: "Frutiger",
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ): SizedBox()
                  
                )
              ],
            ),
          ),
          );
      }),
    );
  }
}