import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';
import 'package:portfolio_web/home/presentation/projects/project_box.dart';

class ProjectsRow extends StatelessWidget {
  final List<Project> projects;
  final int maxItems;
  const ProjectsRow({
    super.key,
    required this.projects,
    required this.maxItems
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: projects.map<Widget>(
            (p) => ProjectBox(
              key: Key(p.name),
              project: p,
              width: AppDimens.widthPercentage(
                1 / maxItems,
                context
              ),
            )
          ).toList()
        ),
      )
    );
  }
}