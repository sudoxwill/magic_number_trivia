import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class NumberTrivia extends Equatable {
  final String text;
  final int number;
  final bool found;
  bool isOnline;

  NumberTrivia({
    required this.text,
    required this.number,
    required this.found,
    required this.isOnline,
  });

  @override
  List<Object?> get props => [text, number, found, isOnline];
}
