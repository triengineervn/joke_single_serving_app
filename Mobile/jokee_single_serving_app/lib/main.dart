import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jokee_single_serving_app/assets/app_assets.dart';
import 'package:jokee_single_serving_app/assets/app_colors.dart';
import 'package:jokee_single_serving_app/assets/app_styles.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:jokee_single_serving_app/models/jokes.dart';
import 'package:jokee_single_serving_app/repositories/fetch_data.dart';
import 'firebase_options.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Jokes> getJokes = [];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<String>(
          future: fetchJokesAsJson(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppAssets.hl_ic),
                          const Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Handicrafted by',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text('Tri HLS'),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      'https://scontent.fsgn5-6.fna.fbcdn.net/v/t39.30808-6/335716178_1077427206524619_88218434403744126_n.jpg?_nc_cat=108&cb=99be929b-3346023f&ccb=1-7&_nc_sid=730e14&_nc_ohc=H2M4WJsjl_0AX8R8aOX&_nc_ht=scontent.fsgn5-6.fna&oh=00_AfCJj0l0gZWWmL68oTYXpdwvaAYR8xNig2Ed22bZ0cqnAw&oe=64A02063'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: screenSize.width,
                      color: AppColors.primary,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'A joke a day keeps the doctor away',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            'If you joke wrong way, your teeth have to pay. (Serious)',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on." The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'This is funny!',
                                    style: AppTextStyle.lightTextStyle,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('This is not funny.'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.grey,
                            width: .5,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'This appis created as part Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damege which may arise from reliance on the information contained on this site.',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text('Copyright 2021 HLS'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
