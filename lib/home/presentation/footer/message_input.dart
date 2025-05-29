import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
class MessageInput extends StatelessWidget {
  final String hintText;
  const MessageInput({
    super.key,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    final screenDimensions = AppDimens.getScreenDimension(context);
    return SizedBox(
      width: AppDimens.widthPercentage(
        screenDimensions == ScreenSize.big?
          0.17:
          0.25,
        context
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100), // Aquí defines el BorderRadius
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 2
            )
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.inversePrimary
        )
      )
    );
  }
}