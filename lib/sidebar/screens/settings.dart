import 'package:flutter/material.dart';

import '../../utils/global_utils.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Settings",
          style: bodyTextLarge(context, Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/mohammad.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
                // Overlay container
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Example color
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                color:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                size: 28,
              ),
              title: Text(
                "Account Name",
                style: bodyTextMedium(
                    context,
                    Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5)),
              ),
              subtitle: Text(
                "Mohammad Miah",
                style: bodyTextSmall(
                    context, Theme.of(context).colorScheme.onBackground),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    size: 28),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                size: 28,
              ),
              title: Text(
                "About",
                style: bodyTextMedium(
                    context,
                    Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5)),
              ),
              subtitle: Text(
                "Always interested to improve English by any means available.",
                style: bodyTextSmall(
                    context, Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.justify,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    size: 28),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                size: 28,
              ),
              title: Text(
                "Registered email",
                style: bodyTextMedium(
                    context,
                    Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5)),
              ),
              subtitle: Text(
                "shorif.ru.019@gmail.com",
                style: bodyTextSmall(
                    context, Theme.of(context).colorScheme.onBackground),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    size: 28),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                size: 28,
              ),
              title: Text(
                "Password",
                style: bodyTextMedium(
                    context,
                    Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5)),
              ),
              subtitle: Text(
                "Change Password",
                style: bodyTextSmall(
                    context, Theme.of(context).colorScheme.onBackground),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    size: 28),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              child: TextButton(
                onPressed: (){},
                child: Text("Delete Account", style: bodyTextLarge(context, Theme.of(context).colorScheme.primary),),
              ),
            )
          ],

        ),
      ),
    );
  }
}
