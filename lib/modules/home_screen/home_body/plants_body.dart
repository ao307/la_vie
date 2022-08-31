import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import '../../../shared/cubit/home_screen_cubit/home_screen_cubit.dart';
import '../../../shared/cubit/home_screen_cubit/home_screen_states.dart';
import '../../../shared/themes/colors.dart';
import '../../auth_screens/auth_widgets/auth_button.dart';
import '../home_widgets/home_counter.dart';

class PlantsBody extends StatelessWidget {
  const PlantsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
    final plantsModel = homeScreenCubit.plantsModel;
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          itemCount: 8,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                // to make top space
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: AspectRatio(
                    aspectRatio: .85,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(borderRadiusMedium),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                MyColors.cUnSelectedIconLight.withOpacity(0.09),
                            offset: const Offset(0, 2.0),
                            blurRadius: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // padding of all content in grid item
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: paddingMedium,
                    start: paddingSmall,
                    end: paddingSmall,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: CachedNetworkImage(
                                imageUrl: plantsModel!
                                        .data![index].imageUrl!.isNotEmpty
                                    ? "https://lavie.orangedigitalcenteregypt.com${plantsModel.data![index].imageUrl}"
                                    : "https://cdn-icons-png.flaticon.com/128/3200/3200085.png",
                              ),
                            ),
                          ),
                            Padding(
                            padding:const EdgeInsets.only(top: paddingLarge*2),
                            child: ProductCounter(
                              count: homeScreenCubit.plantsCount[index],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // product name
                          Text(
                            plantsModel.data![index].name!.toTitleCase(),
                            style: const TextStyle(
                              fontSize: textSizeSmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // product subtitle
                          Text(
                            "${plantsModel.data![index].temperature ?? 0} TMP",
                            style: const TextStyle(
                              fontSize: textSizeSmall,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: paddingSmall,
                          ),
                          AuthButton(
                            onPressed: () {},
                            text: 'add to cart',
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4.4,
            crossAxisSpacing: paddingMedium,
            mainAxisSpacing: paddingLarge * 2,
          ),
        );
      },
    );
  }
}
