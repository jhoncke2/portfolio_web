import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/projects/project_box.dart';
import 'package:portfolio_web/home/presentation/projects/projects_row.dart';
import 'package:portfolio_web/home/presentation/upper_entry_animated.dart';
class ProjectsView extends StatelessWidget {
  final animationKey = GlobalKey();
  final ScrollController parentScrollController;
  ProjectsView({
    super.key,
    required this.parentScrollController
  });

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final screenSize = AppDimens.getScreenDimension(context);
    final projectsPerPage = 
      screenSize == ScreenSize.big?
        4:
        screenSize == ScreenSize.mid?
          3:
          2;
    final projects = blocState.info.projects;
    final nRows = (projects.length / projectsPerPage).ceil()
      + (projects.length % projectsPerPage > 0? 1: 0);
    return UpperEntryAnimated(
      parentScrollController: parentScrollController,
      child: Container(
        key: animationKey,
        height: AppDimens.heightPercentage(
          0.3 +
          (
            (
              screenSize == ScreenSize.big?
                0.5:
                screenSize == ScreenSize.mid?
                  0.35:
                  0.35
            ) * nRows
          ),
          context
        ),
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold
              )
            ),
            const Spacer(
              flex: 3
            ),
            ...(){
              final widgets = [];
              for(int i = 0; i < projects.length; i += projectsPerPage){
                final rowProjects = projects.sublist(
                  i,
                  projects.length >= i+projectsPerPage?
                    i+projectsPerPage:
                    projects.length
                );
                widgets.add(ProjectsRow(
                  projects: rowProjects,
                  maxItems: projectsPerPage
                ));
              }
              return widgets; 
            }(),
            const Spacer(
              flex: 5
            )
          ]
        )
      )
    );
  }
}