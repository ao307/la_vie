import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/image_assets.dart';

class BackLeaves extends StatelessWidget {
  const BackLeaves({Key? key,required this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Image.asset(
                ImagesInAssets.tree,
              ),
            ),
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: RotatedBox(
                quarterTurns: 90,
                child: Image.asset(
                  ImagesInAssets.tree,
                ),
              ),
            ),
          ],
        ),
        child!,
      ],
    );
  }
}
