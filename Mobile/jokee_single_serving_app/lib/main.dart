import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jokee_single_serving_app/providers/jokes_controller.dart';
import 'package:jokee_single_serving_app/providers/liked_provider.dart';
import 'package:jokee_single_serving_app/screen/joke_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeController>(
          create: (_) => JokeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => isLikedProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const JokeScreen(),
      ),
    );
  }
}
