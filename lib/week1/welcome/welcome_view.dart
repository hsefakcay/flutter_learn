import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final appBarTitle = "Instagram";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Column(),
                );
              },
              icon: Icon(Icons.favorite))
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallpaper),
            Text(
              appBarTitle,
              style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
