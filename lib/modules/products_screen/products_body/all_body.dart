import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import '../../../models/add_to_cart_model.dart';
import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/products_cubit/products_cubit.dart';
import '../../../shared/cubit/products_cubit/products_states.dart';
import '../products_widgets/plants_item.dart';
import '../products_widgets/seeds_item.dart';
import '../products_widgets/tools_item.dart';

class AllProductsBody extends StatelessWidget {
  const AllProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productScreenCubit = ProductsCubit.get(context);
    final allProduct = productScreenCubit.productsModel!;
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (productScreenCubit.productsModel!.data!.isEmpty) {
          return const EmptyWidget();
        }
        return GridView.builder(
          itemCount: productScreenCubit.productsModel!.data!.length,
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingLarge * 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (allProduct.data![index].plant != null) {
              return PlantsGridItem(
                data: allProduct.data![index],
                count: productScreenCubit.allProductCount[index],
                addFun: () => productScreenCubit.addAllProductsFun(index),
                minusFun: () => productScreenCubit.minusAllProductsFun(index),
                addToCart: () => productScreenCubit.addToCart(
                  DataCard(
                    cartCount: productScreenCubit.allProductCount[index],
                    imageUrl: allProduct.data![index].imageUrl,
                    name: allProduct.data![index].name,
                    price: allProduct.data![index].price,
                    productId: allProduct.data![index].productId,
                  ),
                ),
              );
            } else if (allProduct.data![index].seed != null) {
              return SeedsGridItem(
                data: allProduct.data![index],
                count: productScreenCubit.allProductCount[index],
                addFun: () => productScreenCubit.addAllProductsFun(index),
                minusFun: () => productScreenCubit.minusAllProductsFun(index),
                addToCart: () => productScreenCubit.addToCart(
                  DataCard(
                    cartCount: productScreenCubit.allProductCount[index],
                    imageUrl: allProduct.data![index].imageUrl,
                    name: allProduct.data![index].name,
                    price: allProduct.data![index].price,
                    productId: allProduct.data![index].productId,
                  ),
                ),
              );
            } else if (allProduct.data![index].tool != null) {
              return ToolsGridItem(
                data: allProduct.data![index],
                count: productScreenCubit.allProductCount[index],
                addFun: () => productScreenCubit.addAllProductsFun(index),
                minusFun: () => productScreenCubit.minusAllProductsFun(index),
                addToCart: () => productScreenCubit.addToCart(
                  DataCard(
                    cartCount: productScreenCubit.allProductCount[index],
                    imageUrl: allProduct.data![index].imageUrl,
                    name: allProduct.data![index].name,
                    price: allProduct.data![index].price,
                    productId: allProduct.data![index].productId,
                  ),
                ),
              );
            }
            return Container();
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
