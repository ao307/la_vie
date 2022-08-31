import 'package:flutter/material.dart';

import '../../../shared/themes/colors.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    Key? key,
    this.count,
    this.addFunction,
    this.minusFunction,
  }) : super(key: key);
  final int? count;
  final Function? addFunction;
  final Function? minusFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkCounterItem(
          function: minusFunction,
          icon: Icons.remove,
        ),
        Text(
          '  ${count ?? 0}  ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        InkCounterItem(
          function: addFunction,
          icon: Icons.add,
        ),
      ],
    );
  }
}

class InkCounterItem extends StatelessWidget {
  const InkCounterItem({
    Key? key,
    this.function,
    this.icon,
  }) : super(key: key);
  final Function? function;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.cTextSubtitleLight.withOpacity(.1),
        ),
        child: Icon(
          icon,
          color: MyColors.cTextSubtitleLight,
        ),
      ),
      onTap: () {
        function!();
      },
    );
  }
}
