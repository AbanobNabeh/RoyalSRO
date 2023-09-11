import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/features/Splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(context),
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: Container(
                  width: MediaQueryValues(context).width / 1.5,
                  height: MediaQueryValues(context).height / 4,
                  child: Image(image: AssetImage(ImgAssets.logo)),
                ),
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
