import 'package:flutter/material.dart';

class TestPro extends StatelessWidget {
  const TestPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 176.0,
          height: 227.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFF1ABC00),
            ),
          ),
        )
      ],
    );
  }
}
