import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/themes/colors.dart';

class ProfileImageName extends StatelessWidget {
  const ProfileImageName({Key? key, this.name, this.image, this.time})
      : super(key: key);
  final String? name;
  final String? image;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(
            image!,
          ),
        ),
        const SizedBox(width: paddingMedium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name'.toTitleCase(),
                style: const TextStyle(
                  fontSize: textSizeMedium - 1,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$time'.toCapitalized(),
                style: const TextStyle(
                  fontSize: textSizeSmall,
                  fontWeight: FontWeight.w600,
                  color: MyColors.cTextSubtitleLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
