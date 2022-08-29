import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

// TODO: reuse rich text button
class RichTextButton extends StatelessWidget {
  final String? text1;
  final String? text2;
  final VoidCallback? onPressed;

  const RichTextButton({
    Key? key,
    this.text1,
    this.text2,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text.rich(
        TextSpan(
          text: "$text1".tr().toCapitalized(),
          style: TextStyle(
            fontSize: textSizeSmall + 1,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          children: [
            TextSpan(
              text: '$text2'.tr().toUpperCase(),
              style: const TextStyle(
                fontSize: textSizeSmall + 1,
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

// TODO: reuse text button
class ReuseTextButton extends StatelessWidget {
  const ReuseTextButton({Key? key,this.text,this.onPressed}) : super(key: key);
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed?? () {},
      child: Text(
        '$text'.tr().toCapitalized(),
        style: const TextStyle(
          fontSize: textSizeSmall,
          fontWeight: FontWeight.w600,
          color: MyColors.cTextSubtitleLight,
        ),
      ),
    );
  }
}
