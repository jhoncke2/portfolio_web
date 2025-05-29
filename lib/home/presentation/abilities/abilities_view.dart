import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/presentation/abilities/abilities_box.dart';

class AbilitiesView extends StatelessWidget {
  const AbilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final screenSize = AppDimens.getScreenDimension(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.1, context)
      ),
      child: IntrinsicWidth(
        child: Stack(
          children: [
            Image.asset(
              screenSize == ScreenSize.big?
                'assets/drawables/abilities_landscape.png':
                'assets/drawables/abilities_portrait.png',
              width: AppDimens.widthPercentage(0.9, context),
              fit: BoxFit.cover
            ),
            Container(
              width: AppDimens.widthPercentage(
                screenSize == ScreenSize.big?
                  0.65:
                  0.85,
                context
              ),
              padding: EdgeInsets.all(
                AppDimens.widthPercentage(0.05, context)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mis habilidades',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: screenSize == ScreenSize.big?
                        Theme.of(context).textTheme.titleLarge!.color:
                        Theme.of(context).colorScheme.secondary
                    )
                  ),
                  SizedBox(
                    height: AppDimens.heightPercentage(0.04, context)
                  ),
                  AbilitiesBox(
                    typeName: 'Desarrollo Móvil',
                    abilities: blocState.info.abilities.where(
                      (a) => a.type == AbilityType.mobile
                    ).toList(),
                    hasLvl: true
                  ),
                  SizedBox(
                    height: AppDimens.heightPercentage(0.02, context)
                  ),
                  AbilitiesBox(
                    typeName: 'Backend',
                    abilities: blocState.info.abilities.where(
                      (a) => a.type == AbilityType.backend
                    ).toList(),
                    hasLvl: true
                  ),
                  SizedBox(
                    height: AppDimens.heightPercentage(0.02, context)
                  ),
                  AbilitiesBox(
                    typeName: 'Herramientas',
                    abilities: blocState.info.abilities.where(
                      (a) => a.type == AbilityType.tool
                    ).toList(),
                    hasLvl: false
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}