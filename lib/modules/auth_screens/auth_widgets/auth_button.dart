import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/themes/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? height;

  const AuthButton({
    required this.text,
    this.height=54,
    this.onPressed,
    this.color=MyColors.cPrimary,
    this.textColor=Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        // gradient: const LinearGradient(
        //     colors: [Color(0xffffffff), Color(0xffffffff)]),
      ),
      child: SizedBox(
        width: double.infinity,
        height:height,
        child: ElevatedButton(
          style: ButtonStyle(
            // elevation: MaterialStateProperty.all(0),
            overlayColor:
            MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
            alignment: Alignment.center,
            backgroundColor:
            MaterialStateProperty.all(color ?? Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusMedium),
              ),
            ),
          ),
          onPressed: onPressed??(){},
          child: Text(
            text.tr().toUpperCase(),
            style: TextStyle(
              color: textColor ?? MyColors.cPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
