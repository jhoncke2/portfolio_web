part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OnLoadingInfo extends HomeState{

}

class OnInfoLoaded extends HomeState {
  final HomeInfo info;
  final TextEditingController messageName;
  final TextEditingController messageEmail;
  final TextEditingController messageWhatsapp;
  final TextEditingController messageBody;

  OnInfoLoaded({
    required this.info,
    required this.messageName,
    required this.messageEmail,
    required this.messageWhatsapp,
    required this.messageBody
  });
}
