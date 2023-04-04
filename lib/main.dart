import 'package:flbloc_demo/my-cubit/number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my-cubit/app_observer.dart';

void main() {
  Bloc.observer = AppObserver();

  runApp(const NumberAppCubit());
}
