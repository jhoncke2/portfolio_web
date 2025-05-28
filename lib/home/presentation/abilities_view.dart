import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/presentation/abilities_box.dart';
class AbilitiesView extends StatelessWidget {
  const AbilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Mis Habilidades',
              style: Theme.of(context).textTheme.titleMedium
            )
          ),
          SizedBox(
            height: AppDimens.heightPercentage(0.06, context)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2
              ),
              SizedBox(
                width: AppDimens.widthPercentage(0.3, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: blocState.info.abilitiesInfo.map(
                    (a) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppDimens.heightPercentage(0.01, context)
                      ),
                      child: Text(
                        a,
                        style: Theme.of(context).textTheme.bodySmall
                      ),
                    )
                  ).toList()
                )
              ),
              const Spacer(
                flex: 1
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
              const Spacer(
                flex: 2
              )
            ]
          )
        ]
      )
    );
  }
}