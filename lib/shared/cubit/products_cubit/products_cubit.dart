import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/products_model.dart';
import 'package:la_vie/shared/api/local/app_box.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_states.dart';

import '../../../models/add_to_cart_model.dart';
import '../../../models/blogs_model.dart';
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

  List<String> tapTextOfProduct = [
    "all",
    "plants",
    "seeds",
    "tools",
  ];
  List<Widget> bodyOfProduct = [
    const AllProductsBody(),
    const PlantsBody(),
    const SeedsBody(),
    const ToolsBody(),
  ];
  int indexOfProductTap = 0;

  void changeIndexOfTap(int index) {
    indexOfProductTap = index;
    emit(AnyState());
  }

  // TODO: Blogs Functions
  BlogsModel? blogsModel;

  Future<void> getBlogs() async {
    emit(GetBlogsLoadingState());
    await DioHelper.getData(
      url: blogsEP,
      token: accessTokenConst,
    ).then((value) async {
      blogsModel = BlogsModel.fromJson(value.data);
      emit(GetBlogsSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on blogs');
        printFullText(onError.toString());
      }
      emit(GetBlogsErrorState(onError.toString()));
    });
  }

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

  // TODO: add to cart functions
  List<DataCard> listOfDataCart = [];
  List<int> cartCount = [];
  int totalCart = 0;

  Future<void> addToCart(DataCard data) async {
    await buyProduct(data.productId!, data.cartCount!);
    listOfDataCart.add(data);
    cartCount.clear();
    for (final ele in listOfDataCart) {
      cartCount.add(ele.cartCount!);
    }
    await AppBox.box.put(addToCartBox, listOfDataCart.toString());
    showToast(msg: 'added to card successfully');
    emit(GetCartSuccess());
  }

  Future<void> buyProduct(String id, int quantity) async {
    emit(BuyLoadingState());
    await DioHelper.postData(
      endPoint: buyProductEP,
      token: accessTokenConst,
      data: {
        "products": [
          {"productId": id, "quantity": quantity}
        ]
      },
    ).then((value) async {
      showToast(msg: "${value.data['message']}.\n Check your email.");
      emit(BuySuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        showToast(msg: 'error on buy');
        printFullText(onError.toString());
      }
      emit(BuyErrorState(onError.toString()));
    });
  }

  void addDataCartFun(int index) {
    if (cartCount[index] < 9) {
      cartCount[index]++;
    }
    emit(AnyState());
  }

  void minusDataCartFun(int index) {
    if (cartCount[index] > 1) {
      cartCount[index]--;
    }
    emit(AnyState());
  }

  void clearItemCart(int index) {
    cartCount.removeAt(index);
    listOfDataCart.removeAt(index);
    emit(AnyState());
  }

  List<ProductData> filterProductsList = [];
  String? filterProductsValue = "";

  void filterProducts(String value) {
    filterProductsValue = value;
    if (value.isNotEmpty) {
      filterProductsList = productsModel!.data!
          .where(
            (o) => "${o.name}".contains(value),
          )
          .toList();
      allFilterCount.clear();
      for (final ele in filterProductsList) {
        allFilterCount.add(0);
      }
      filterProductsList.isEmpty
          ? filterProductsValue = "not found"
          : filterProductsValue = value;
    } else {
      filterProductsList.clear();
      allFilterCount.clear();
    }
    emit(AnyState());
  }

  // TODO: functions of number of AllFilter counter
  List<int> allFilterCount = [];

  void addAllFilterFun(int index) {
    if (allFilterCount[index] < 9) {
      allFilterCount[index]++;
    }
    emit(AnyState());
  }

  void minusAllFilterFun(int index) {
    if (allFilterCount[index] > 0) {
      allFilterCount[index]--;
    }
    emit(AnyState());
  }
// Future<void> getLocalCart() async {
//   if (await AppBox.box.get(addToCartBox) != null) {
//     listOfDataCart = await AppBox.box.get(addToCartBox);
//   }
//   showToast(msg: 'get successfully');
//   emit(GetCartSuccess());
// }
}
