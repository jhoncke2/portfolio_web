import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio_web/globals/firebase_options.dart';
import 'package:portfolio_web/home/data/home_repository.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/url_navitator.dart';

final sl = GetIt.instance;

Future<void> init()async{
  /* ****************************************
  * Common
  ***************************************** */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  sl.registerLazySingleton<UrlNavigator>(
    () => UrlNavigator()
  );

  /* ****************************************
  * Questionary
  ***************************************** */

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      db: FirebaseFirestore.instance
    )
  );
  sl.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      repository: sl<HomeRepository>(),
      urlNavigator: sl<UrlNavigator>()
    )
  );
}