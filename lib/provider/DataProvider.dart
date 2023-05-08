import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FakeStoreProvider extends ChangeNotifier {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  bool firstCallLoaded = false;

  List list1 = [];

  Future<void> makeFirstCall() async {
    // await Future.delayed(const Duration(seconds: 2));
    list1 = (await _dio.get('products')).data as List;
    print(list1);
    firstCallLoaded = true;
    notifyListeners();
  }

}
