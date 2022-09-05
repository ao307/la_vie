import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/cubit/scan_cubit/scan_states.dart';

import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';
import '../../components/constants.dart';
import '../../components/reuse_functions.dart';

class ScanCubit extends Cubit<ScanStates> {
  ScanCubit() : super(ScanInitialState());

  // ignore: type_annotate_public_apis
  static ScanCubit get(context) => BlocProvider.of(context);

  Future<void> getScanData() async {
    emit(ScanDataLoadingState());
    await DioHelper.getData(
      url: currentUserDataEP,
      token: accessTokenConst,
    ).then((value) async {
      emit(ScanDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get scan');
        printFullText(onError.toString());
      }
      emit(ScanDataErrorState(onError.toString()));
    });
  }
}
