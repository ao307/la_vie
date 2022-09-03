import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import '../../../shared/themes/colors.dart';

class FetchPostImageButton extends StatelessWidget {
  const FetchPostImageButton({Key? key,this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(paddingMedium),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: paddingLarge * 2,
          horizontal: paddingLarge,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(paddingMedium),
          border: Border.all(
            color: const Color(0xFF1ABC00),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.add,
              color: MyColors.cPrimary,
              size: 34,
            ),
            Text(
              'add photo'.tr().toTitleCase(),
              style: const TextStyle(
                fontSize: textSizeMedium,
                fontWeight: FontWeight.w600,
                color: MyColors.cPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
