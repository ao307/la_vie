import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/modules/home_screen/home_widgets/item_of_all_products.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/themes/colors.dart';

class HomeAllProduct extends StatelessWidget {
  const HomeAllProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: paddingLarge, bottom: paddingSmall,),
          child: Text(
            "all products".tr().toUpperCase(),
            style: const TextStyle(
              fontSize: textSizeLarge,
              color: MyColors.cPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .8,
            mainAxisSpacing: paddingLarge,
            crossAxisSpacing: paddingLarge,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: paddingLarge * .5,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ItemOfAllProducts(
              image: ImagesInAssets.slider4,
              productName: "product name",
              productOffer: "product offer",
              productPrice: "2000",
              productOldPrice: "1500",
              onAddToCart: () {},
              onFavorite: () {},
            );
          },
        ),
      ],
    );
  }
}
