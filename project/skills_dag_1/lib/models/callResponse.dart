class Callresponse {
  final bool Status;
  final String msg;
  final int minutes;
  Callresponse(this.Status, this.msg, this.minutes);



  static Callresponse FromJson(Map<String, dynamic> json){ 
    return Callresponse(json["succes"] ?? false, json["answerText"] ?? "er is iets fout gegaan", json["minutes"] ?? 0);
  }
}