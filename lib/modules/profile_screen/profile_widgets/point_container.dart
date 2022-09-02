import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';

class PointsContainer extends StatelessWidget {
  const PointsContainer({Key? key, this.image, this.text}) : super(key: key);
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        top: paddingLarge,
        bottom: paddingLarge,
        start: paddingMedium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingMedium),
        color: const Color(0xFFF3FEF1),
      ),
      child: Row(
        children: [
          Image.asset(image!),
          const SizedBox(
            width: paddingMedium,
          ),
          Expanded(
            child: Text(
              '$text'.tr().toCapitalized(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
