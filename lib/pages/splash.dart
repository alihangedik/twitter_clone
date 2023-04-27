import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/pages/home.dart';
import 'package:twitter_clone/view/tabbar_view.dart';

import '../icons.dart';
import '../theme/colors.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  goHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TwTabbarView(),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    goHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tweepink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.string(
              AppIcons.twitterLogo,
              color: AppColors.white,
              height: 85,
            ),
          ),
          SizedBox(height: 20),
          Text('Tweepink',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
