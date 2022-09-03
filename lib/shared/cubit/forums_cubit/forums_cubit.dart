import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_states.dart';

import '../../../models/forums_model.dart';
import '../../../modules/forums_screen/forums_body/all_forums_body.dart';
import '../../../modules/forums_screen/forums_body/my_forums_body.dart';
import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';
import '../../components/constants.dart';
import '../../components/reuse_functions.dart';

class ForumsCubit extends Cubit<ForumsStates> {
  ForumsCubit() : super(ForumsInitialState());

  // ignore: type_annotate_public_apis
  static ForumsCubit get(context) => BlocProvider.of(context);

  // TODO: pick image
  Uint8List? fileBytes;
  List<String> imagesBase64 = [];
  List<String> forumsText = [
    "all forums",
    "my forums",
  ];
  List<Widget> forumsBody = [
    const AllForumsBody(),
    const MyForumsBody(),
  ];
  int indexOfForumsTap = 0;

  void changeIndexOfForumsTap(int index) {
    indexOfForumsTap = index;
    emit(AnyState());
  }

  // void pickImages() async {
  //   imagesBase64.clear();
  //   final ImagePicker picker = ImagePicker();
  //   final images = await picker.pickImage(source: ImageSource.gallery);
  //   if (images != null) {
  //     for (final image in images) {
  //       fileBytes = await image.readAsBytes();
  //       imagesBase64.add(base64Encode(fileBytes!));
  //     }
  //   }
  //   emit(AnyState());
  // }
  Future<void> pickImageForums() async {
    imagesBase64.clear();
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      fileBytes = await image.readAsBytes();
      imagesBase64.add(base64Encode(fileBytes!));
    }
    printFullText(imagesBase64[0]);
    emit(AnyState());
  }

  // TODO: get all forums
  ForumsModel? allForumsModel;

  Future<void> getAllForumsData() async {
    emit(GetAllForumsDataLoadingState());
    await DioHelper.getData(
      url: allForumsDataEP,
      token: accessTokenConst,
    ).then((value) async {
      allForumsModel = ForumsModel.fromJson(value.data);
      // allForumsIsLikeByMe.clear();
      // for (final bigElement in allForumsModel!.data!) {
      //   for (final element in bigElement.forumLikes!) {
      //     if (element.userId == profileDataModelInForums!.data!.userId) {
      //       allForumsIsLikeByMe.add(true);
      //     } else {
      //       allForumsIsLikeByMe.add(false);
      //     }
      //   }
      // }
      emit(GetAllForumsDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get all Forums');
        printFullText(onError.toString());
      }
      emit(GetAllForumsDataErrorState(onError.toString()));
    });
  }

  // TODO: get my forums
  ForumsModel? myForumsModel;

  Future<void> getMyForumsData() async {
    emit(GetMyForumsDataLoadingState());
    await DioHelper.getData(
      url: myForumsDataEP,
      token: accessTokenConst,
    ).then(
      (value) async {
        myForumsModel = ForumsModel.fromJson(value.data);
        // myForumsIsLikeByMe.clear();
        // for (final bigElement in myForumsModel!.data!) {
        //   for (final element in bigElement.forumLikes!) {
        //     if (element.userId == profileDataModelInForums!.data!.userId) {
        //       myForumsIsLikeByMe.add(true);
        //     } else {
        //       myForumsIsLikeByMe.add(false);
        //     }
        //   }
        // }
        emit(GetMyForumsDataSuccessState());
      },
    ).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get my Forums');
        printFullText(onError.toString());
      }
      emit(GetMyForumsDataErrorState(onError.toString()));
    });
  }

  // TODO: create forums
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  GlobalKey<FormState> postKey = GlobalKey<FormState>();

  Future<void> createForums() async {
    emit(CreateForumsLoadingState());
    await DioHelper.postData(
      endPoint: allForumsDataEP,
      token: accessTokenConst,
      data: {
        "title": titleTextEditingController.text,
        "description": descriptionTextEditingController.text,
        "imageBase64": "data:image/png;base64,${imagesBase64[0]}"
      },
    ).then((value) async {
      titleTextEditingController.clear();
      descriptionTextEditingController.clear();
      imagesBase64.clear();
      emit(CreateForumsSuccessState());
      await getAllForumsData();
      await getMyForumsData();
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on create forums');
        printFullText(onError.toString());
      }
      emit(CreateForumsErrorState(onError.toString()));
    });
  }

  // TODO: comment forums
  TextEditingController commentTextEditingController = TextEditingController();

  Future<void> commentForums() async {
    emit(CommentLoadingState());
    await DioHelper.postData(
      endPoint: commentForumsEP,
      token: accessTokenConst,
      data: {
        "comment": commentTextEditingController.text,
      },
      query: {"forumId": commentTextEditingController.text},
    ).then((value) async {
      commentTextEditingController.clear();
      await getAllForumsData();
      await getMyForumsData();
      emit(CommentSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on create comment');
        printFullText(onError.toString());
      }
      emit(CommentErrorState(onError.toString()));
    });
  }

  // TODO: Like Forums
  Future<void> likeForums(String forumId) async {
    emit(LikeLoadingState());
    printFullText(forumId);
    await DioHelper.postData(
      endPoint: "/api/v1/forums/$forumId/like",
      token: accessTokenConst,
      data: {},
      query: {"forumId": forumId},
    ).then((value) async {
      await getAllForumsData();
      await getMyForumsData();
      emit(LikeSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on create like');
        printFullText(onError.toString());
      }
      emit(LikeErrorState(onError.toString()));
    });
  }

  Future<void> getForumsScreen() async {
    await getAllForumsData();
    await getMyForumsData();
  }

  void clearForumsCubit() {
    allForumsModel = null;
    myForumsModel = null;
    imagesBase64.clear();
    titleTextEditingController.clear();
    descriptionTextEditingController.clear();
    commentTextEditingController.clear();
    //allForumsIsLikeByMe.clear();
    //myForumsIsLikeByMe.clear();
  }
}
