import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import '../../../shared/cubit/products_cubit/products_cubit.dart';
import '../../../shared/cubit/products_cubit/products_states.dart';
import '../home_widgets/plants_item.dart';

class PlantsBody extends StatelessWidget {
  const PlantsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit homeScreenCubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          itemCount: homeScreenCubit.plantsModel!.data!.length,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return PlantsGridItem(
              data: homeScreenCubit.plantsModel!.data![index],
              count: homeScreenCubit.plantsCount[index],
              addFun: () => homeScreenCubit.addPlantFun(index),
              minusFun: () => homeScreenCubit.minusPlantFun(index),
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
