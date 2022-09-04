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
    const tileColor = Color(0xff1D592C);
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: paddingLarge),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(paddingMedium),
          onTap: onTap ?? () {},
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              top: paddingSmall,
              bottom: paddingSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(paddingMedium),
              border: Border.all(
                color: MyColors.cTextSubtitleLight.withOpacity(.4),
                width: 1.5,
              ),
            ),
            child: ListTile(
              iconColor: Colors.white,
              leading: Container(
                padding: const EdgeInsets.all(paddingSmall - 2),
                decoration: BoxDecoration(
                  color: tileColor,
                  borderRadius: BorderRadius.circular(
                    borderRadiusMedium,
                  ),
                ),
                child: Icon(
                  leadingIcon,
                  size: iconSizeLarge - 2,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "$title".tr().toTitleCase(),
                style: const TextStyle(
                  fontSize: textSizeMedium,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // subtitle: subTitle != null
              //     ? Text(
              //         "$subTitle".tr().toCapitalized(),
              //         style: const TextStyle(
              //           fontSize: textSizeSmall,
              //           fontWeight: FontWeight.w600,
              //           color: MyColors.cTextSubtitleLight,
              //         ),
              //       )
              //     : null,
              trailing: const Icon(
                Icons.arrow_forward,
                color: tileColor,
                size: iconSizeLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
