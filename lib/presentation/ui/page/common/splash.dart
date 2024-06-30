import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/constant.dart';
import 'package:greethy_application/presentation/helper/utility.dart';
import 'package:greethy_application/presentation/state/user/authState.dart';
import 'package:greethy_application/presentation/ui/page/auth/selectAuthMethod.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../../helper/shared_prefrence_helper.dart';
import '../home_app/home_screen.dart';
import '../introduction_animation/introduction_animation_screen.dart';
import 'locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    print("SplashPage");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  @override
  void dispose() {
    print("splash dispose");
    super.dispose();
  }

  /// Check if current app is updated app or not
  /// If app is not updated then redirect user to update app screen
  void timer() async {
    final isAppUpdated = await _checkAppVersion();
    if (isAppUpdated) {
      cprint("App is updated");
      Future.delayed(const Duration(seconds: 1)).then((_) async {
        var state = Provider.of<AuthState>(context, listen: false);
        print("start check");
        if (await getIt<SharedPreferenceHelper>().isFirstTimeApp()) {
          print(" start Introduction");
          state.startIntroduction();
        } else {
          print("start getCurrentUser");
          state.getCurrentUser();
        }
      });
    }
  }

  /// Return installed app version
  /// For testing purpose in debug mode update screen will not be open up
  /// If an old version of app is installed on user's device then
  /// User will not be able to see home screen
  /// User will redirected to update app screen.
  /// Once user update app with latest version and back to app then user automatically redirected to welcome / Home page
  Future<bool> _checkAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final currentAppVersion = packageInfo.version;
    final buildNo = packageInfo.buildNumber;
    // final config = await _getAppVersion();
    //
    // if (config != null &&
    //     config['name'] == currentAppVersion &&
    //     config['versions'].contains(int.tryParse(buildNo))) {
    //   return true;
    // } else {
    //   if (kDebugMode) {
    //     cprint("Latest version of app is not installed on your system");
    //     cprint(
    //         "This is for testing purpose only. In debug mode update screen will not be open up");
    //     cprint(
    //         "If you are planning to publish app on store then please update app version in firebase config");
    //     return true;
    //   }
    //   Navigator.pushReplacement(context, UpdateApp.getRoute());
    //   return false;
    // }

    //
    //  todo: kiểm tra cập nhật ứng dụng
    //

    return true;
  }

  /// Returns app version from api server
  ///  {
  ///    "supportedBuild":
  ///    {
  ///       "name": "<Current Build Version>","
  ///       "versions": [ <Current Build Version> ]
  ///     }
  ///  } ```
  Future<int?> _getAppVersion() async {
    // final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    // await remoteConfig.fetchAndActivate();
    // // await remoteConfig.activateFetched();
    // var dataDev = remoteConfig.getString('supportedBuild');
    // if (dataDev.isNotEmpty) {
    //   return jsonDecode(dataDev) as Map;
    // } else {
    //   cprint(
    //       "Please add your app's current version into Remote config in firebase",
    //       errorIn: "_getAppVersionFromFirebaseConfig");
    //   return null;
    // }

    //
    // todo: thêm api kiểm tra version ứng dụng
    //

    return 0;
  }

  Widget _body() {
    var height = 150.0;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/icon-512.png',
                height: 45,
                width: 45,
              ),
              Positioned(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator(
                        radius: 35,
                        color: GreethyColor.kawa_green,
                      )
                    : const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: GreethyColor.kawa_green,
                      ),
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context);
    print("Auth Status: ${state.authStatus}");

    return Scaffold(
      backgroundColor: GreethyColor.white,
      body: state.authStatus == AuthStatus.NOT_DETERMINED
          ? _body()
          : state.authStatus == AuthStatus.FIRST_TIME
              ? const IntroductionAnimationScreen()
              : state.authStatus == AuthStatus.NOT_LOGGED_IN
                  ? const WelcomePage()
                  : HomeScreen(),
      // : NavigationHomeScreen(),
    );
  }
}
