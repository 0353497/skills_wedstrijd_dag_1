import 'package:flutter/material.dart';
import 'package:skills_dag_1/components/dropdown.dart';
import 'package:skills_dag_1/pages/overview.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 40,
            children: [
              Center(
                child: Image.asset("assets/PNG/SH_logo_L.png",
                width: 250,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    "Aanmelden",
                    style: TextStyle(
                      fontFamily: "BebasNeue",
                      fontSize: 45
                    ),
                  ),
                  Text("meld je aan om studenten te kunnen oproepen voor assistentie bij jouw vakwedstrijd",
                  style: TextStyle(
                    fontFamily: "Frutiger"
                  ),
                  )
                ],
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NAAM",
                    style: TextStyle(
                      color: Color.fromARGB(255, 41, 170, 226),
                    ),
                  ),
                  TextField(
                    decoration: inputdecfield(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text("VAKWEDSTRIJD",
                    style: TextStyle(
                      color: Color.fromARGB(255, 41, 170, 226),
                    ),
                  ),
                  OwnDropdown()
                ],
              ),
             
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
                    "Aanmelden",
                    style: TextStyle(
                      fontFamily: "Frutiger",
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
  InputDecoration inputdecfield() {
    return InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 41, 170, 226),
                        style: BorderStyle.solid
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 41, 170, 226),
                        style: BorderStyle.solid
                      ),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 41, 170, 226),
                        style: BorderStyle.solid
                      ),
                    ),
                  );

}