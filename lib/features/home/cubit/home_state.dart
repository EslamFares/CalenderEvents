part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {}

class HomeError extends HomeState {
    final String errorMessage;
  HomeError(this.errorMessage);
}