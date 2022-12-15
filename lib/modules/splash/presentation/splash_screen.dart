import 'package:flutter/material.dart';
import 'package:wttco/core/resources/app_colors.dart';
import 'package:wttco/core/resources/app_image.dart';
import 'package:wttco/core/uitilites/navigator.dart';
import 'package:wttco/modules/check_in/presentation/check_in_screen.dart';

class SplashScreen  extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future<dynamic>.delayed(const Duration(seconds: 3)).then((dynamic value) {
      popALlAndPushPage(context, const CheckInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
