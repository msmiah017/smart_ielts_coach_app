import 'package:flutter/material.dart';

import '../../utils/global_utils.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Theme.of(context).colorScheme.onBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Notifications",
          style: bodyTextLarge(
              context, Theme.of(context).colorScheme.onBackground),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                // boxShadow: [
                //   BoxShadow(
                //     color: Theme.of(context).colorScheme.secondary,
                //     spreadRadius: 0.1,
                //     blurRadius: 4
                //   )
              //   ]
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/mohammad.jpg"),
                ),
                title: Text(
                  "New test",
                  style: bodyTextMedium(
                      context, Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  "A new test has been added by (User name which will be replaced with the actual user name)",
                  style: bodyTextSmall(
                      context, Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.justify,
                ),

              ),
            );
          }),
    );
  }
}
