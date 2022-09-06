abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

// TODO: Any State: for simple states
class AnyState extends ProductsStates {}

class GetCartSuccess extends ProductsStates {}

// TODO: get Products data
class GetProductsDataLoadingState extends ProductsStates {}

class GetProductsDataSuccessState extends ProductsStates {}

class GetProductsDataErrorState extends ProductsStates {
  final String onError;

  GetProductsDataErrorState(this.onError);
}

// TODO: get Blogs data
class GetBlogsLoadingState extends ProductsStates {}

class GetBlogsSuccessState extends ProductsStates {}

class GetBlogsErrorState extends ProductsStates {
  final String onError;

  GetBlogsErrorState(this.onError);
}

// TODO: Buy data
class BuyLoadingState extends ProductsStates {}

class BuySuccessState extends ProductsStates {}

class BuyErrorState extends ProductsStates {
  final String onError;

  BuyErrorState(this.onError);
}
