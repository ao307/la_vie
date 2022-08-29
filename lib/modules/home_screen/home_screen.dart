import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/home_screen/home_widgets/home_all_product.dart';
import 'package:la_vie/modules/home_screen/home_widgets/home_onsale.dart';
import 'package:la_vie/modules/home_screen/home_widgets/home_slider.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
         
          body: SafeArea(
            child: ListView(
              children: const [
                HomeSlider(),
                SizedBox(
                  height: paddingLarge,
                ),
                HomeOnSaleSlider(),
                HomeAllProduct(),
              ],
            ),
          ),
        );
      },
    );
  }
}
