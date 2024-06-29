import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/constant.dart';
import 'package:greethy_application/presentation/state/user/authState.dart';
import 'package:greethy_application/presentation/ui/page/auth/signup.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/widgets/customFlatButton.dart';
import 'package:greethy_application/presentation/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

import '../home_app/home_screen.dart';
import 'signin.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: CustomFlatButton(
        label: "Tạo tài khoản",
        color: GreethyColor.kawa_green,
        textColor: GreethyColor.white,
        onPressed: () {
          var state = Provider.of<AuthState>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(
                googleLoginCallback: state.getCurrentUser,
                facebookLoginCallback: state.getCurrentUser,
              ),
            ),
          );
        },
        borderRadius: 30,
      ),
    );
  }

  Widget _body() {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('ami/img/7.png'),
            fit: BoxFit.none,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            // todo: cần yêu cầu Hằng làm các icon phù hợp với kích thước
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              height: 120,
              child: Image.asset('assets/images/icon-512.png'),
            ),
            const TitleText(
              'GREETHY',
              color: GreethyColor.kawa_green,
              fontSize: 35,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const TitleText(
              'Sẵn sàng trở thành phiên bản tốt hơn của bản thân thôi nào.',
              color: GreethyColor.kawa_green,
              fontSize: 25,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            _submitButton(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                const TitleText(
                  'Bạn đã có tài khoản rồi chứ?',
                  fontSize: 14,
                  color: GreethyColor.kawa_green,
                  fontWeight: FontWeight.w300,
                ),
                InkWell(
                  onTap: () {
                    var state = Provider.of<AuthState>(context, listen: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(loginCallback: state.getCurrentUser),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: TitleText(
                      ' Log in',
                      fontSize: 14,
                      color: GreethyColor.kawa_green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context, listen: false);
    return Scaffold(
      body: state.authStatus == AuthStatus.NOT_LOGGED_IN || state.authStatus == AuthStatus.NOT_DETERMINED ? _body() : HomeScreen(),
      // TODO: học hỏi kế thừa homepage từ fwitter
      // : const HomePage(),
    );
  }
}
