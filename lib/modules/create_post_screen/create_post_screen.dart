import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/create_post_screen/create_posts_widgets/add_post_button.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_states.dart';
import '../../shared/cubit/forums_cubit/forums_cubit.dart';
import '../auth_screens/auth_widgets/auth_button.dart';
import '../auth_screens/auth_widgets/auth_text_form_field.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForumsCubit forumsCubit = ForumsCubit.get(context);
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
        if (state is CreateForumsSuccessState) {
          Navigator.pop(context);
        } else if (state is CreateForumsErrorState) {
          showToast(msg: 'check your internet');
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('create new post'.tr().toCapitalized()),
              ),
              body: Container(
                width: screenW(context),
                padding: const EdgeInsets.all(paddingLarge),
                child: SingleChildScrollView(
                  child: Form(
                    key: forumsCubit.postKey,
                    child: Column(
                      children: [
                        if (forumsCubit.imagesBase64.isEmpty)
                          FetchPostImageButton(
                            onTap: () async {
                              await forumsCubit.pickImageForums();
                            },
                          )
                        else
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: InkWell(
                              onTap: () {
                                forumsCubit.pickImageForums();
                              },
                              child: Image.memory(
                                base64Decode(
                                  forumsCubit.imagesBase64[0],
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: paddingLarge * 1.5),
                        AuthTextFormField(
                          textEditingController:
                              forumsCubit.titleTextEditingController,
                          labelText: 'title',
                          hintText: '',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'title is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: paddingLarge * 1.5),
                        AuthTextFormField(
                          textEditingController:
                              forumsCubit.descriptionTextEditingController,
                          labelText: 'description',
                          hintText: '',
                          maxLines: 4,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'description is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: paddingLarge * 1.5),
                        AuthButton(
                          text: "post",
                          onPressed: () {
                            if (forumsCubit.postKey.currentState!.validate()) {
                              if (forumsCubit.imagesBase64.isNotEmpty) {
                                forumsCubit.createForums();
                              } else {
                                showToast(msg: 'image is required');
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is CreateForumsLoadingState) const LoadingScreen(),
          ],
        );
      },
    );
  }
}
