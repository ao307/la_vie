import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  final PageController controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          // extendBody: true,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controllerPage,
            children: cubit(context).screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit(context).currentIndex,
            onTap: (index) {
              cubit(context).changeIndex(index);
              controllerPage.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.home,
                ),
                label: 'home'.tr().toCapitalized(),
                activeIcon: const Icon(
                  IconlyBold.home,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.category,
                ),
                label: 'category'.tr().toCapitalized(),
                activeIcon: const Icon(
                  IconlyBold.category,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.buy,
                ),
                label: 'cart'.tr().toCapitalized(),
                activeIcon: const Icon(
                  IconlyBold.buy,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.user2,
                ),
                label: 'profile'.tr().toCapitalized(),
                activeIcon: const Icon(
                  IconlyBold.user2,
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     navigateAndFinish(context: context, widget: LoginScreen());
          //   },
          // ),
        );
      },
    );
  }
}
