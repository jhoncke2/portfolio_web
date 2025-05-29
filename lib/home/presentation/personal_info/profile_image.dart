import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/globals/app_dimens.dart';
import 'package:portfolio_web/home/domain/bloc/home_bloc.dart';
import 'package:portfolio_web/home/presentation/personal_info/hexagon_clipper.dart';
class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  static const borderWeight = 2.0;
  static const profilePhotoSize = 0.2;
  late bool _isOnHover;

  @override
  void initState() {
    super.initState();
    _isOnHover = false;
  }

  @override
  Widget build(BuildContext context) {
    final blocState = BlocProvider.of<HomeBloc>(context).state as OnInfoLoaded;
    return Stack(
      children: [
        PhysicalShape(
          clipper: HexagonClipper(),
          color: Theme.of(context).colorScheme.primary,
          shadowColor: Theme.of(context).shadowColor,
          elevation: 10.0,
          child: ClipPath(
            clipper: HexagonClipper(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              width: AppDimens.heightPercentage(
                profilePhotoSize * (_isOnHover? 0.85 : 1),
                context
              ) + borderWeight * 2,
              height: AppDimens.heightPercentage(
                profilePhotoSize * (_isOnHover? 0.85 : 1),
                context
              ) + borderWeight * 2,
              child: Center(
                child: Container(
                  width: AppDimens.heightPercentage(profilePhotoSize, context)/2,
                  height: AppDimens.heightPercentage(profilePhotoSize, context)/2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/drawables/flutter.png',
                      width: AppDimens.heightPercentage(profilePhotoSize, context)/4,
                      height: AppDimens.heightPercentage(profilePhotoSize, context)/4,
                      fit: BoxFit.fill
                    ),
                  ),
                )
              ),
            )
          )
        ),
        Positioned(
          top: borderWeight,
          left: borderWeight,
          child: MouseRegion(
            onEnter: (_){
              setState(() {
                _isOnHover = true;
              });
            },
            onExit: (_){
              setState(() {
                _isOnHover = false;
              });
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuad,
              opacity: _isOnHover? 0.0 : 1.0,
              child: ClipPath(
                clipper: HexagonClipper(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceOut,
                  width: AppDimens.heightPercentage(
                    profilePhotoSize * (_isOnHover? 0.85 : 1),
                    context
                  ),
                  height: AppDimens.heightPercentage(
                    profilePhotoSize * (_isOnHover? 0.85 : 1),
                    context
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(blocState.info.profileUrl), // o AssetImage si es local
                      fit: BoxFit.cover,
                    )
                  )
                )
              ),
            ),
          )
        )
      ]
    );
  }
}