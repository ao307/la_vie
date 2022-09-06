import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/cubit/scan_cubit/scan_states.dart';

import '../../../models/products_model.dart';
import '../../../models/scan_model.dart';
import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';
import '../../components/constants.dart';
import '../../components/reuse_functions.dart';

class ScanCubit extends Cubit<ScanStates> {
  ScanCubit() : super(ScanInitialState());

  // ignore: type_annotate_public_apis
  static ScanCubit get(context) => BlocProvider.of(context);

  ScanModel? scanModel;
  String scanValue = "";

  Future<void> getScanData(String recieptsId) async {
    printFullText(recieptsId);
    // to stop request again
    if (scanValue != recieptsId) {
      scanValue = recieptsId;
      emit(ScanDataLoadingState());
      await DioHelper.getData(
        url: "/api/v1/user/reciepts/$recieptsId",
        token: accessTokenConst,
      ).then((value) async {
        scanModel = ScanModel.fromJson(value.data);
        showToast(msg: "${scanModel!.message}");
        emit(ScanDataSuccessState());
        getProductData(scanModel!.data!.products![0].productId!);
      }).catchError((onError) {
        if (kDebugMode) {
          showToast(msg: 'error on get scan');
          printFullText(onError.toString());
        }
        emit(ScanDataErrorState(onError.toString()));
      });
    }
  }

  ProductData? productData;

  Future<void> getProductData(String productId) async {
    emit(GetScanProductLoadingState());
    await DioHelper.getData(
      url: "/api/v1/products/$productId",
      token: accessTokenConst,
    ).then((value) async {
      productData = ProductData.fromJson(value.data['data']);
      emit(GetScanProductSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on get scan');
        printFullText(onError.toString());
      }
      emit(GetScanProductErrorState(onError.toString()));
    });
  }
}
