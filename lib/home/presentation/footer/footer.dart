import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/presentation/footer/footer_info.dart';
import 'package:portfolio_web/home/presentation/footer/footer_message_box.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = AppDimens.getScreenDimension(context);
    return Container(
      width: AppDimens.widthPercentage(1, context),
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.05, context)
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary
      ),
      child: Center(
        child: SizedBox(
          width: AppDimens.widthPercentage(
            screenSize == ScreenSize.big?
              0.6:
              0.9,
            context
          ),
          child: (screenSize == ScreenSize.big)? 
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FooterInfo(),
                  FooterMessageBox()
                ]
              ),
            ):
            SizedBox(
              width: AppDimens.widthPercentage(1, context),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FooterMessageBox(),
                  SizedBox(
                    height: 35
                  ),
                  FooterInfo()
                ]
              )
            )
        )
      )
    );
  }
}