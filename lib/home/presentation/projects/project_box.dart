import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';
class ProjectBox extends StatefulWidget {
  final Project project;
  const ProjectBox({
    super.key,
    required this.project
  });

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  late bool _isOnHover;

  @override
  void initState() {
    super.initState();
    _isOnHover = false;
  }
  
  @override
  Widget build(BuildContext context) {
    final imageWidth = AppDimens.heightPercentage(0.5, context);
    final borderRadius = AppDimens.widthPercentage(0.012, context);
    return Expanded(
      child: IntrinsicHeight(
        child: MouseRegion(
          onEnter: (_){
            setState((){
              _isOnHover = true;
            });
          },
          onExit: (_){
            setState((){
              _isOnHover = false;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate,
            width: imageWidth * (_isOnHover? 1.1: 1),
            margin: EdgeInsets.symmetric(
              horizontal: AppDimens.heightPercentage(0.02, context)
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                if(_isOnHover)
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    offset: const Offset(0, 2),
                    blurRadius: 16,
                    spreadRadius: 0.5
                  )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    widget.project.mainImage,
                    width: imageWidth,
                    cacheWidth: AppDimens.heightPercentage(0.6, context).ceil(),
                    height: imageWidth * 0.6,
                    cacheHeight: AppDimens.heightPercentage(0.4, context).ceil(),
                    fit: BoxFit.cover
                  )
                ),
                Expanded(
                  child: Container(
                    width: imageWidth,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      //color: Theme.of(context).colorScheme.primaryContainer,
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.name,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(
                          height: 10
                        ),
                        Text(
                          widget.project.shortDescription,
                          style: Theme.of(context).textTheme.labelSmall
                        ),
                        const SizedBox(
                          height: 10
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: widget.project.technologies.map<Widget>(
                            (t) => Container(
                              margin: const EdgeInsets.only(
                                right: 5
                              ),
                              child: Image.asset(
                                t,
                                width: AppDimens.heightPercentage(0.025, context),
                              ),
                            )
                          ).toList()
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: widget.project.links.map(
                            (d) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4
                                ),
                                child: InkWell(
                                  onTap: (){
                                    BlocProvider.of<HomeBloc>(context).add(LoadUrl(
                                      d.url
                                    ));
                                  },
                                  child: d.type == ProyectLinkType.playstore?
                                    Icon(
                                      FontAwesomeIcons.googlePlay,
                                      color: Theme.of(context).colorScheme.primary,
                                      size: AppDimens.normalIcon(context)
                                    ): d.type == ProyectLinkType.appstore?
                                      Icon(
                                        FontAwesomeIcons.appStoreIos,
                                        color: Theme.of(context).colorScheme.primary,
                                        size: AppDimens.normalIcon(context)
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
                                                fontSize: AppDimens.heightPercentage(0.015, context)
                                              )
                                            ),
                                            const SizedBox(
                                              width: 3
                                            ),
                                            Icon(
                                              FontAwesomeIcons.github,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: AppDimens.littleIcon(context)
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
                )
              ]
            )
          )
        )
      )
    );
  }
}