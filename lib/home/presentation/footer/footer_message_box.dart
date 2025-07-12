import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/footer/message_input.dart';
class FooterMessageBox extends StatelessWidget {
  const FooterMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    final inputWidth = AppDimens.widthPercentage(
      AppDimens.getScreenDimension(context) == ScreenSize.big?
        0.2:
        0.4,
      context
    );
    return Container(
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
            controller: blocState.messageName,
            width: inputWidth
          ),
          const SizedBox(
            height: 10
          ),
          MessageInput(
            hintText: 'Tu Correo',
            controller: blocState.messageEmail,
            width: inputWidth
          ),
          const SizedBox(
            height: 10
          ),
          MessageInput(
            hintText: 'Tu Whatsapp',
            controller: blocState.messageWhatsapp,
            width: inputWidth
          ),
          const SizedBox(
            height: 10
          ),
          MessageInput(
            hintText: 'Mensaje',
            controller: blocState.messageBody,
            isLarge: true,
            width: inputWidth
          ),
          const SizedBox(
            height: 10
          ),
          MaterialButton(
            onPressed: (){
              BlocProvider.of<HomeBloc>(context).add(SendEmail());
            },
            minWidth: inputWidth,
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
    );
  }
}