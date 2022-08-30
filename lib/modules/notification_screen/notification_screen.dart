import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../shared/components/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('notification'.tr().toCapitalized()),
          ),
          body: SafeArea(
            child: ListView.separated(
              padding: const EdgeInsetsDirectional.only(bottom: paddingLarge*3),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const MyDivider(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(paddingSmall),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
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
                              'Joy Arnold left 6 comments on Your Post'
                                  .toCapitalized(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: paddingMedium,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  const SideNotification(),
                                  const SizedBox(
                                    width: paddingSmall,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '" asdas sadasd asda sdas das das das dasdas sadasd asda sdas das das das dasdas sadasd asda sdas das das das dasdas sadasd asda sdas das das das dasdas sadasd asda sdas das das das d"'
                                          .toCapitalized(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: paddingSmall,
                            ),
                            Text(
                              'Yesterday at 11:42 PM'.toCapitalized(),
                              style: const TextStyle(
                                color: MyColors.cTextSubtitleLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
