import 'dart:math';

import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final appBarTitle = "Instagram";
  final _randomImageUrl = 'https://www.picsum.photos/200/300/';

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(18)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(flex: 5, child: buildListViewTop(context)),
          Expanded(flex: 1, child: buildListView()),
          Expanded(flex: 1, child: buildDismissimbleBottomCard()),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      actions: [buildIconButtonFav(context)],
      title: buildRowAppBarTitle(context),
    );
  }

  IconButton buildIconButtonFav(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const Column(),
          );
        },
        icon: const Icon(Icons.favorite));
  }

  Row buildRowAppBarTitle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.photo_camera),
        Text(appBarTitle,
            style:
                Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary))
      ],
    );
  }

  ListView buildListViewTop(BuildContext context) {
    return ListView(
      children: [
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildListViewCard(context, index);
      },
    );
  }

  SizedBox buildListViewCard(BuildContext context, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(backgroundImage: NetworkImage(_randomImageUrl)),
          title: Text("Ad Soyad"),
          subtitle: Text("Sıra no = $index"),
          trailing: Icon(Icons.arrow_right_outlined),
        ),
      ),
    );
  }

  Dismissible buildDismissimbleBottomCard() {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.black),
      secondaryBackground: Container(color: Colors.red),
      child: buildContainerBottom(),
    );
  }

  Container buildContainerBottom() {
    return Container(
      color: Colors.yellow,
    );
  }
}
