import 'package:flutter/material.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
class MessageInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isLarge;
  const MessageInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.isLarge = false
  });

  @override
  Widget build(BuildContext context) {
    final screenDimensions = AppDimens.getScreenDimension(context);
    final radius = BorderRadius.circular(
      isLarge?
        20:
        100
    );
    return SizedBox(
      width: AppDimens.widthPercentage(
        screenDimensions == ScreenSize.big?
          0.17:
          0.25,
        context
      ),
      height: isLarge?
        AppDimens.heightPercentage(0.15, context):
        null,
      child: TextField(
        expands: isLarge,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        style: Theme.of(context).textTheme.labelMedium,
        maxLines: null,
        minLines: null,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppDimens.heightPercentage(0.01, context),
            horizontal: AppDimens.heightPercentage(0.03, context)
          ),
          
          border: OutlineInputBorder(
            borderRadius: radius, // Aquí defines el BorderRadius
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius,
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