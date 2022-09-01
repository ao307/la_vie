import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/seeds_model.dart';
import 'package:la_vie/modules/home_screen/home_body/tools_body.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/home_screen_cubit/home_screen_states.dart';

import '../../../models/tools_model.dart';
import '../../../modules/home_screen/home_body/plants_body.dart';
import '../../../modules/home_screen/home_body/seeds_body.dart';
import '../../api/end_points.dart';
import '../../api/remote/dio_helper.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  // ignore: type_annotate_public_apis
  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List<String> tapText = [
    "all",
    "plants",
    "seeds",
    "tools",
  ];
  List<Widget> bodyOfHome = [
    Container(),
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
  SeedsModel? seedsModel;
  List<int> seedsCount = [];

  Future<void> getSeedsFirst() async {
    emit(GetHomeDataLoadingState());
    await DioHelper.getData(
      url: seedsEP,
      token: accessTokenConst,
    ).then((value) async {
      seedsModel = SeedsModel.fromJson(value.data);
      seedsCount.clear();
      for (final element in seedsModel!.data!) {
        seedsCount.add(0);
      }
      await getPlantsSecond();
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on seeds');
        printFullText(onError.toString());
      }
      emit(GetHomeDataErrorState(onError.toString()));
    });
  }

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

  // TODO: All plants functions
  PlantsModel? plantsModel;
  List<int> plantsCount = [];

  Future<void> getPlantsSecond() async {
    await DioHelper.getData(
      url: plantsEP,
      token: accessTokenConst,
    ).then((value) async {
      plantsModel = PlantsModel.fromJson(value.data);
      plantsCount.clear();
      for (final element in plantsModel!.data!) {
        plantsCount.add(0);
      }
      await getToolsThird();
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on plants');
      }
      emit(GetHomeDataErrorState(onError.toString()));
    });
  }

  void addPlantFun(int index) {
    if (plantsCount[index] < 9) {
      plantsCount[index]++;
    }    emit(AnyState());
  }

  void minusPlantFun(int index) {
    if (plantsCount[index] > 0) {
      plantsCount[index]--;
    }
    emit(AnyState());
  }

  ToolsModel? toolsModel;
  List<int> toolsCount = [];

  Future<void> getToolsThird() async {
    await DioHelper.getData(
      url: toolsEP,
      token: accessTokenConst,
    ).then((value) async {
      toolsModel = ToolsModel.fromJson(value.data);
      toolsCount.clear();
      for (final element in toolsModel!.data!) {
        toolsCount.add(0);
      }
      emit(GetHomeDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on tools');
      }
      emit(GetHomeDataErrorState(onError.toString()));
    });
  }

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
