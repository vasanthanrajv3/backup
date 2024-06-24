class MessageModel {
  String model;
  String kind;
  DateTime createdAt;
  String response;
  bool done;

  MessageModel({
    required this.model,
    required this.kind,
    required this.createdAt,
    required this.response,
    required this.done,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    model: json["model"],
    kind: json["kind"],
    createdAt: DateTime.parse(json["created_at"]),
    response: json["response"],
    done: json["done"],
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "kind": kind,
    "created_at": createdAt.toIso8601String(),
    "response": response,
    "done": done,
  };
}