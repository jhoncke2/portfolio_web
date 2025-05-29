import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/presentation/abilities/ability_box.dart';

class AbilitiesBox extends StatelessWidget {
  final String typeName;
  final List<Ability> abilities;
  final bool hasLvl;
  const AbilitiesBox({
    super.key,
    required this.typeName,
    required this.abilities,
    required this.hasLvl
  });

  @override
  Widget build(BuildContext context) {
    final screenDimension = AppDimens.getScreenDimension(context);
    return Container(
      width: AppDimens.widthPercentage(
        screenDimension == ScreenSize.big?
          0.6:
          0.9,
        context
      ),
      padding: EdgeInsets.all(
        AppDimens.heightPercentage(0.03, context)
      ),
      /*
      padding: EdgeInsets.only(
        left: AppDimens.widthPercentage(0.02, context),
        right: AppDimens.widthPercentage(0.04, context),
        top: AppDimens.heightPercentage(0.03, context),
        bottom: AppDimens.heightPercentage(0.03, context)
      ),
      */
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface
          .withOpacity(0.9)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            typeName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          Center(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: abilities.map<Widget>(
                    (a) => AbilityBox(
                      ability: a,
                      hasLvl: hasLvl,
                      maxNLetters: abilities.fold<int>(
                        0,
                        (last, ability){
                          final nLetters = ability.name.length;
                          return (nLetters > last)?
                            nLetters:
                            last;
                        }
                      )
                    )
                  ).toList()
              )
            )
          )
        ]
      )
    );
  }
}