import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/forums_screen/search_screen/search_forums_screen.dart';
import 'package:la_vie/modules/products_screen/products_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_cubit.dart';

import '../../shared/components/tap_bar_reuse.dart';
import '../../shared/cubit/forums_cubit/forums_states.dart';
import '../create_post_screen/create_post_screen.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForumsCubit forumsScreenCubit = ForumsCubit.get(context);
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('discussion forums'.tr().toTitleCase()),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
                child: SearchTextFormField(
                  hintText: 'search',
                  readOnly: true,
                  onTap: () {
                    navigateTo(
                      context: context,
                      widget: const SearchForumsScreen(),
                    );
                  },
                ),
              ),
              const SizedBox(height: paddingLarge),
              Expanded(
                child: TapBarReUse(
                  initialIndex: forumsScreenCubit.indexOfForumsTap,
                  listOfTabsText: forumsScreenCubit.forumsText,
                  listOfViewsBody: forumsScreenCubit.forumsBody,
                  onChange: (index) =>
                      forumsScreenCubit.changeIndexOfForumsTap(index),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenH(context) * .08),
            child: FloatingActionButton(
              heroTag: "forumsScreen",
              onPressed: () {
                navigateTo(context: context, widget: const CreatePostScreen());
              },
              mini: true,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
