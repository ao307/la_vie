import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/products_screen/products_widgets/plants_item.dart';
import 'package:la_vie/modules/products_screen/products_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_states.dart';

import '../../../models/add_to_cart_model.dart';
import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/products_cubit/products_cubit.dart';
import '../products_widgets/seeds_item.dart';
import '../products_widgets/tools_item.dart';

class SearchProductsScreen extends StatelessWidget {
  const SearchProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productCubit = ProductsCubit.get(context);
    productCubit.filterProductsList.clear();
    productCubit.filterProductsValue = "";
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final productFilterList = productCubit.filterProductsList;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('search'.tr().toCapitalized()),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
                child: SearchTextFormField(
                  hintText: 'search',
                  onChanged: (v) => productCubit.filterProducts(v),
                ),
              ),
              Expanded(
                child: productFilterList.isNotEmpty
                    ? GridView.builder(
                        itemCount: productFilterList.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: paddingMedium,
                          vertical: paddingLarge * 1.5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          if (productFilterList[index].plant != null) {
                            return PlantsGridItem(
                              data: productFilterList[index],
                              count: productCubit.allFilterCount[index],
                              addFun: () => productCubit.addAllFilterFun(index),
                              minusFun: () =>
                                  productCubit.minusAllFilterFun(index),
                              addToCart: () => productCubit.addToCart(
                                DataCard(
                                  cartCount: productCubit.allFilterCount[index],
                                  imageUrl: productFilterList[index].imageUrl,
                                  name: productFilterList[index].name,
                                  price: productFilterList[index].price,
                                  productId: productFilterList[index].productId,
                                ),
                              ),
                            );
                          } else if (productFilterList[index].seed != null) {
                            return SeedsGridItem(
                              data: productFilterList[index],
                              count: productCubit.allFilterCount[index],
                              addFun: () => productCubit.addAllFilterFun(index),
                              minusFun: () =>
                                  productCubit.minusAllFilterFun(index),
                              addToCart: () => productCubit.addToCart(
                                DataCard(
                                  cartCount: productCubit.allFilterCount[index],
                                  imageUrl: productFilterList[index].imageUrl,
                                  name: productFilterList[index].name,
                                  price: productFilterList[index].price,
                                  productId: productFilterList[index].productId,
                                ),
                              ),
                            );
                          } else if (productFilterList[index].tool != null) {
                            return ToolsGridItem(
                              data: productFilterList[index],
                              count: productCubit.allFilterCount[index],
                              addFun: () => productCubit.addAllFilterFun(index),
                              minusFun: () =>
                                  productCubit.minusAllFilterFun(index),
                              addToCart: () => productCubit.addToCart(
                                DataCard(
                                  cartCount: productCubit.allFilterCount[index],
                                  imageUrl: productFilterList[index].imageUrl,
                                  name: productFilterList[index].name,
                                  price: productFilterList[index].price,
                                  productId: productFilterList[index].productId,
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4.4,
                          crossAxisSpacing: paddingMedium,
                          mainAxisSpacing: paddingLarge * 2,
                        ),
                      )
                    : productCubit.filterProductsValue == "not found"
                        ? const EmptyWidget(
                            title: "not found",
                            subTitle: "try another key",
                          )
                        : const EmptyWidget(
                            subTitle: "search now to find product",
                          ),
              )
            ],
          ),
        );
      },
    );
  }
}
