import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/modules/products_screen/products_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../shared/components/tap_bar_reuse.dart';
import '../../shared/cubit/products_cubit/products_cubit.dart';
import '../../shared/cubit/products_cubit/products_states.dart';
import '../cart_screen/cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productScreenCubit = ProductsCubit.get(context);
    return FutureBuilder(
      future: productScreenCubit.getProducts(),
      builder: (context, snapshot) {
        return BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                productScreenCubit.productsModel == null) {
              return LoadingPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Image.asset(
                    ImagesInAssets.logoImage,
                    width: 100,
                  ),
                ),
              );
            } else if (snapshot.hasError ||
                state is GetProductsDataErrorState)
            {
              return ErrorPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Image.asset(
                    ImagesInAssets.logoImage,
                    width: 100,
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Image.asset(
                  ImagesInAssets.logoImage,
                  width: 100,
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingMedium),
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
                          heroTag: "productScreen",
                          onPressed: () {
                            navigateTo(context: context, widget: const MyCartScreen());
                          },
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
                    child: TapBarReUse(
                      initialIndex: productScreenCubit.indexOfProductTap,
                      listOfTabsText: productScreenCubit.tapTextOfProduct,
                      listOfViewsBody: productScreenCubit.bodyOfProduct,
                      onChange: (index) =>
                          productScreenCubit.changeIndexOfTap(index),
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
