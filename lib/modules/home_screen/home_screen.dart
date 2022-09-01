import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/modules/home_screen/home_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../shared/cubit/products_cubit/products_cubit.dart';
import '../../shared/cubit/products_cubit/products_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit homeScreenCubit = ProductsCubit.get(context);
    return FutureBuilder(
      future: homeScreenCubit.getProducts(),
      builder: (context, snapshot) {
        return BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                (homeScreenCubit.seedsModel == null ||
                    homeScreenCubit.toolsModel == null ||
                    homeScreenCubit.plantsModel == null)) {
              return LoadingPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Image.asset(
                    ImagesInAssets.logo,
                    width: 100,
                  ),
                ),
              );
            }
            else if(snapshot.hasError||state is GetProductsDataErrorState){
              return ErrorPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Image.asset(
                    ImagesInAssets.logo,
                    width: 100,
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Image.asset(
                  ImagesInAssets.logo,
                  width: 100,
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchTextFormField(
                            textController: TextEditingController(),
                            hintText: 'search',
                          ),
                        ),
                        const SizedBox(
                          width: paddingMedium,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          child: const FaIcon(
                            IconlyLight.buy,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: paddingLarge),
                  Expanded(
                    child: ContainedTabBarView(
                      initialIndex: homeScreenCubit.indexOfTap,
                      tabBarProperties: TabBarProperties(
                        indicatorSize: TabBarIndicatorSize.tab,
                        height: 40,
                        isScrollable: true,
                        padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: paddingMedium,
                        ),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                        indicator: BoxDecoration(
                          border: Border.all(
                            color: MyColors.cPrimary,
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(borderRadiusMedium),
                          ),
                        ),
                        unselectedLabelColor: MyColors.cTextSubtitleLight,
                      ),
                      tabs: List.generate(
                        homeScreenCubit.tapText.length,
                        (index) => Container(
                          height: 100,
                          alignment: AlignmentDirectional.center,
                          padding: homeScreenCubit.indexOfTap != index
                              ? const EdgeInsets.symmetric(
                                  horizontal: paddingLarge,
                                )
                              : EdgeInsets.zero,
                          decoration: homeScreenCubit.indexOfTap != index
                              ? BoxDecoration(
                                  color: MyColors.cTextSubtitleLight
                                      .withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(borderRadiusMedium),
                                  ),
                                )
                              : null,
                          child: Text(
                            homeScreenCubit.tapText[index].tr().toTitleCase(),
                          ),
                        ),
                      ),
                      views: List.generate(
                        homeScreenCubit.tapText.length,
                        (index) => homeScreenCubit.bodyOfHome[index],
                      ),
                      onChange: (index) =>
                          homeScreenCubit.changeIndexOfTap(index),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
