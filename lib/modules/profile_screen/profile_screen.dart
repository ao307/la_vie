import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:la_vie/modules/auth_screens/auth_screen.dart';
import 'package:la_vie/modules/profile_screen/profile_widgets/profile_image_name.dart';
import 'package:la_vie/modules/profile_screen/profile_widgets/profile_list_tile.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/auth_cubit/auth_cubit.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: paddingSmall,
                    start: paddingSmall,
                  ),
                  child: ProfileImageName(
                    image: ImagesInAssets.slider3,
                    name: "ريتاج أشرف",
                    email: "retagashraf@gmail.com",
                  ),
                ),
                const SizedBox(height: paddingMedium),
                Column(
                  children: [
                    // address
                    const ProfileListTile(
                      title: "address",
                      subTitle: "34 st.awlad sokar",
                      leadingIcon: IconlyBroken.location,
                    ),
                    // orders
                    const ProfileListTile(
                      title: "orders",
                      leadingIcon: IconlyBroken.wallet,
                    ),
                    // wishlist
                    const ProfileListTile(
                      title: "wishlist",
                      leadingIcon: IconlyBroken.heart,
                    ),
                    // viewed
                    const ProfileListTile(
                      title: "viewed",
                      leadingIcon: IconlyBroken.show,
                    ),
                    // dark mode
                    ProfileListTile(
                      title: "dark mode",
                      subTitle: AppCubit.isDark==true?"on":"off",
                      leadingIcon: Icons.light_mode_outlined,
                      onTap: () {
                        cubit(context).changeThem();
                      },
                    ),
                    // language
                    ProfileListTile(
                      title: "language",
                      subTitle: context.locale.toString() == 'ar_EG'
                          ? 'العربية'
                          : 'english',
                      leadingIcon: Icons.language_outlined,
                      onTap: () {
                        if (context.locale.toString() == 'ar_EG') {
                          context.setLocale(
                            const Locale(
                              'en',
                              'US',
                            ),
                          );
                        } else {
                          context.setLocale(
                            const Locale(
                              'ar',
                              'EG',
                            ),
                          );
                        }
                        cubit(context).changeIndex(3);
                      },
                    ),
                    // about us
                    const ProfileListTile(
                      title: "about us",
                      leadingIcon: IconlyBroken.lock,
                    ),
                    // logout
                    ProfileListTile(
                      title: "logout",
                      leadingIcon: IconlyBroken.logout,
                      onTap: () {
                        AuthCubit.get(context).logout(context);
                        navigateAndFinish(context: context, widget: const AuthScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
