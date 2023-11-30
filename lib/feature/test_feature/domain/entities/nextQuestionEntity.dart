import 'package:equatable/equatable.dart';

class NextQuestionEntity extends Equatable {
  NextQuestionEntity({
    required this.question,
    required this.mid,
    required this.answer,
    required this.number,
    required this.progressing,
  });

  final String? question;
  final int? mid;
  final List<Answer> answer;
  final int? number;
  final int? progressing;

  factory NextQuestionEntity.fromJson(Map<String, dynamic> json){
    return NextQuestionEntity(
      question: json["question"],
      mid: json["mid"],
      answer: json["answer"] == null ? [] : List<Answer>.from(json["answer"]!.map((x) => Answer.fromJson(x))),
      number: json["number"],
      progressing: json["progressing"],
    );
  }

  @override
  List<Object?> get props => [
    question, mid, answer, number, progressing, ];
}

class Answer extends Equatable {
  Answer({
    required this.id,
    required this.title,
    required this.description,
  });

  final int? id;
  final String? title;
  final String? description;

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
