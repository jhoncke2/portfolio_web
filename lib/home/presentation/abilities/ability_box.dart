import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';

class AbilityBox extends StatefulWidget {
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
  State<AbilityBox> createState() => _AbilityBoxState();
}

class _AbilityBoxState extends State<AbilityBox> {
  late bool _isHovered;
  @override
  void initState() {
    super.initState();
    _isHovered = false;
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = AppDimens.heightPercentage(0.07, context);
    final containerWidth = imageSize * 1.7;
    return Expanded(
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_){
          setState(() {
            _isHovered = false;
          });
        },
        child: Container(
          width: containerWidth,
          margin: const EdgeInsets.symmetric(
            horizontal: 15
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                width: _isHovered?
                  imageSize + (containerWidth-imageSize)/2:
                  containerWidth,
                height: _isHovered?
                  imageSize + (containerWidth-imageSize)/2:
                  containerWidth,
                decoration: BoxDecoration(
                  color: _isHovered?
                    Colors.white:
                    Colors.transparent,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Image.asset(
                    widget.ability.icon,
                    width: imageSize,
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
                  widget.ability.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall
                ),
              ),
              if(widget.hasLvl)
                ...[
                  const SizedBox(
                    height: 5
                  ),
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
                            widget.ability.lvl!,
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
      )
    );
  }
}