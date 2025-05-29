part of 'home_bloc.dart';

sealed class HomeEvent {}

class LoadInfo extends HomeEvent {

}

class LoadUrl extends HomeEvent {
  final String url;
  LoadUrl(this.url);
}