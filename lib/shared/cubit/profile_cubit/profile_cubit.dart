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
}
