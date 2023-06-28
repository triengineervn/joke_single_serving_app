import 'package:flutter/material.dart';
import 'package:jokee_single_serving_app/assets/app_colors.dart';
import 'package:jokee_single_serving_app/providers/liked_provider.dart';

class MyCookieScreen extends StatelessWidget {
  const MyCookieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = isLikedProvider.of(context);
    final jokes = provider.jokes;
    final uniqueJokes = jokes.toSet().toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'My Cookie',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: uniqueJokes.length,
        itemBuilder: (context, index) {
          final joke = uniqueJokes[index];
          return Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              title: Text(joke),
              trailing: IconButton(
                onPressed: () {
                  provider.toggleIsLiked(joke);
                },
                icon: provider.isExist(joke)
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
              ),
            ),
          );
        },
      ),
    );
  }
}
