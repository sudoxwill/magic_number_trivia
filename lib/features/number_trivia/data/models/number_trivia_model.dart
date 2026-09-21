import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

// ignore: must_be_immutable
class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    required super.text,
    required super.number,
    required super.found,
    required super.isOnline,
  });

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: json['number'],
      found: json['found'],
      isOnline: json['isOnline'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'number': number,
    'found': found,
    'isOnline': false,
  };
}
