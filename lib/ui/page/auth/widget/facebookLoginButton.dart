import 'package:flutter/material.dart';
import 'package:greethy_application/helper/utility.dart';
import 'package:greethy_application/state/authState.dart';
import 'package:greethy_application/widgets/newWidget/customLoader.dart';
import 'package:greethy_application/widgets/newWidget/rippleButton.dart';
import 'package:provider/provider.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({
    Key? key,
    required this.loader,
    this.loginCallback,
  }) : super(key: key);
  final CustomLoader loader;
  final Function? loginCallback;

  void _facebookLogin(context) {
    var state = Provider.of<AuthState>(context, listen: false);
    loader.showLoader(context);
    state.handleFacebookSignIn().then((status) {
      // print(status)
      if (state.facebookUser != null) {
        loader.hideLoader();
        Navigator.pop(context);
        if (loginCallback != null) loginCallback!();
      } else {
        loader.hideLoader();
        cprint('Unable to login', errorIn: '_facebookLoginButton');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: RippleButton(
        onPressed: () {
          _facebookLogin(context);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0xffeeeeee),
                blurRadius: 15,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Wrap(
            children: <Widget>[
              Image.asset(
                'assets/images/facebook_logo.png',
                height: 20,
                width: 20,
              ),
              // const SizedBox(width: 10),
              // const TitleText(
              //   'Continue with Facebook',
              //   color: Colors.black54,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
