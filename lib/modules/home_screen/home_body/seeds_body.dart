import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import '../../../shared/cubit/home_screen_cubit/home_screen_cubit.dart';
import '../../../shared/cubit/home_screen_cubit/home_screen_states.dart';
import '../home_widgets/seeds_item.dart';

class SeedsBody extends StatelessWidget {
  const SeedsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          itemCount: homeScreenCubit.seedsModel!.data!.length,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SeedsGridItem(
              data: homeScreenCubit.seedsModel!.data![index],
              count: homeScreenCubit.seedsCount[index],
              addFun: () => homeScreenCubit.addSeedsFun(index),
              minusFun: () => homeScreenCubit.minusSeedsFun(index),
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
