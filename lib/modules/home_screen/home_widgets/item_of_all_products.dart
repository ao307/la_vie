import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

class ItemOfAllProducts extends StatelessWidget {
  const ItemOfAllProducts({
    Key? key,
    this.image,
    this.productName,
    this.productOffer,
    this.productPrice,
    this.productOldPrice,
    this.onAddToCart,
    this.onFavorite,
  }) : super(key: key);
  final String? image;
  final String? productName;
  final String? productOffer;
  final String? productPrice;
  final String? productOldPrice;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingLarge * .5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusLarge),
        border: Border.all(
          color: MyColors.cPrimary.withOpacity(.8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.0),
            offset: const Offset(0, 6.0),
            blurRadius: 24.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image!,
          ),
          //product name
          Text(
            '$productName'.tr().toTitleCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          //product offer
          Text(
            '$productOffer',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: MyColors.cTextSubtitleLight,
              fontWeight: FontWeight.w600,
              fontSize: textSizeSmall,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                //product price
                Text(
                  '\$$productPrice',
                  style: const TextStyle(
                    fontSize: textSizeSmall,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                //product old price
                if (productOldPrice != null)
                  Text(
                    '\$$productOldPrice',
                    style: const TextStyle(
                      fontSize: textSizeXSmall,
                      decoration: TextDecoration.lineThrough,
                      color: MyColors.cTextSubtitleLight,
                    ),
                  ),
                const SizedBox(
                  width: 4.0,
                ),
                //add to cart button
                Expanded(
                  child: IconButton(
                    onPressed: onAddToCart,
                    icon: const Icon(
                      IconlyBroken.buy,
                      size: iconSizeSmall,
                    ),
                  ),
                ),
                //add to cart favorite button
                Expanded(
                  child: IconButton(
                    onPressed: onFavorite,
                    icon: const Icon(
                      IconlyBroken.heart,
                      size: iconSizeSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
