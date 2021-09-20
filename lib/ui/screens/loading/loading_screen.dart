import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mukminapp/ui/screens/login/login_screen.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/background.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      _goToLoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backGroundColor,
      body: BackGround(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: new AssetImage(
                'assets/hello.gif',
              ),
              height: 60,
              width: 60,
            ),
            const SizedBox(height: 16.0),
            SvgPicture.asset('assets/splash.svg'),
            const SizedBox(height: 16.0),
            Text(
              'Assalamu’alaikum warahmatullahi wabarakatuh',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
    );
  }

  _goToLoginScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
