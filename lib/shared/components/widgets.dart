import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';

import '../themes/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.5),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class CircleAvatarWithTransition extends StatelessWidget {
  /// the base color of the images background and its concentric circles.
  final Color primaryColor;

  /// the profile image to be displayed.
  final ImageProvider image;

  ///the diameter of the entire widget, including the concentric circles.
  final double size;

  /// the width between the edges of each concentric circle.
  final double transitionBorderWidth;

  const CircleAvatarWithTransition({
    Key? key,
    required this.primaryColor,
    required this.image,
    this.size = 190.0,
    this.transitionBorderWidth = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.05),
          ),
        ),
        Container(
          height: size - transitionBorderWidth,
          width: size - transitionBorderWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              stops: const [0.01, 0.5],
              colors: [Colors.white, primaryColor.withOpacity(0.1)],
            ),
          ),
        ),
        Container(
          height: size - (transitionBorderWidth * 2),
          width: size - (transitionBorderWidth * 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.4),
          ),
        ),
        Container(
          height: size - (transitionBorderWidth * 3),
          width: size - (transitionBorderWidth * 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        Container(
          height: size - (transitionBorderWidth * 4),
          width: size - (transitionBorderWidth * 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.cover, image: image),
          ),
        ),
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingLarge),
      child: Container(
        height: 1,
        color: MyColors.cTextSubtitleLight.withOpacity(0.5),
      ),
    );
  }
}

class SideNotification extends StatelessWidget {
  const SideNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: 4,
        decoration: BoxDecoration(
          color: MyColors.cTextSubtitleLight.withOpacity(.4),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(borderRadiusMedium),
            bottom: Radius.circular(borderRadiusMedium),
          ),
        ),
      ),
    );
  }
}
