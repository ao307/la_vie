import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/products_cubit/products_cubit.dart';
import '../../../shared/cubit/products_cubit/products_states.dart';
import '../products_widgets/plants_item.dart';

class PlantsBody extends StatelessWidget {
  const PlantsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productScreenCubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(productScreenCubit.productPlant.isNotEmpty){
          return const EmptyWidget();
        }
        return GridView.builder(
          itemCount: productScreenCubit.productPlant.length,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return PlantsGridItem(
              data: productScreenCubit.productPlant[index],
              count: productScreenCubit.plantsCount[index],
              addFun: () => productScreenCubit.addPlantFun(index),
              minusFun: () => productScreenCubit.minusPlantFun(index),
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
