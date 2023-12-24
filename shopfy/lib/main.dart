import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopfy/Provider/AppAuthProvider.dart';
import 'package:shopfy/Provider/HomeProvider.dart';
import 'package:shopfy/Provider/ProductProvider.dart';
import 'package:shopfy/Provider/category.provider.dart';
import 'package:shopfy/firebase_options.dart';
import 'package:shopfy/theme/themeutils.dart';
import 'package:shopfy/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var prefrenceInstance = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefrenceInstance);

  var result = GetIt.I.allReadySync();

  if (result == true) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prefrences set successfully');
  } else {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Error When Set prefrences');
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppAuthProvider()),
    Provider(create: (_) => CategoryProvider()),
    Provider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopfy Application',
      theme: ThemeUtils.themeData,
      home: SplashPage(),
    );
  }
}
