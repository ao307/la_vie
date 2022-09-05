import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../../models/blogs_model.dart';

class BlogsSeedItem extends StatelessWidget {
  const BlogsSeedItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final BlogsSeeds? model;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: paddingMedium,
          ),
          // product name && price && counter
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  (model!.name ?? '').toCapitalized(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  model!.description ?? "",
                  style: const TextStyle(
                    color: MyColors.cPrimary,
                    fontWeight: FontWeight.bold,
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
