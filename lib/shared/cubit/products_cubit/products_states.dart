abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

// TODO: Any State: for simple states
class AnyState extends ProductsStates {}

// TODO: get home data
class GetProductsDataLoadingState extends ProductsStates {}

class GetProductsDataSuccessState extends ProductsStates {}

class GetProductsDataErrorState extends ProductsStates {
  final String onError;
  GetProductsDataErrorState(this.onError);
}
