import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/presentation/ability_box.dart';
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
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(
          left: AppDimens.widthPercentage(0.02, context),
          right: AppDimens.widthPercentage(0.04, context),
          top: 0,
          bottom: AppDimens.heightPercentage(0.05, context)
        ),
        decoration: BoxDecoration(
          //color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Theme.of(context).scaffoldBackgroundColor
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              child: Text(
                typeName,
                style: Theme.of(context).textTheme.bodyMedium
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
                        ),
                      )
                    ).toList()
                ),
              ),
            )
          ]
        )
      )
    );
  }
}