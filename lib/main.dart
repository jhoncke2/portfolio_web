import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/globals/injection_container.dart';
import 'package:portfolio_web/globals/theme.dart';
import 'package:portfolio_web/globals/util.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/abilities_view.dart';
import 'package:portfolio_web/home/presentation/personal_info_view.dart';
import 'package:portfolio_web/home/presentation/projects_view.dart';
import './globals/injection_container.dart' as ic;

Future<void> main()async{
  await ic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: theme.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const topBarHeight = 0.225;
  static const profilePhotoSize = topBarHeight * 0.9;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: Scaffold(
        body: SizedBox(
          height: AppDimens.heightPercentage(1, context),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (blocContext, blocState) {
              _callPostFrameCallBacks(blocContext, blocState);
              return blocState is OnInfoLoaded?
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimens.widthPercentage(1, blocContext),
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimens.heightPercentage(0.1, context)
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(blocContext).colorScheme.surface
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PersonalInfoView(),
                            SizedBox(
                              width: AppDimens.widthPercentage(0.05, context),
                            ),
                            Container(
                              width: AppDimens.heightPercentage(profilePhotoSize, blocContext),
                              height: AppDimens.heightPercentage(profilePhotoSize, blocContext),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.onPrimary
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  blocState.info.profileUrl,
                                  width: profilePhotoSize,
                                  height: profilePhotoSize,
                                  fit: BoxFit.fill,
                                  errorBuilder: (_, __, ___) => const Text('Error'),
                                )
                              )
                            )
                          ]
                        )
                      ),
                      SizedBox(
                        height: AppDimens.heightPercentage(0.09, context),
                      ),
                      const ProjectsView(),
                      SizedBox(
                        height: AppDimens.heightPercentage(0.09, context),
                      ),
                      const AbilitiesView(),
                      SizedBox(
                        height: AppDimens.heightPercentage(0.05, context)
                      )
                    ]
                  ),
                ): Container();
            }
          )
        )
      )
    );
  }

  void _callPostFrameCallBacks(BuildContext context, HomeState state){
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(state is HomeInitial){
        BlocProvider.of<HomeBloc>(context).add(LoadInfo());
      }
    });
  }
}
