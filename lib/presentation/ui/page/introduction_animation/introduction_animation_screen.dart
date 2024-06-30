import 'package:greethy_application/presentation/ui/page/introduction_animation/components/care_view.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/center_next_button.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/mood_diary_vew.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/relax_view.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/splash_view.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/top_back_skip_view.dart';
import 'package:greethy_application/presentation/ui/page/introduction_animation/components/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/shared_prefrence_helper.dart';
import '../../../state/user/authState.dart';
import '../common/locator.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() => _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    print("start introduction screen");
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("start IntroductionAnimationScreen");
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            RelaxView(
              animationController: _animationController!,
            ),
            CareView(
              animationController: _animationController!,
            ),
            MoodDiaryVew(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    print("_onSkipClick");
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    print("_onBackClick");
    print(_animationController!.value);
    if (_animationController!.value >= 0 && _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 && _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 && _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 && _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 && _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    print("_onNextClick");
    print(_animationController!.value);
    if (_animationController!.value >= 0 && _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 && _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 && _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 && _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  Future<void> _signUpClick() async {
    print("_signUpClick");
    await getIt<SharedPreferenceHelper>().endWelcomeFirstTime();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      var state = Provider.of<AuthState>(context, listen: false);
      state.getCurrentUser();
    });
    // Navigator.pop(context);
  }
}
