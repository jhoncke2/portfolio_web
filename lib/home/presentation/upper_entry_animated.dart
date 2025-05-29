import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';

class UpperEntryAnimated extends StatefulWidget {
  final ScrollController parentScrollController;
  final Widget child;
  const UpperEntryAnimated({
    super.key,
    required this.parentScrollController,
    required this.child
  });

  @override
  State<UpperEntryAnimated> createState() => _UpperEntryAnimatedState();
}

class _UpperEntryAnimatedState extends State<UpperEntryAnimated> with TickerProviderStateMixin {

  late bool _widgetArrivedToPoint;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _offsetAnimation;
  static const _screenInitDistance = 150.0;

  @override
  void initState() {
    super.initState();
    _widgetArrivedToPoint = false;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550), // velocidad del cambio
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _offsetAnimation = Tween<double>(begin: _screenInitDistance, end: 0.0).animate(_animationController);

    widget.parentScrollController.addListener(_onScroll);
  }

  double _getCenterDistance(double screenHeight){
    final context = (widget.child.key as GlobalKey).currentContext;
    if (context == null) return 0;
    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    return position.dy - (screenHeight / 2);
  }

  void _onScroll(){
    final screenHeight = AppDimens.heightPercentage(1, context);
    final centerDistance = _getCenterDistance(screenHeight);

    if(centerDistance > 0 && centerDistance <= ((screenHeight/2)+_screenInitDistance-200) && !_widgetArrivedToPoint){
      _opacityAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInCubic,
      ));

      _offsetAnimation = Tween<double>(
        begin: _screenInitDistance,
        end: 0,
      ).animate(CurvedAnimation(
        parent: _animationController,
        //curve: Curves.easeOut,
        curve: Curves.easeInOutCirc
      ));

      if(!_animationController.isAnimating){
        _animationController.forward(from: 0.0);
      }
      _widgetArrivedToPoint = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _widgetArrivedToPoint? _offsetAnimation.value: _screenInitDistance),
        child: Opacity(
          opacity: _widgetArrivedToPoint? _opacityAnimation.value: 0,
          child: widget.child
        )
      )
      );

  }
}