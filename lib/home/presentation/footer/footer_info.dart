import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/user_site.dart';
class FooterInfo extends StatelessWidget {
  const FooterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Página 100% desarrollada en '
            ),
            Text(
              'Flutter Web',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold
              ),
            )
          ]
        ),
        const SizedBox(
          height: 20
        ),
        Row(
          children: [
            Text(
              'Ponte en contacto',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              '.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary
              )
            )
          ]
        ),
        const SizedBox(
          height: 10
        ),
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              size: AppDimens.littleIcon(context)
            ),
            const SizedBox(
              width: 5
            ),
            Text(
              blocState.info.email,
              style: Theme.of(context).textTheme.bodySmall
            )
          ]
        ),
        const SizedBox(
          height: 2
        ),
        Row(
          children: [
            Icon(
              Icons.place,
              color: Theme.of(context).colorScheme.tertiary,
              size: AppDimens.littleIcon(context)
            ),
            const SizedBox(
              width: 5
            ),
            Text(
              blocState.info.place,
              style: Theme.of(context).textTheme.bodySmall
            )
          ]
        ),
        const SizedBox(
          height: 5
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: blocState.info.sites.map<Widget>(
            (s) => IconButton(
              onPressed: (){
                BlocProvider.of<HomeBloc>(context).add(LoadUrl(
                  s.url
                ));
              },
              icon: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5
                ),
                child: Icon(
                  s.type == UserLkinkType.github?
                    FontAwesomeIcons.github:
                    s.type == UserLkinkType.stackOverflow?
                      FontAwesomeIcons.stackOverflow:
                      FontAwesomeIcons.linkedin
                ),
              )
            )
          ).toList()
        )
      ]
    );
  }
}