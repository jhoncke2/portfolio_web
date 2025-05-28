import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';
class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.05, context)
      ),
      child: Column(
        children: [
          Text(
            'Algunos de mis proyectos',
            style: Theme.of(context).textTheme.titleMedium
          ),
          SizedBox(
            height: AppDimens.heightPercentage(0.07, context)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: blocState.info.projects.map<Widget>(
              (p) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.heightPercentage(0.02, context)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)
                      ),
                      child: Image.asset(
                        p.mainImage,
                        width: AppDimens.heightPercentage(0.22, context),
                        //cacheWidth: AppDimens.heightPercentage(0.6, context).ceil(),
                        height: AppDimens.heightPercentage(0.13, context),
                        //cacheHeight: AppDimens.heightPercentage(0.4, context).ceil(),
                        fit: BoxFit.cover
                      )
                    ),
                    Container(
                      width: AppDimens.heightPercentage(0.22, context),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.name,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondaryContainer
                            )
                          ),
                          Text(
                            p.shortDescription,
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: AppDimens.tinyText(context)
                            )
                          ),
                          const SizedBox(
                            height: 5
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: p.technologies.map<Widget>(
                              (t) => Image.asset(
                                t,
                                width: AppDimens.heightPercentage(0.02, context),
                              )
                            ).toList()
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: p.links.map(
                              (d) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 1
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                  
                                    },
                                    child: d.type == LinkType.playstore?
                                      Icon(
                                        FontAwesomeIcons.googlePlay,
                                        color: Theme.of(context).colorScheme.primary,
                                        size: AppDimens.littleIcon(context)
                                      ): d.type == LinkType.appstore?
                                        Icon(
                                          FontAwesomeIcons.appStoreIos,
                                          color: Theme.of(context).colorScheme.primary,
                                          size: AppDimens.littleIcon(context)
                                        ): Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context).colorScheme.primary
                                            ),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Código',
                                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                                  color: Theme.of(context).colorScheme.primary,
                                                  fontSize: AppDimens.heightPercentage(0.013, context)
                                                )
                                              ),
                                              const SizedBox(
                                                width: 3
                                              ),
                                              Icon(
                                                FontAwesomeIcons.github,
                                                color: Theme.of(context).colorScheme.primary,
                                                size: AppDimens.tinyIcon(context)
                                              )
                                            ]
                                          )
                                        )
                
                                  )
                                )
                            ).toList()
                          )
                        ]
                      )
                    )
                  ]
                ),
              )
            ).toList()
          )
        ]
      ),
    );
  }
}