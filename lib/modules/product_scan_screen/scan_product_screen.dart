import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:la_vie/modules/auth_screens/auth_screen.dart';
import 'package:la_vie/modules/profile_screen/profile_widgets/images_and_profile_name.dart';
import 'package:la_vie/modules/profile_screen/profile_widgets/point_container.dart';
import 'package:la_vie/modules/profile_screen/profile_widgets/profile_list_tile.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/auth_cubit/auth_cubit.dart';

import '../../models/products_model.dart';
import '../../shared/themes/colors.dart';

class ScanProductScreen extends StatelessWidget {
  const ScanProductScreen({Key? key, this.productData}) : super(key: key);
  final ProductData? productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenH(context) * .5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  imageUrl: productData!.imageUrl!.isNotEmpty
                      ? "$baseApiUrl${productData!.imageUrl}"
                      : errorProfileImage,
                ),
                Container(
                  color: Colors.black45.withOpacity(.2),
                ),
                if(productData!.plant!=null)
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.only(start: paddingLarge),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemProductScan(
                            icon: Icons.light_mode_outlined,
                            numberText: "${productData!.plant!.sunLight}",
                            titleText: "sun light",
                          ),
                          const SizedBox(height: paddingLarge),
                          ItemProductScan(
                            icon: Icons.water_drop_outlined,
                            numberText: "${productData!.plant!.waterCapacity}",
                            titleText: "sun light",
                          ),
                          const SizedBox(height: paddingLarge),
                          ItemProductScan(
                            icon: Icons.thermostat_outlined,
                            numberText: "${productData!.plant!.temperature}",
                            titleText: "sun light",
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenH(context) * .54,
              width: screenW(context),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(borderRadiusLarge),
                  topEnd: Radius.circular(borderRadiusLarge),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: paddingLarge * 4,
                    top: paddingLarge * 1.5,
                    start: paddingMedium,
                    end: paddingMedium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productData!.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSizeLarge,
                        ),
                      ),
                      Text(
                        "${productData!.description}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColors.cTextSubtitleLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProductScan extends StatelessWidget {
  const ItemProductScan({
    Key? key,
    this.icon,
    this.numberText,
    this.titleText,
  }) : super(key: key);
  final IconData? icon;
  final String? titleText;
  final String? numberText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(paddingSmall),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black.withOpacity(0.64),
          ),
          child: Icon(
            icon,
            color: MyColors.cTextSubtitleLight,
            size: 40,
          ),
        ),
        const SizedBox(
          width: paddingSmall,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$numberText",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "$titleText".tr().toTitleCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
