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
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
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
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0.8
                      )
                    ]
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
                      MessageInput(
                        hintText: 'Tu nombre',
                        controller: blocState.messageName
                      ),
                      const SizedBox(
                        height: 10
                      ),
                      MessageInput(
                        hintText: 'Tu Correo',
                        controller: blocState.messageEmail
                      ),
                      const SizedBox(
                        height: 10
                      ),
                      MessageInput(
                        hintText: 'Mensaje',
                        controller: blocState.messageBody,
                        isLarge: true,
                      ),
                      const SizedBox(
                        height: 10
                      ),
                      MaterialButton(
                        onPressed: (){
                
                        },
                        minWidth: AppDimens.widthPercentage(
                          screenSize == ScreenSize.big?
                            0.2:
                            0.25,
                          context
                        ),
                        height: AppDimens.heightPercentage(0.075, context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Text(
                          'Enviar'
                        )
                      )
                    ]
                  )
                )
              ]
            )
          ),
        ),
      )
    );
  }
}