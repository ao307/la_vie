import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/modules/home_screen/home_widgets/product_item_onsale.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/themes/colors.dart';

class HomeOnSaleSlider extends StatelessWidget {
  const HomeOnSaleSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: paddingLarge),
          child: Text(
            "on sale".tr().toUpperCase(),
            style: const TextStyle(
              fontSize: textSizeLarge,
              color: MyColors.cGoogleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => ProductItemOnSale(
                image:ImagesInAssets.slider3,
                productName: "product name",
                productOffer: "product offer",
                productPrice: "2000",
                productOldPrice: "1500",
                onAddToCart: (){},
                onFavorite: (){},
              ),
            ).map(
              (e) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                    start: paddingLarge*.5,
                  ),
                  child: e,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
