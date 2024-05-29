import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_sign_on/utils/apputil.dart';
import 'package:single_sign_on/utils/routes/routes.dart';
import 'package:single_sign_on/view/LoginScreen.dart';
import 'package:single_sign_on/view_model/auth_view_model.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // getIt.registerLazySingleton<AuthRepository>(() => AuthHttpApiRepository());
  // getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // this is the initial route indicating from where our app will start

        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false, // This line removes the debug banner
        home: LoginScreen(
          onLoginPressed: (token) {
            // Handle login token
            print("object");
            print('======sdd=d=d=======>> Login token: $token');
            Utils.toastMessage("TOKEN : " + token);
            // Navigator.pushNamed(context, RoutesName.normal);
            // Navigator.pop(context);
          },
          baseUrl: 'https://portal.emmdev.tectoro.com/idm/v1',
          // Set your base URL
          // loginType: 'microsoft',
          loginType: 'ldap',
          // or 'microsoft' or 'ldap'
          tenant: 'TT',
          deviceID: '351110795908267f',
          appName: 'device',
        ),
      ),
    );
  }
}
