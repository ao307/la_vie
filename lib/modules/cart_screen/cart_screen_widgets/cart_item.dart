import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:la_vie/modules/cart_screen/cart_screen_widgets/cart_counter.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../../models/add_to_cart_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.model,
    this.addFun,
    this.minFun,
    this.counter,
    this.delete,
  }) : super(key: key);
  final DataCard? model;
  final Function? addFun;
  final Function? minFun;
  final VoidCallback? delete;
  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(paddingLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusLarge),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5A5959).withOpacity(0.1),
            offset: const Offset(12.0, 12.0),
            blurRadius: 60.0,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Row(
            children: [
              // product image
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  borderRadiusMedium,
                ),
                child: CachedNetworkImage(
                  imageUrl: model!.imageUrl!.isNotEmpty
                      ? baseApiUrl + model!.imageUrl!
                      : errorProfileImage,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: paddingMedium,
              ),
              // product name && price && counter
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    (model!.name ?? '').tr().toCapitalized(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model!.price! * counter!} EGP'.tr(),
                    style: const TextStyle(
                      color: MyColors.cPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: paddingSmall,
                  ),
                  CartCounter(
                    count: counter,
                    addFunction: addFun,
                    minusFunction: minFun,
                  ),
                ],
              ),
            ],
          ),
          // delete
          IconButton(
            onPressed: delete,
            icon: const Icon(
              IconlyBold.delete,
              color: MyColors.cPrimary,
            ),
          )
        ],
      ),
    );
  }
}
