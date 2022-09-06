import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/cubit/profile_cubit/profile_states.dart';

import '../../../models/profile_data_model.dart';
import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';
import '../../components/constants.dart';
import '../../components/reuse_functions.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  // ignore: type_annotate_public_apis
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileDataModel? profileDataModel;

  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    await DioHelper.getData(
      url: currentUserDataEP,
      token: accessTokenConst,
    ).then((value) async {
      profileDataModel = ProfileDataModel.fromJson(value.data);
      emit(GetProfileDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get profile');
        printFullText(onError.toString());
      }
      emit(GetProfileDataErrorState(onError.toString()));
    });
  }

  Future<void> updateProfileName(String firstName, String lastName) async {
    emit(GetProfileDataLoadingState());
    await DioHelper.patchData(
      endPoint: currentUserDataEP,
      token: accessTokenConst,
      data: {"firstName": firstName, "lastName": lastName},
    ).then((value) async {
      emit(GetProfileDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get updateProfileName');
        printFullText(onError.toString());
      }
      emit(GetProfileDataErrorState(onError.toString()));
    });
  }

  Future<void> updateProfileEmail(String email) async {
    emit(UpdateProfileDataLoadingState());
    await DioHelper.patchData(
      endPoint: currentUserDataEP,
      token: accessTokenConst,
      data: {
        "email": email,
      },
    ).then((value) async {
      emit(UpdateProfileDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get updateProfileName');
        printFullText(onError.toString());
      }
      emit(UpdateProfileDataErrorState(onError.toString()));
    });
  }
}
