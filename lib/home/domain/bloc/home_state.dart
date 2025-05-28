part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OnLoadingInfo extends HomeState{

}

class OnInfoLoaded extends HomeState {
  final HomeInfo info;
  OnInfoLoaded({
    required this.info
  });
}
