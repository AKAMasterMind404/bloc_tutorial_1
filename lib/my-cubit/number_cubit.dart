import 'package:flbloc_demo/my-cubit/NumberState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'number_cubit_provider.dart';

class NumberAppCubit extends StatelessWidget {
  const NumberAppCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => NumberCubit(),
        child: const _NumberAppView(),
      ),
    );
  }
}

class _NumberAppView extends StatelessWidget {
  const _NumberAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: () async {
            final cubit = context.read<NumberCubit>();
            if(cubit.state.productsStatus == NumberRequest.requestInProgress) {
              print("Hold UP!");
              return;
            }

            cubit.add();
          }, child: const Icon(Icons.add)),
          FloatingActionButton(
              onPressed: () async {
                final cubit = context.read<NumberCubit>();
                if(cubit.state.productsStatus == NumberRequest.requestInProgress) {
                  print("Hold UP!");
                  return;
                }

                cubit.subtract();
              }, child: const Icon(Icons.remove)),
        ],
      ),
      body: Center(
        child: BlocConsumer<NumberCubit, NumberState>(
          // listenWhen: (previous, current) {
          //   return previous.number != current.number;
          // },
          listener: (context, state) {},
          builder: (context, state) {
            int number = context.read<NumberCubit>().state.number;
            NumberRequest requestState = context.read<NumberCubit>().state.productsStatus;

            switch(requestState) {
              case NumberRequest.requestInProgress:
                return const CircularProgressIndicator();
              case NumberRequest.requestSuccess:
                return Text(
                  "$number",
                  style: const TextStyle(fontSize: 24),
                );
              default:
                return const Text(
                  "Something went wrong!",
                  style: TextStyle(fontSize: 24),
                );
            }
          },
        ),
      ),
    );
  }
}
