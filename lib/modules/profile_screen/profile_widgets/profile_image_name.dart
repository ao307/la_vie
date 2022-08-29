import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/themes/colors.dart';

class ProfileImageName extends StatelessWidget {
  const ProfileImageName({Key? key, this.name, this.image, this.email})
      : super(key: key);
  final String? name;
  final String? image;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatarWithTransition(
          image: AssetImage(image!),
          primaryColor: MyColors.cPrimary,
          size: 100,
          transitionBorderWidth: 12,
        ),
        const SizedBox(width: paddingSmall * .3),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name'.toTitleCase(),
              style: const TextStyle(
                fontSize: textSizeMedium - 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$email'.toCapitalized(),
              style: const TextStyle(
                fontSize: textSizeSmall,
                fontWeight: FontWeight.w600,
                color: MyColors.cTextSubtitleLight,
              ),
            ),
          ],
        ),
      ],
    );
  }


}
