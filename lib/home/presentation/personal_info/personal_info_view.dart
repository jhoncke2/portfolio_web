import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/user_site.dart';
import 'package:portfolio_web/home/presentation/personal_info/hexagon_clipper.dart';

class PersonalInfoView extends StatelessWidget {
  static const topBarHeight = 0.225;
  static const profilePhotoSize = topBarHeight * 0.9;
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final screenDimension = AppDimens.getScreenDimension(context);
    const borderWeight = 1.0;
    return IntrinsicHeight(
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: AppDimens.heightPercentage(1, context)
            ),
            child: Image.asset(
              'assets/drawables/header_2.png',
              width: AppDimens.widthPercentage(1, context),
              fit: screenDimension == ScreenSize.big?
                BoxFit.fitWidth:
                BoxFit.cover
            ),
          ),
          Container(
            width: AppDimens.widthPercentage(1, context),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.1)
            )
          ),
          Container(
            width: AppDimens.widthPercentage(1, context),
            height: AppDimens.heightPercentage(1, context),
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.heightPercentage(0.1, context)
            ),
            child: Column(
              children: [
                Spacer(
                  flex: screenDimension == ScreenSize.big?
                    7:
                    6
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: screenDimension == ScreenSize.big?
                        8:
                        7
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola, soy Jhonatan Amórtegui',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                        Text(
                          'Mobile Developer',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.heightPercentage(0.01, context)
                        ),
                        Row(
                          children: [
                            IntrinsicWidth(
                              child: MaterialButton(
                                onPressed: (){
                                  BlocProvider.of<HomeBloc>(context).add(LoadUrl(blocState.info.cvUrl));
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 12
                                ),
                                minWidth: AppDimens.heightPercentage(0.06, context),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.primary
                                  )
                                ),
                                focusColor: Theme.of(context).colorScheme.primary.withOpacity(1),
                                hoverColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'cv',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                    const SizedBox(
                                      width: 5
                                    ),
                                    Icon(
                                      FontAwesomeIcons.file,
                                      size: AppDimens.littleIcon(context) * 0.9,
                                      color: Theme.of(context).colorScheme.primary
                                    )
                                  ]
                                )
                              )
                            ),
                            const SizedBox(
                              width: 5
                            ),
                            TextButton(
                              onPressed: (){
                                BlocProvider.of<HomeBloc>(context).add(LoadUrl(
                                  blocState.info.sites.firstWhere(
                                    (s) => s.type == UserLkinkType.github
                                  ).url
                                ));
                              },
                              child: Row(
                                children: [
                                  const Text(
                                    'Github'
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.github,
                                    size: AppDimens.littleIcon(context),
                                  )
                                ]
                              )
                            )
                          ]
                        )
                      ]
                    ),
                    const Spacer(flex: 2),
                    Stack(
                      children: [
                        PhysicalShape(
                          clipper: HexagonClipper(),
                          color: Theme.of(context).colorScheme.primary,
                          shadowColor: Theme.of(context).shadowColor,
                          elevation: 10.0,
                          child: ClipPath(
                            clipper: HexagonClipper(),
                            child: SizedBox(
                              width: AppDimens.heightPercentage(profilePhotoSize, context) + borderWeight * 2,
                              height: AppDimens.heightPercentage(profilePhotoSize, context) + borderWeight * 2
                            )
                          )
                        ),
                        Positioned(
                          top: borderWeight,
                          left: borderWeight,
                          child: ClipPath(
                            clipper: HexagonClipper(),
                            child: Container(
                              width: AppDimens.heightPercentage(profilePhotoSize, context),
                              height: AppDimens.heightPercentage(profilePhotoSize, context),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(blocState.info.profileUrl), // o AssetImage si es local
                                  fit: BoxFit.cover,
                                )
                              )
                            )
                          )
                        )
                      ]
                    ),
                    const Spacer(flex: 1)
                  ]
                ),
                Spacer(
                  flex: screenDimension == ScreenSize.big?
                    5:
                    8
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}