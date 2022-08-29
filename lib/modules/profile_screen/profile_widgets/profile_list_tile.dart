import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    this.title,
    this.subTitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final IconData? leadingIcon;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingSmall),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: iconSizeLarge - 2,
        ),
        title: Text(
          "$title".tr().toCapitalized(),
          style: const TextStyle(
            fontSize: textSizeMedium,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle:subTitle!=null ? Text(
          "$subTitle".tr().toCapitalized(),
          style: const TextStyle(
            fontSize: textSizeSmall,
            fontWeight: FontWeight.w600,
            color: MyColors.cTextSubtitleLight,
          ),
        ):null,
        trailing: trailing ?? (context.locale.toString() == 'ar_EG' ? arrowLeftIcon:arrowRightIcon),
        onTap: onTap ?? () {},
      ),
    );
  }
}
