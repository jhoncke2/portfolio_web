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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.1, context)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Mis habilidades',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold
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
    );
  }
}