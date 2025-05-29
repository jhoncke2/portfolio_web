import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/projects/project_box.dart';
class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Container(
      height: AppDimens.heightPercentage(0.9, context),
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.05, context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(
            flex: 5
          ),
          Text(
            'Algunos de mis proyectos',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          const Spacer(
            flex: 3
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: blocState.info.projects.map<Widget>(
                (p) => ProjectBox(
                  key: Key(p.name),
                  project: p
                )
              ).toList()
            )
          ),
          const Spacer(
            flex: 5
          )
        ]
      )
    );
  }
}