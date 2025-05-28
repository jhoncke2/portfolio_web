import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hola, soy Jhonatan Amórtegui',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          'Mobile Developer',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primaryContainer,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: AppDimens.heightPercentage(0.01, context)
        ),
        IntrinsicWidth(
          child: MaterialButton(
            onPressed: (){
          
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8
            ),
            minWidth: AppDimens.heightPercentage(0.06, context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CV'
                ),
                const SizedBox(
                  width: 3
                ),
                Icon(
                  FontAwesomeIcons.file,
                  size: AppDimens.littleIcon(context)
                )
              ]
            )
          ),
        )
      ]
    );
  }
}