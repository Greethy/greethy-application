import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signup.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/state/authState.dart';
import 'package:greethy_application/presentation/ui/page/common/locator.dart';
import 'package:greethy_application/presentation/ui/page/common/log_debug.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/impl/auth_repository_impl.dart';
import 'data/source/local/local_storage_user.dart';
import 'data/source/network/auth_api.dart';
import 'domain/usecase/auth_usercase/get_status_login.dart';
import 'domain/usecase/auth_usercase/signin.dart';
import 'zdataDev/add_date.dart';
import 'presentation/ui/page/common/routes.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Greethy_LogDebug("main", "start register dependencies here after start");
  setupDependencies();
  Greethy_LogDebug("main", "start plash screen");
  await initializeDateFormatting('vi_VN');
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('dataDev');
  sharedPref = await SharedPreferences.getInstance();

  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late SignIn _signIn;
  late GetStatusLogin _getStatusLogin;
  late SignUp _signUp;

  @override
  void initState() {
    super.initState();
    // Notice:
    //
    // Some state management packages are also D.I. (Dependency Injection)
    // solutions. To avoid polluting this example with unnecessary repetition,
    // we're creating the object instances here and passing them as parameters
    // to each state management's "root" widgets. Then we'll use the library's
    // specific D.I. widget to make the instance accessible to the rest of the
    // widget tree.
    //
    final api = AuthApiImpl();
    final localStorage = LocalStorageUserImpl(sharedPreferences: sharedPref);
    final repo = AuthRepositoryImpl(api: api, localStorage: localStorage);
    _signIn = SignIn(repository: repo);
    _getStatusLogin = GetStatusLogin(repository: repo);
    _signUp = SignUp(repository: repo);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiProvider(
      /// Register provider for app
      providers: [
        Provider.value(value: _signIn),
        Provider.value(value: _getStatusLogin),
        Provider.value(value: _signUp),
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState(signIn: _signIn, getStatusLogin: _getStatusLogin, signUp: _signUp)),
      ],
      child: MaterialApp(
        title: 'Welcome Greethy',
        theme: AppTheme.appTheme.copyWith(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        initialRoute: "SplashPage",
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
