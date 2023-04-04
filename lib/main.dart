import 'package:flbloc_demo/app/app.dart';
import 'package:flbloc_demo/my-cubit/number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flbloc_demo/store/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppObserver();

  runApp(const NumberAppCubit());
}
