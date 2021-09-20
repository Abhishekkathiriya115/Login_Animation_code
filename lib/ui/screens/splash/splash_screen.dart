import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mukminapp/ui/screens/loading/loading_screen.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/background.dart';
import 'package:mukminapp/ui/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      _goToLoadingScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backGroundColor,
      body: GestureDetector(
        onTap: _goToLoadingScreen,
        child: BackGround(
          child: Center(
            child: Logo(),
          ),
        ),
      ),
    );
  }

  _goToLoadingScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoadingScreen()));
  }
}
