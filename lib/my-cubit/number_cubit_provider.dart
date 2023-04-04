import 'package:flbloc_demo/my-cubit/NumberState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(const NumberState());

  checkState(){
    if(state.productsStatus == NumberRequest.requestInProgress){
     print("Hey! HPold up!");
    }

    return false;
  }

  add() async {
    emit(state.copyWith(productsStatus: NumberRequest.requestInProgress));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
        number: state.number + 1,
        productsStatus: NumberRequest.requestSuccess));
  }

  subtract() async {
    emit(state.copyWith(productsStatus: NumberRequest.requestInProgress));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
        number: state.number - 1,
        productsStatus: NumberRequest.requestSuccess));
  }
}
