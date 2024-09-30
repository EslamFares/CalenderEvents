import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../cubit/{{name.snakeCase()}}_cubit.dart';
class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{name.pascalCase()}}Cubit(),
      child: BlocConsumer<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = {{name.pascalCase()}}Cubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text("{{name.pascalCase()}}Screen")),
            body: const Center(
              child: Text("{{name.pascalCase()}}Screen"),
            ),
          );
        },
      ),
    );
  }
}