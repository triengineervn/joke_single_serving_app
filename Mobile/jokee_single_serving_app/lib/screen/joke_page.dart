// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jokee_single_serving_app/assets/app_assets.dart';
import 'package:jokee_single_serving_app/assets/app_colors.dart';
import 'package:jokee_single_serving_app/assets/app_styles.dart';
import 'package:jokee_single_serving_app/models/jokes_model.dart';
import 'package:jokee_single_serving_app/providers/jokes_controller.dart';
import 'package:jokee_single_serving_app/providers/liked_provider.dart';
import 'package:jokee_single_serving_app/screen/cookie_page.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JokeController>(
        builder: (context, value, _) {
          return FutureBuilder<JokesModel?>(
            future: JokeController().getData(counter),
            builder: (context, snapshot) {
              final myProvider = Provider.of<isLikedProvider>(context, listen: true);
              void _incrementCounterIsNotLiked() {
                setState(() {
                  counter++;
                  if (counter > 3) {
                    counter = 3;
                    Fluttertoast.showToast(
                        msg: "That's all the jokes for today! Come back another day!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              }

              void _incrementCounterIsLiked() {
                setState(() {
                  myProvider.addItem(snapshot.data!.value);
                  counter++;
                  if (counter > 3) {
                    counter = 3;
                    Fluttertoast.showToast(
                        msg: "That's all the jokes for today! Come back another day!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasData) {
                final Size screenSize = MediaQuery.of(context).size;

                return SafeArea(
                  child: Scaffold(
                    body: Center(
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
                                  Row(
                                    children: [
                                      const Column(
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
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: const NetworkImage(
                                              'https://scontent.fsgn5-6.fna.fbcdn.net/v/t39.30808-6/335716178_1077427206524619_88218434403744126_n.jpg?_nc_cat=108&cb=99be929b-3346023f&ccb=1-7&_nc_sid=730e14&_nc_ohc=H2M4WJsjl_0AX8R8aOX&_nc_ht=scontent.fsgn5-6.fna&oh=00_AfCJj0l0gZWWmL68oTYXpdwvaAYR8xNig2Ed22bZ0cqnAw&oe=64A02063'),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => const MyCookieScreen()),
                                                );
                                              });
                                            },
                                          ),
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
                            flex: 14,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      snapshot.data!.value,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: const ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                                          ),
                                          onPressed: _incrementCounterIsLiked,
                                          child: const Text(
                                            'This is funny!',
                                            style: AppTextStyle.lightTextStyle,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: _incrementCounterIsNotLiked,
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
                                    SizedBox(height: 4),
                                    Text('Copyright 2021 HLS'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
