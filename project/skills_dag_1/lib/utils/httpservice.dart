import 'package:http/http.dart' as http;
import 'dart:convert';

class Httpservice {

  static Future<http.Response> sendPost(String key,String value) {
  return http.post(
    Uri.parse('https://mobileapp.canvasaccept.com/api/search-student'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{key: value}),
  );

  }

  static  Future<http.Response> GetRating(String studentid, String rating) {
  return http.post(
    Uri.parse('https://mobileapp.canvasaccept.com/api/rate-student'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "studentId": studentid,
      "rating": rating
    }),
  );

  }

  static  Future<http.Response> CallStudent(String studentid, String assingmentText) {
  return http.post(
    Uri.parse('https://mobileapp.canvasaccept.com/api/call-student'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "studentId": studentid,
      "assignmentText": assingmentText
    }),
  );

  }
}