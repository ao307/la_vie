import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../cubit/cubit.dart';

double screenW(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenH(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

AppCubit cubit(BuildContext context) => AppCubit.get(context);

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

void navigateTo({required BuildContext context, required Widget widget}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

void showToast({
  required String msg,
}) =>
    Fluttertoast.showToast(
      msg: msg.tr().toCapitalized(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: 16.0,
    );

String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'enter your email address'.tr().toCapitalized();
  } else if (!regex.hasMatch(value)) {
    return 'enter a valid email address'.tr().toCapitalized();
  } else {
    return null;
  }
}

String? validateName(String? value, String? order) {
  const String pattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']|))+[A-Za-z]+\.?\s*$";
  final RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'enter your $order name'.tr().toCapitalized();
  } else if (!regex.hasMatch(value)) {
    return 'enter a valid name'.tr().toCapitalized();
  } else {
    return null;
  }
}

String? validatePassword(
  String? value,
) {
  const String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  final RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return 'enter your password'.tr().toCapitalized();
  } else if (!regex.hasMatch(value)) {
    return 'password should be 8 digit contains at least one capital and lower character'.tr().toCapitalized();
  }
  return null;
}

void showAlertDialog({
  required BuildContext context,
  String? title,
  Widget? body,
  VoidCallback? onPressed1,
  String? txtBtn1,
  VoidCallback? onPressed2,
  String? txtBtn2,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: body,
        scrollable: true,
        actions: [
          if (onPressed1 != null)
            ElevatedButton(
              onPressed: onPressed1,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: MyColors.cPrimary,
                      width: .6,
                    ),
                  ),
                ),
              ),
              child: Text(
                '$txtBtn1'.tr().toUpperCase(),
              ),
            ),
          if (onPressed2 != null)
            ElevatedButton(
              onPressed: onPressed2,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColors.cPrimary),
              ),
              child: Text(
                '$txtBtn2'.tr().toTitleCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      );
    },
  );
}

void showMyDialog({
  required BuildContext context,
  String? title,
  Widget? body,
  VoidCallback? btnCancelOnPress,
  VoidCallback? btnOkOnPress,
  DialogType? dialogType,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType ?? DialogType.NO_HEADER,
    width: screenW(context) * .3,
    animType: AnimType.BOTTOMSLIDE,
    title: "title",
    desc: 'Dialog description here.............',
    body: body,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
