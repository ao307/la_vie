
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
        InkWell(
          splashColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.cTextSubtitleLight.withOpacity(.1),
            ),
            child: const Icon(
              Icons.remove,
              color: MyColors.cTextSubtitleLight,
            ),
          ),
          onTap: () {
            minusFunction!();
          },
        ),
        Text(
          '  ${count??0}  ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.cTextSubtitleLight.withOpacity(.1),
            ),
            child: const Icon(
              Icons.add,
              color: MyColors.cTextSubtitleLight,
            ),
          ),
          onTap: () {
            addFunction!();
          },
        ),
      ],
    );
  }
}
