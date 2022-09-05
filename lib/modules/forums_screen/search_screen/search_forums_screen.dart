import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/products_screen/products_widgets/search_text_form.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_cubit.dart';

import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/forums_cubit/forums_states.dart';
import '../forums_widgets/forums_item.dart';

class SearchForumsScreen extends StatelessWidget {
  const SearchForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForumsCubit forumsCubit = ForumsCubit.get(context);
    // clear it every open
    forumsCubit.filterForumsList.clear();
    forumsCubit.filterForumValue = "";
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final forumsFilterList = forumsCubit.filterForumsList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('search'.tr().toCapitalized()),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
                child: SearchTextFormField(
                  hintText: 'search',
                  onChanged: (v) => forumsCubit.filterForums(v),
                ),
              ),
              Expanded(
                child: forumsFilterList.isNotEmpty
                    ? ListView.separated(
                        itemCount: forumsFilterList.length,
                        padding: const EdgeInsetsDirectional.only(
                          start: paddingMedium,
                          end: paddingMedium,
                          top: paddingMedium * 2,
                          bottom: paddingLarge * 5,
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: paddingLarge * 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ForumsItem(
                            forums: forumsFilterList[index],
                            onPressedLike: () => forumsCubit
                                .likeForums(forumsFilterList[index].forumId!),
                          );
                        },
                      )
                    : forumsCubit.filterForumValue == "not found"
                        ? const EmptyWidget(
                            title: "not found",
                            subTitle: "try another name",
                          )
                        : const EmptyWidget(
                            subTitle: "search now to find friends forums",
                          ),
              )
            ],
          ),
        );
      },
    );
  }
}
