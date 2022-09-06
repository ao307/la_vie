import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/auth_button.dart';
import 'package:la_vie/modules/cart_screen/cart_screen_widgets/cart_item.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_cubit.dart';
import 'package:la_vie/shared/themes/colors.dart';
import '../../shared/components/widgets.dart';
import '../../shared/cubit/products_cubit/products_states.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productsCubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('my cart'.tr().toCapitalized()),
          ),
          body: productsCubit.listOfDataCart.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: productsCubit.listOfDataCart.length,
                        padding: const EdgeInsetsDirectional.all(paddingLarge),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: paddingLarge,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            CartItem(
                          counter: productsCubit.cartCount[index],
                          model: productsCubit.listOfDataCart[index],
                          addFun: () => productsCubit.addDataCartFun(index),
                          minFun: () => productsCubit.minusDataCartFun(index),
                          delete: () => productsCubit.clearItemCart(index),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingLarge,
                        vertical: paddingLarge * 2,
                      ),
                      child: AuthButton(text: 'checkout'),
                    )
                  ],
                )
              : const EmptyWidget(
                  title: "your cart is empty",
                  subTitle:
                      "sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                ),
        );
      },
    );
  }
}
