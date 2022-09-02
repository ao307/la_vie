import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';

class ImagesAndProfileImage extends StatelessWidget {
  const ImagesAndProfileImage(
      {Key? key, required this.profileImage, required this.profileName})
      : super(key: key);
  final String? profileImage;
  final String? profileName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                profileImage!.isNotEmpty?profileImage!:errorProfileImage,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(.6),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(
                  profileImage!.isNotEmpty?profileImage!:errorProfileImage,
                ),
              ),
              Text(
                (profileName ?? "").toTitleCase(),
                style: const TextStyle(
                  fontSize: textSizeLarge,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
