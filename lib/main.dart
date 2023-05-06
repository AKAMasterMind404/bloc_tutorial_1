import 'package:flbloc_demo/provider/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MaterialApp(
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FakeStoreProvider())
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _callAllApis();
    super.initState();
  }

  _callAllApis() async {
    FakeStoreProvider _provider = context.read<FakeStoreProvider>();

    await _provider.makeFirstCall();
    await _provider.makeSecondCall();
    await _provider.makeThirdCall();
  }

  @override
  Widget build(BuildContext context) {
    FakeStoreProvider obj = context.watch<FakeStoreProvider>();
    print(obj.firstCallLoaded);
    print(obj.secondCallLoaded);
    print(obj.thirdCallLoaded);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: const [
                Text("Call 1 Data!"),
                Text("Call 2 Data!"),
                Text("Call 3 Data!"),
              ],
            ),
            Row(
              children: [
                obj.firstCallLoaded ? const Text("Yay") : const Text("Loading ..."),
                obj.secondCallLoaded ? const Text("Yay") : const Text("Loading ..."),
                obj.thirdCallLoaded ? const Text("Yay") : const Text("Loading ..."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
