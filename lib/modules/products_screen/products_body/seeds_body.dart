import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import '../../../models/add_to_cart_model.dart';
import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/products_cubit/products_cubit.dart';
import '../../../shared/cubit/products_cubit/products_states.dart';
import '../products_widgets/seeds_item.dart';

class SeedsBody extends StatelessWidget {
  const SeedsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productScreenCubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(productScreenCubit.productSeed.isEmpty){
          return const EmptyWidget();
        }
        return GridView.builder(
          itemCount: productScreenCubit.productSeed.length,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {

            return SeedsGridItem(
              count: productScreenCubit.seedsCount[index],
              data: productScreenCubit.productSeed[index],
              addFun: () => productScreenCubit.addSeedsFun(index),
              minusFun: () => productScreenCubit.minusSeedsFun(index),
              addToCart: () => productScreenCubit.addToCart(
                DataCard(
                  cartCount: productScreenCubit.plantsCount[index],
                  imageUrl: productScreenCubit.productSeed[index].imageUrl,
                  name: productScreenCubit.productSeed[index].name,
                  price: productScreenCubit.productSeed[index].price,
                  productId: productScreenCubit.productSeed[index].productId,
                ),
              ),
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
