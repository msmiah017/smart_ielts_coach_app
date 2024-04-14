import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smart_ielts_coach_app/tester_hub/providers/tester_provider.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

import '../../custom_clips/custom_clip_path.dart';

class TesterScreen extends StatefulWidget {
  const TesterScreen({super.key});

  @override
  State<TesterScreen> createState() => _TesterScreenState();
}

class _TesterScreenState extends State<TesterScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final testerProvider = Provider.of<TesterProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          shadowColor: Theme.of(context).colorScheme.secondary,
          surfaceTintColor: Colors.transparent,
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      Scaffold.of(context).openDrawer();
                    });
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/mohammad.jpg"),
                  ));
            }),
          ),
          title: Container(
            width: double.infinity,
            height: 38,
            padding: const EdgeInsets.only(left: 15, right: 20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 8,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 14),
                        contentPadding: EdgeInsets.zero,
                      ),
                    )),
                Flexible(
                    child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                  ),
                ))
              ],
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
        ),
        body: const Placeholder(),
        drawer: SafeArea(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        endDrawer: Container(
          height: height,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomCenter,
                    height: height,
                    width: width,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.white, width: 0.5))),
                    child: const Text(
                      "Design Elements",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Flexible(
                flex: 7,
                child: ListView.builder(
                    itemCount: 10,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white, width: 0.5))),
                        child: ListTile(
                          leading: const Text(
                            "Add page",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
        bottomNavigationBar: ClipPath(
          child: Container(
            height: 80,
            width: double.infinity,
            color: Colors.teal,
          ),
        ));
  }
}


