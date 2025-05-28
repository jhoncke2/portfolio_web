import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/home/data/home_repository.dart';
import 'package:portfolio_web/home/domain/entities/home_info.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc({
    required this.repository
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit)async{
      if(event is LoadInfo){
        await _loadInfo(emit);
      }
    });
  }

  Future<void> _loadInfo(Emitter<HomeState> emit)async{
    final info = await repository.loadInfo();
    emit(OnInfoLoaded(info: info));
  }
}