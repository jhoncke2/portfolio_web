import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
class AbilityBox extends StatelessWidget {
  final Ability ability;
  final bool hasLvl;
  final int maxNLetters;
  const AbilityBox({
    super.key,
    required this.ability,
    required this.hasLvl,
    required this.maxNLetters
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = AppDimens.heightPercentage(0.07, context);
    final containerWidth = imageSize * 1.7;
    //final bottomBoxHeight = AppDimens.heightPercentage(0.05, context);
    return Expanded(
      child: SizedBox(
        width: containerWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: containerWidth,
              height: containerWidth,
              decoration: BoxDecoration(
                //color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(5),
                /*
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiaryContainer
                )
                */
              ),
              child: Center(
                child: Image.asset(
                  ability.icon,
                  width: imageSize,
                  //color: Theme.of(context).colorScheme.primaryContainer,
                  //colorBlendMode: BlendMode.srcOut, //clear o color, modulate, srcATop, srcOut
                  fit: BoxFit.fitWidth,
                  errorBuilder: (_, __, ___) => Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Center(
                      child: Text(
                        'No Img'
                      )
                    )
                  )
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2
              ),
              child: Text(
                ability.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall
              ),
            ),
            if(hasLvl)
              ...[
                const Spacer(
                  flex: 1
                ),
                Align(
                  alignment: Alignment.center,
                  child: IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Theme.of(context).colorScheme.inversePrimary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.inversePrimary
                        )
                      ),
                      child: Center(
                        child: Text(
                          ability.lvl!,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                            fontSize: (
                              AppDimens.heightPercentage(1, context)
                            ) * 0.014
                          )
                        )
                      )
                    )
                  )
                )
              ]
          ]
        )
      ),
    );
  }
}