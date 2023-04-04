enum NumberRequest {
  unknown,
  requestInProgress,
  requestSuccess,
  requestFailure,
}

class NumberState {
  const NumberState({
    this.number = 0,
    this.productsStatus = NumberRequest.unknown,
  });

  final int number;
  final NumberRequest productsStatus;

  NumberState copyWith({
    int? number,
    NumberRequest? productsStatus,
  }) =>
      NumberState(
        productsStatus: productsStatus ?? this.productsStatus,
        number: number ?? this.number
      );
}
