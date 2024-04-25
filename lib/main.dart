import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medinas_app/controller/loginProvider.dart';
import 'package:medinas_app/controller/userProvider.dart';
import 'package:medinas_app/firebase_options.dart';
import 'package:medinas_app/routes/routing.dart';
import 'package:provider/provider.dart';
import './public/theme/theme.dart';
import 'pages/Splash/splash.screen.dart';

//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => loginProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medinas App',
      theme: MedinasTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
