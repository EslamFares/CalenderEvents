import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../cubit/home_cubit.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text("HomeScreen")),
            body: const Center(
              child: Text("HomeScreen"),
            ),
          );
        },
      ),
    );
  }
}