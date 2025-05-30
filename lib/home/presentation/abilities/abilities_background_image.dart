import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
class AbilitiesBackgroundImage extends StatefulWidget {
  final ScrollController parentScrollController;
  const AbilitiesBackgroundImage({
    super.key,
    required this.parentScrollController
  });

  @override
  State<AbilitiesBackgroundImage> createState() => _AbilitiesBackgroundImageState();
}

class _AbilitiesBackgroundImageState extends State<AbilitiesBackgroundImage> with TickerProviderStateMixin {
  final animationKey = GlobalKey();
  
  static const maxScale = 1.5;
  late double scale;
  late double previousScale;

  @override
  void initState() {
    super.initState();
    scale = maxScale;
    previousScale = maxScale;
    widget.parentScrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final screenHeight = AppDimens.heightPercentage(1, context);
    final centerDistance = _getCenterDistance(screenHeight);
    final visibility = _getVisibilityFactor(screenHeight);

    final newScale = maxScale - visibility/2;
    if (centerDistance > 0 && (scale - newScale).abs() > 0.001) {
      setState(() {
        previousScale = scale;
        scale = newScale;
      });
    }
  }

  double _getCenterDistance(double screenHeight){
    final context = animationKey.currentContext;
    if (context == null) return 0;
    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    return position.dy - (screenHeight / 4);
  }

  double _getVisibilityFactor(double screenHeight) {
    final centerDistance = _getCenterDistance(screenHeight).abs();
    final maxDistance = screenHeight * 1.25;
    final visibility = 1.0 - (centerDistance / maxDistance);
    return visibility.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = AppDimens.getScreenDimension(context);
    return SizedBox(
      width: AppDimens.widthPercentage((maxScale-0.575) * 0.9, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.widthPercentage(0.03, context)
        ),
        child: Align(
          alignment: Alignment.center,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: previousScale, end: scale),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            builder: (context, value, __) {
              return Opacity(
                opacity: value - (maxScale - 1.0),
                child: Transform.scale(
                  scale: value,
                  child: SizedBox(
                    width: AppDimens.widthPercentage(0.9, context),
                    child: Image.asset(
                      key: animationKey,
                      screenSize == ScreenSize.big?
                        'assets/drawables/abilities_landscape.png':
                        'assets/drawables/abilities_portrait.png',
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}