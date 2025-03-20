import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skills_dag_1/models/student.dart';
import 'package:skills_dag_1/pages/overview.dart';
import 'package:skills_dag_1/utils/bloc.dart';
import 'package:skills_dag_1/utils/httpservice.dart';

class Rating extends StatefulWidget {
  const Rating({super.key, required this.id});
  final int id;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  Student student = Bloc().getValueToBeSet;

  _stuurRating(int rating) async{
    final Response response =  await Httpservice.GetRating(widget.id.toString(), rating.toString());
    print(response.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 41, 170, 226),
        centerTitle: true,
        title: Text("Assistentie",
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
              ],
            ),
            Column(
              spacing: 20,
              children: [
                Text("BEOORDEEL DE STUDENT"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: (){
                        _stuurRating(1);
                      }, icon: Icon(Icons.star,
                      color: Color.fromARGB(255, 251, 241, 136),
                      size: 50,
                      ),
                    ),
                      IconButton(
                      onPressed: (){
                        _stuurRating(2);
                      }, icon: Icon(Icons.star,
                      color: Color.fromARGB(255, 251, 241, 136),
                      size: 50,
                      ),
                    ),
                      IconButton(
                      onPressed: (){
                        _stuurRating(3);
                      }, icon: Icon(Icons.star,
                      color: Color.fromARGB(255, 251, 241, 136),
                      size: 50,
                      ),
                    ),
                      IconButton(
                      onPressed: (){
                        _stuurRating(4);
                      }, icon: Icon(Icons.star,
                      color: Color.fromARGB(255, 251, 241, 136),
                      size: 50,
                      ),
                    ),
                      IconButton(
                      onPressed: (){
                        _stuurRating(5);
                      }, icon: Icon(Icons.star,
                      color: Color.fromARGB(255, 251, 241, 136),
                      size: 50,
                      ),
                    ),
                  ],
                )
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
                    "Verstuur beoordeling",
                    style: TextStyle(
                      fontFamily: "Frutiger",
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}