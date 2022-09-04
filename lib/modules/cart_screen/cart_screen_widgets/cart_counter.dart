import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';

import '../../../shared/themes/colors.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        color: const Color(0xFFF8F8F8),
       ),
      padding: const EdgeInsetsDirectional.all(paddingSmall),
      child: Row(
        children: [
          InkCounterCartItem(
            function: minusFunction,
            icon: Icons.remove,
          ),
          Text(
            '  ${count ?? 0}  ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          InkCounterCartItem(
            function: addFunction,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}

class InkCounterCartItem extends StatelessWidget {
  const InkCounterCartItem({
    Key? key,
    this.function,
    this.icon,
  }) : super(key: key);
  final Function? function;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        color: MyColors.cPrimary,
      ),
      onTap: () {
        function!();
      },
    );
  }
}
