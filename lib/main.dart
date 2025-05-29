import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/globals/injection_container.dart';
import 'package:portfolio_web/globals/theme.dart';
import 'package:portfolio_web/globals/util.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/abilities/abilities_view.dart';
import 'package:portfolio_web/home/presentation/job_experience.dart';
import 'package:portfolio_web/home/presentation/footer/footer.dart';
import 'package:portfolio_web/home/presentation/personal_info/personal_info_view.dart';
import 'package:portfolio_web/home/presentation/projects/projects_view.dart';
import './globals/injection_container.dart' as ic;

Future<void> main()async{
  await ic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Raleway", "Orbitron");
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

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

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
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const PersonalInfoView(),
                      const ProjectsView(),
                      JobExperienceView(
                        parentScrollController: scrollController
                      ),
                      const AbilitiesView(),
                      const Footer(),
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
