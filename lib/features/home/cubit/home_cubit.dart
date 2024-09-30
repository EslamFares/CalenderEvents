import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repo/home_repo.dart';
import '../../../core/network/api/api_service.dart';
import '../../../core/network/errors/server_failure.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //===========================
 HomeRepo homeRepo =  HomeRepo(ApiService.instance);
  init() {}
  //======================================================
    go() async {
    emit(HomeLoading());
    try {
      final res = await homeRepo.go();
      debugPrint('res: $res');

      emit(HomeSucess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(HomeError(e.userMassage));
      } else {
        emit(HomeError(e.toString()));
      }
    }
  }
}