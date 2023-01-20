import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/pages/home.dart';
import 'package:twitter_clone/theme/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ScrollController controller;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    @override
    void initState() {
      super.initState();
      controller = ScrollController();
      Future.delayed(Duration(seconds: 1), (() {
        isLoading = true;
      }));
      isLoading == true
          ? Navigator.push(context,
              MaterialPageRoute(builder: ((context) => Home(controller))))
          : null;
    }

    return Scaffold(
      backgroundColor: AppColors.twitterBlue,
      body: Center(
        child: SvgPicture.string(
          AppIcons.twitterLogo,
          color: AppColors.white,
          height: 100,
        ),
      ),
    );
  }
}
