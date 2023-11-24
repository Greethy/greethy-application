import 'package:flutter/material.dart';
import 'package:greethy_application/helper/enum.dart';
import 'package:greethy_application/helper/utility.dart';
import 'package:greethy_application/model/user.dart';
import 'package:greethy_application/state/authState.dart';
import 'package:greethy_application/ui/page/auth/widget/facebookLoginButton.dart';
import 'package:greethy_application/ui/page/auth/widget/googleLoginButton.dart';
import 'package:greethy_application/ui/theme/theme.dart';
import 'package:greethy_application/widgets/customFlatButton.dart';
import 'package:greethy_application/widgets/customWidgets.dart';
import 'package:greethy_application/widgets/newWidget/customLoader.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  final VoidCallback? googleLoginCallback;

  final VoidCallback? facebookLoginCallback;

  const Signup({Key? key, this.googleLoginCallback, this.facebookLoginCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  late CustomLoader loader;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print("start sign up screen");
    loader = CustomLoader();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Container(
      height: context.height - 88,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _entryField('Name', controller: _nameController),
            _entryField('Enter email', controller: _emailController, isEmail: true),
            _entryField('Enter password', controller: _passwordController, isPassword: true),
            _entryField('Confirm password', controller: _confirmController, isPassword: true),
            _submitButton(context),
            const Divider(
              height: 30,
              color: Colors.grey, // Mã màu hex code hoặc Colors.grey.shade300
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GoogleLoginButton(
                  loginCallback: widget.googleLoginCallback!,
                  loader: loader,
                ),
                FacebookLoginButton(
                  loginCallback: widget.facebookLoginCallback!,
                  loader: loader,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String hint, {required TextEditingController controller, bool isPassword = false, bool isEmail = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(color: Colors.blue),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      child: CustomFlatButton(
        label: "Sign up",
        onPressed: () => _submitForm(context),
        borderRadius: 30,
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_nameController.text.isEmpty) {
      Utility.customSnackBar(context, 'Please enter name');
      return;
    }
    if (_nameController.text.length > 27) {
      Utility.customSnackBar(context, 'Name length cannot exceed 27 character');
      return;
    }
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Utility.customSnackBar(context, 'Please fill form carefully');
      return;
    } else if (_passwordController.text != _confirmController.text) {
      Utility.customSnackBar(context, 'Password and confirm password did not match');
      return;
    }

    loader.showLoader(context);
    var state = Provider.of<AuthState>(context, listen: false);

    UserModel user = UserModel(
      email: _emailController.text,
      isVerified: false,
    );

    state.signUp(user, password: _passwordController.text, context: context).then((status) {
      print(status);
      if (status != null && !status){
        Navigator.pushNamed(context, '/VerifyEmailPage');
      }
    }).whenComplete(() {
      loader.hideLoader();
      if (state.authStatus == AuthStatus.LOGGED_IN) {
        Navigator.pop(context);
        if (widget.googleLoginCallback != null) widget.googleLoginCallback!();
        if (widget.facebookLoginCallback != null) widget.facebookLoginCallback!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_test.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: customText(
                    'Sign up',
                    context: context,
                    style: const TextStyle(fontSize: 25, color: GreethyColor.white),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: GreethyColor.white, // Màu của nút back
                  ),
                ),
                _body(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
