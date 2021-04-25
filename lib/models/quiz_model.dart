import 'dart:convert';

import 'package:nlw05/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final String image;
  final Level level;
  final int questionAnswered;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    required this.image,
    required this.level,
    this.questionAnswered = 0,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'image': this.image,
      'level': this.level.parse,
      'questionAnswered': this.questionAnswered,
      'questions': this.questions.map((e) => e.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return new QuizModel(
      title: map['title'],
      image: map['image'],
      level: map['level'].toString().parse,
      questionAnswered: map['questionAnswered'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((e) => QuestionModel.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
