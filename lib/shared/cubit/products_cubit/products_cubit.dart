import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/products_model.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_states.dart';

import '../../../modules/products_screen/products_body/all_body.dart';
import '../../../modules/products_screen/products_body/plants_body.dart';
import '../../../modules/products_screen/products_body/seeds_body.dart';
import '../../../modules/products_screen/products_body/tools_body.dart';
import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  // ignore: type_annotate_public_apis
  static ProductsCubit get(context) => BlocProvider.of(context);

  List<String> tapText = [
    "all",
    "plants",
    "seeds",
    "tools",
  ];
  List<Widget> bodyOfHome = [
    const AllProductsBody(),
    const PlantsBody(),
    const SeedsBody(),
    const ToolsBody(),
  ];
  int indexOfTap = 0;

  void changeIndexOfTap(int index) {
    indexOfTap = index;
    emit(AnyState());
  }

  // ordered run function
  // SeedsModel? seedsModel;
  //
  // Future<void> getSeedsFirst() async {
  //   emit(GetProductsDataLoadingState());
  //   await DioHelper.getData(
  //     url: seedsEP,
  //     token: accessTokenConst,
  //   ).then((value) async {
  //     seedsModel = SeedsModel.fromJson(value.data);
  //     seedsCount.clear();
  //     for (final element in seedsModel!.data!) {
  //       seedsCount.add(0);
  //     }
  //     await getPlantsSecond();
  //   }).catchError((onError) {
  //     if (kDebugMode) {
  //       showToast(msg: 'error on seeds');
  //       printFullText(onError.toString());
  //     }
  //     emit(GetProductsDataErrorState(onError.toString()));
  //   });
  // }
  //
  // // TODO: All plants functions
  // PlantsModel? plantsModel;
  //
  // Future<void> getPlantsSecond() async {
  //   await DioHelper.getData(
  //     url: plantsEP,
  //     token: accessTokenConst,
  //   ).then((value) async {
  //     plantsModel = PlantsModel.fromJson(value.data);
  //     plantsCount.clear();
  //     for (final element in plantsModel!.data!) {
  //       plantsCount.add(0);
  //     }
  //     await getToolsThird();
  //   }).catchError((onError) {
  //     if (kDebugMode) {
  //       showToast(msg: 'error on plants');
  //     }
  //     emit(GetProductsDataErrorState(onError.toString()));
  //   });
  // }
  //
  // ToolsModel? toolsModel;
  //
  // Future<void> getToolsThird() async {
  //   await DioHelper.getData(
  //     url: toolsEP,
  //     token: accessTokenConst,
  //   ).then((value) async {
  //     toolsModel = ToolsModel.fromJson(value.data);
  //     toolsCount.clear();
  //     for (final element in toolsModel!.data!) {
  //       toolsCount.add(0);
  //     }
  //     emit(GetProductsDataSuccessState());
  //   }).catchError((onError) {
  //     if (kDebugMode) {
  //       showToast(msg: 'error on tools');
  //     }
  //     emit(GetProductsDataErrorState(onError.toString()));
  //   });
  // }

  ProductsModel? productsModel;
  List<ProductData> productPlant = [];
  List<ProductData> productSeed = [];
  List<ProductData> productTool = [];

  // TODO: Products Functions
  Future<void> getProducts() async {
    emit(GetProductsDataLoadingState());
    await DioHelper.getData(
      url: productsEP,
      token: accessTokenConst,
    ).then((value) async {
      productsModel = ProductsModel.fromJson(value.data);
      await clearAllProductLists();
      await fillAllProductLists();
      emit(GetProductsDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on products');
        printFullText(onError.toString());
      }
      emit(GetProductsDataErrorState(onError.toString()));
    });
  }

  Future<void> clearAllProductLists() async {
    allProductCount.clear();
    toolsCount.clear();
    plantsCount.clear();
    seedsCount.clear();
    productTool.clear();
    productPlant.clear();
    productSeed.clear();
  }

  Future<void> fillAllProductLists() async {
    for (final element in productsModel!.data!) {
      allProductCount.add(0);
      if (element.type!.toLowerCase() == 'plant') {
        productPlant.add(element);
        plantsCount.add(0);
      } else if (element.type!.toLowerCase() == 'seed') {
        productSeed.add(element);
        seedsCount.add(0);
      } else if (element.type!.toLowerCase() == 'tool') {
        productTool.add(element);
        toolsCount.add(0);
      }
    }
  }

  // TODO: functions of number of all product counter
  List<int> allProductCount = [];

  void addAllProductsFun(int index) {
    if (allProductCount[index] < 9) {
      allProductCount[index]++;
    }
    emit(AnyState());
  }

  void minusAllProductsFun(int index) {
    if (allProductCount[index] > 0) {
      allProductCount[index]--;
    }
    emit(AnyState());
  }

  // TODO: functions of number of plants counter

  List<int> plantsCount = [];

  void addPlantFun(int index) {
    if (plantsCount[index] < 9) {
      plantsCount[index]++;
    }
    emit(AnyState());
  }

  void minusPlantFun(int index) {
    if (plantsCount[index] > 0) {
      plantsCount[index]--;
    }
    emit(AnyState());
  }

  // TODO:functions of  number of seeds counter
  List<int> seedsCount = [];

  void addSeedsFun(int index) {
    if (seedsCount[index] < 9) {
      seedsCount[index]++;
    }
    emit(AnyState());
  }

  void minusSeedsFun(int index) {
    if (seedsCount[index] > 0) {
      seedsCount[index]--;
    }
    emit(AnyState());
  }

  // TODO:functions of number of tools counter
  List<int> toolsCount = [];

  void addToolsFun(int index) {
    if (toolsCount[index] < 9) {
      toolsCount[index]++;
    }
    emit(AnyState());
  }

  void minusToolsFun(int index) {
    if (toolsCount[index] > 0) {
      toolsCount[index]--;
    }
    emit(AnyState());
  }
}
