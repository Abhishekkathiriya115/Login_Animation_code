import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukminapp/ui/screens/home/home_screen.dart';
import 'package:mukminapp/ui/screens/signup_screen.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/background.dart';
import 'widgets/custom_route.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.backGroundColor,
      child: BackGround(
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 10.0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0),
          backgroundColor: Colors.transparent,
          body: FlutterLogin(
            title: 'MUKMIN APP',
            logo: 'assets/logo1.png',
            navigateBackAfterRecovery: true,
            theme: LoginTheme(
              switchAuthTextColor: Colors.deepPurple,
              primaryColor: Colors.transparent,
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
              cardTheme: CardTheme(
                color: Colors.transparent,
                elevation: 0,
                // margin: EdgeInsets.only(top: 15),
                // shape: ContinuousRectangleBorder(
                //     borderRadius: BorderRadius.circular(100.0)),
              ),
              buttonTheme: LoginButtonTheme(
                splashColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple,
                highlightColor: Colors.lightGreen,
                elevation: 0.0,
                highlightElevation: 6.0),

            ),
            loginProviders: [
              LoginProvider(
                icon: FontAwesomeIcons.google,
              //  label: 'Google',
                callback: () async {
                  print('start google sign in');
                  await Future.delayed(loginTime);
                  print('stop google sign in');
                  return '';
                },
              ),
              LoginProvider(
                icon: FontAwesomeIcons.facebook,
              //  label: 'Facebook',
                callback: () async {
                  print('start linkdin sign in');
                  await Future.delayed(loginTime);
                  print('stop linkdin sign in');
                  return '';
                },
              ),
            ],
            userValidator: (value) {
              if (!value!.contains('@') || !value.endsWith('.com')) {
                return "Email must contain '@' and end with '.com'";
              }
              return null;
            },
            passwordValidator: (value) {
              if (value!.isEmpty) {
                return 'Password is empty';
              }
              return null;
            },
            onLogin: (loginData) {
              print('Login info');
              print('Name: ${loginData.name}');
              print('Password: ${loginData.password}');
              return _goToHome();
            },
            onSignup: (loginData) {
              print('Signup info');
              print('Name: ${loginData.name}');
              print('Password: ${loginData.password}');
              return _goToHome() ;
            },
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacement(FadePageRoute(
                builder: (context) => HomeScreen(),
              ));
            },
            onRecoverPassword: (name) {
              print('Recover password info');
              print('Name: $name');
              return _goToHome();
              // Show new password dialog
            },
            showDebugButtons: false,
          ),
        ),
      ),
    );
  }

  // _goToRegister() {
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => RegisterScreen()));
  // }

  _goToHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
