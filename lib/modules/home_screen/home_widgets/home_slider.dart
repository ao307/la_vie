import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/image_assets.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List slider =[
      ImagesInAssets.slider,
      ImagesInAssets.slider1,
      ImagesInAssets.slider2,
      ImagesInAssets.slider3,
      ImagesInAssets.slider4,
    ];
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayCurve: Curves.easeInOut,
        aspectRatio: 2.0,
        viewportFraction: .7,
      ),
      itemBuilder: (context, index, animation) {
        return Image.asset(
          slider[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: slider.length,
    );
  }
}
