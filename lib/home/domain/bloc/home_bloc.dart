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
      }
    });
  }

  Future<void> _loadInfo(Emitter<HomeState> emit)async{
    final info = await repository.loadInfo();
    emit(OnInfoLoaded(info: info));
  }

  Future<void> _loadUrl(LoadUrl event)async{
    try{
      await urlNavigator.loadLink(event.url);
    }catch(exception){

    }
  }
}