import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repo/{{name.snakeCase()}}_repo.dart';
import '../../../core/network/api/api_service.dart';
import '../../../core/network/errors/server_failure.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}Initial());
  static {{name.pascalCase()}}Cubit get(context) => BlocProvider.of(context);
  //===========================
 {{name.pascalCase()}}Repo {{name.snakeCase()}}Repo =  {{name.pascalCase()}}Repo(ApiService.instance);
  init() {}
  //======================================================
    go() async {
    emit({{name.pascalCase()}}Loading());
    try {
      final res = await {{name.snakeCase()}}Repo.go();
      debugPrint('res: $res');

      emit({{name.pascalCase()}}Sucess());
    } catch (e) {
      if (e is ServerFailure) {
        emit({{name.pascalCase()}}Error(e.userMassage));
      } else {
        emit({{name.pascalCase()}}Error(e.toString()));
      }
    }
  }
}