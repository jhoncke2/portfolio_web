import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
class JobExperienceView extends StatelessWidget {
  const JobExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final screenDimension = AppDimens.getScreenDimension(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: AppDimens.widthPercentage(
            screenDimension == ScreenSize.big?
              0.25:
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
    );
  }
}