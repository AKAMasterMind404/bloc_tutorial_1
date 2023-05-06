import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FakeStoreProvider extends ChangeNotifier {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  bool firstCallLoaded = false;
  bool secondCallLoaded = false;
  bool thirdCallLoaded = false;

  List list1 = [];
  List list2 = [];
  List list3 = [];

  Future<void> makeFirstCall() async {
    // await Future.delayed(const Duration(seconds: 2));
    list1 = (await _dio.get('products')).data as List;
    print(list1);
    firstCallLoaded = true;
    notifyListeners();
  }

  Future<void> makeSecondCall() async {
    // await Future.delayed(const Duration(seconds: 2));
    list2 = (await _dio.get('products')).data as List;
    print(list2);
    secondCallLoaded = true;
    notifyListeners();
  }

  Future<void> makeThirdCall() async {
    // await Future.delayed(const Duration(seconds: 2));
    list3 = (await _dio.get('products')).data as List;
    print(list3);
    thirdCallLoaded = true;
    notifyListeners();
  }
}
