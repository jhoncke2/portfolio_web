import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/home/data/home_repository.dart';
import 'package:portfolio_web/home/domain/entities/home_info.dart';
import 'package:portfolio_web/home/domain/url_navitator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  final UrlNavigator urlNavigator;
  HomeBloc({
    required this.repository,
    required this.urlNavigator
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit)async{
      if(event is LoadInfo){
        await _loadInfo(emit);
      }else if(event is LoadUrl){
        await _loadUrl(event);
      }else if(event is SendEmail){
        await _sendEmail(emit);
      }
    });
  }

  Future<void> _loadInfo(Emitter<HomeState> emit)async{
    final info = await repository.loadInfo();
    emit(OnInfoLoaded(
      info: info,
      messageName: TextEditingController(),
      messageEmail: TextEditingController(),
      messageWhatsapp: TextEditingController(),
      messageBody: TextEditingController()
    ));
  }

  Future<void> _loadUrl(LoadUrl event)async{
    await urlNavigator.loadLink(event.url);
  }

  Future<void> _sendEmail(Emitter<HomeState> emit)async{
    final initState = state as OnInfoLoaded;
    final email = initState.messageEmail.text;
    final whatsapp = initState.messageWhatsapp.text;
    final name = initState.messageName.text;
    final body = initState.messageBody.text;
    final contactLine = (email.isNotEmpty || whatsapp.isNotEmpty)?
      '\n\nPuedes contactarte conmigo ${email.isNotEmpty? "al correo $email ${(whatsapp.isNotEmpty? "y ": "")}": ""}${whatsapp.isNotEmpty? "al whatsapp $whatsapp": ""}' :
      '';
    await urlNavigator.sendMessage(
      initState.info.email,
      'Hola, Jhonatan. Soy $name.\n$body$contactLine'
    );
  }
}