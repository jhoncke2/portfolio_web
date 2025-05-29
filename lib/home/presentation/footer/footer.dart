import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/domain/entities/user_site.dart';
import 'package:portfolio_web/home/presentation/footer/message_input.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Container(
      width: AppDimens.widthPercentage(1, context),
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.heightPercentage(0.05, context)
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Mis sitions',
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              Row(
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
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surface
            ),
            child: Column(
              children: [
                Text(
                  'Envíame un mensaje',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(
                  height: 10
                ),
                const MessageInput(
                  hintText: 'Tu nombre'
                ),
                const SizedBox(
                  height: 10
                ),
                const MessageInput(
                  hintText: 'Tu Correo'
                ),
                const SizedBox(
                  height: 10
                ),
                const MessageInput(
                  hintText: 'Mensaje'
                )
              ]
            )
          )
        ]
      )
    );
  }
}