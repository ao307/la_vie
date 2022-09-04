import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../../models/profile_data_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, this.userNotification}) : super(key: key);
  final UserNotification? userNotification;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(
            userNotification!.imageUrl!.isNotEmpty
                ? userNotification!.imageUrl!
                : errorAvatarImage,
          ),
        ),
        const SizedBox(
          width: paddingMedium,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (userNotification!.message ?? '').toTitleCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              // const SizedBox(
              //   height: paddingMedium,
              // ),
              // IntrinsicHeight(
              //   child: Row(
              //     children: [
              //       const SideNotification(),
              //       const SizedBox(
              //         width: paddingSmall,
              //       ),
              //       Expanded(
              //         child: Text(
              //           '" In a world where everyone else is learning, if you don’t take your learning seriously you will fall behind."'
              //               .toCapitalized(),
              //           style: const TextStyle(
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: paddingSmall,
              // ),
              Text(
                getTimeDifferenceFromNow(
                  userNotification!.createdAt!,
                ).toCapitalized(),
                style: const TextStyle(
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
