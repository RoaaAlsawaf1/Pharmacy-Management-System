import 'dart:convert';

Chatmodel chatmodelFromJson(String str) => Chatmodel.fromJson(json.decode(str));

String chatmodelToJson(Chatmodel data) => json.encode(data.toJson());

class Chatmodel {
  List<Message> messages;
//AIzaSyDFjYdCkIs4Ceyky8escyQDbHglkEyYScQ
  Chatmodel({
    required this.messages,
  });

  factory Chatmodel.fromJson(Map<String, dynamic> json) => Chatmodel(
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  int id;
  int from;
  int to;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  Message({
    required this.id,
    required this.from,
    required this.to,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    from: json["from"],
    to: json["to"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
