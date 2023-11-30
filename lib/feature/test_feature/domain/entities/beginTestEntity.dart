import 'package:equatable/equatable.dart';

class BeginTestEntity extends Equatable {
  BeginTestEntity({
    required this.question,
    required this.mid,
    required this.answer,
    required this.number,
    required this.testId,
    required this.count,
  });

  final String? question;
  final int? mid;
  final List<Answer> answer;
  final int? number;
  final int? testId;
  final String? count;

  factory BeginTestEntity.fromJson(Map<String, dynamic> json){
    return BeginTestEntity(
      question: json["question"],
      mid: json["mid"],
      answer: json["answer"] == null ? [] : List<Answer>.from(json["answer"]!.map((x) => Answer.fromJson(x))),
      number: json["number"],
      testId: json["test_id"],
      count: json["count"],
    );
  }

  @override
  List<Object?> get props => [
    question, mid, answer, number, testId, count, ];
}

class Answer extends Equatable {
  Answer({
    required this.id,
    required this.title,
    required this.description,
  });

  int? id;
  String? title;
    String? description;

  factory Answer.fromJson(Map<String, dynamic> json){
    return Answer(
      id: json["id"],
      title: json["title"],
      description: json["description"],
    );
  }

  @override
  List<Object?> get props => [
    id, title, description, ];
}
