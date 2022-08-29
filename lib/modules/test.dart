import 'package:flutter/material.dart';

class TestPro extends StatelessWidget {
  const TestPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xFF53B175).withOpacity(0.1),
        border: Border.all(
          color: const Color(0xFF53B175).withOpacity(0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.0),
            offset: const Offset(0, 6.0),
            blurRadius: 24.0,
          ),
        ],
      ),
    )
      ],
    );
  }
}
