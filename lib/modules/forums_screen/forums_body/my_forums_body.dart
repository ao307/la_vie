import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_cubit.dart';
import '../../../shared/components/widgets.dart';
import '../../../shared/cubit/forums_cubit/forums_states.dart';
import '../forums_widgets/forums_item.dart';

class MyForumsBody extends StatelessWidget {
  const MyForumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForumsCubit forumsCubit = ForumsCubit.get(context);
    return FutureBuilder(
      future: forumsCubit.getMyForumsData(),
      builder: (context, snapshot) {
        return BlocConsumer<ForumsCubit, ForumsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final forums = forumsCubit.myForumsModel;
            if (snapshot.connectionState == ConnectionState.waiting &&
                forums == null) {
              return const LoadingPage();
            } else if ((snapshot.connectionState == ConnectionState.done ||
                    snapshot.hasError) &&
                forums == null) {
              return const ErrorPage();
            } else if (forums!.data!.isEmpty || forums.data == null) {
              return const EmptyWidget();
            }

            return ListView.separated(
              itemCount: forums.data!.length,
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
                  forums: forums.data![index],
                  onPressedLike: () =>
                      forumsCubit.likeForums(forums.data![index].forumId!),
                );
              },
            );
          },
        );
      },
    );
  }
}
