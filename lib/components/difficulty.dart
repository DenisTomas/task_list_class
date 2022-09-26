import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 1) ? Colors.blue[700] : Colors.blue[300],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 2) ? Colors.blue[700] : Colors.blue[300],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 3) ? Colors.blue[700] : Colors.blue[300],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 4) ? Colors.blue[700] : Colors.blue[300],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 5) ? Colors.blue[700] : Colors.blue[300],
        ),
      ],
    );
  }
}
