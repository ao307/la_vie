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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            offset: const Offset(0, 2.0),
            blurRadius: 18.0,
          ),
        ],
      ),
    )      ],
    );
  }
}
