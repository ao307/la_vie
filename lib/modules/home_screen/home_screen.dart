import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/modules/home_screen/home_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
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
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              ImagesInAssets.logo,
              width: 100,
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchTextFormField(
                        textController: TextEditingController(),
                        hintText: 'search',
                      ),
                    ),
                    const SizedBox(width: paddingMedium,),
                    FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      child: const FaIcon(
                        IconlyLight.buy,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}