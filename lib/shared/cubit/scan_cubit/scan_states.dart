abstract class ScanStates {}

class ScanInitialState extends ScanStates {}

// TODO: Any State: for simple states
class AnyState extends ScanStates {}

// TODO: get home data
class  ScanDataLoadingState extends ScanStates {}

class  ScanDataSuccessState extends ScanStates {}

class  ScanDataErrorState extends ScanStates {
  final String onError;
   ScanDataErrorState(this.onError);
}

// TODO: get home data
class  GetScanProductLoadingState extends ScanStates {}

class  GetScanProductSuccessState extends ScanStates {}

class  GetScanProductErrorState extends ScanStates {
  final String onError;
  GetScanProductErrorState(this.onError);
}
