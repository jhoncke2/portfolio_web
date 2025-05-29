import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';

class JobExperienceView extends StatefulWidget {
  final ScrollController parentScrollController;

  const JobExperienceView({
    super.key,
    required this.parentScrollController
  });

  @override
  State<JobExperienceView> createState() => _JobExperienceViewState();
}

class _JobExperienceViewState extends State<JobExperienceView> {
  final animationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.parentScrollController.addListener((){
      setState(() {
        
      });
    });
  }

  double _getVisibilityFactor(double screenHeight) {
    final centerDistance = _getCenterDistance(screenHeight).abs();
    final maxDistance = screenHeight * 0.6;
    final visibility = 1.0 - (centerDistance / maxDistance);

    return visibility.clamp(0.0, 1.0);
  }

  double _getCenterDistance(double screenHeight){
    final context = animationKey.currentContext;
    if (context == null) return 0;
    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    return position.dy - (screenHeight / 2);
  }

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final screenDimension = AppDimens.getScreenDimension(context);
    final screenHeight = AppDimens.heightPercentage(1, context);
    final visibility = _getVisibilityFactor(screenHeight);
    final centerDistance = _getCenterDistance(screenHeight);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.25, context)
      ),
      child: Transform.translate(
        offset: Offset(0, (1 - (centerDistance > 0? visibility: 1)) * (screenHeight*0.25)),
        child: Opacity(
          opacity: centerDistance > 0? visibility : 1,
          child: Container(
            key: animationKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppDimens.widthPercentage(
                    screenDimension == ScreenSize.big?
                      0.3:
                      0.5,
                    context
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: AppDimens.heightPercentage(0.01, context)
                        ),
                        child: Text(
                          'Sobre mi experiencia laboral',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      ...blocState.info.jobInfo.map<Widget>(
                        (jI) => Text(
                          jI,
                          style: Theme.of(context).textTheme.bodySmall
                        )
                      )
                    ]
                  )
                ),
                if(screenDimension == ScreenSize.big)
                  ...[
                    SizedBox(
                      width: AppDimens.widthPercentage(0.05, context)
                    ),
                    Image.asset(
                      'assets/drawables/job_experience.png',
                      width: AppDimens.widthPercentage(0.3, context),
                      fit: BoxFit.fitWidth
                    )
                  ]
            
              ]
            ),
          ),
        ),
      ),
    );
  }
}