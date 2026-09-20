import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;
  final bool found;

  const NumberTrivia({
    required this.text,
    required this.number,
    required this.found,
  });

  @override
  List<Object?> get props => [text, number, found];
}
