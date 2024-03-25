import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ielts_coach_app/home/providers/home_provider.dart';
import 'package:smart_ielts_coach_app/test_centre/listening/screens/listening_module.dart';
import 'package:smart_ielts_coach_app/test_centre/reading/screens/reading_module.dart';
import 'package:smart_ielts_coach_app/test_centre/speaking/screens/speaking_module.dart';
import 'package:smart_ielts_coach_app/test_centre/writing/screens/writing_module.dart';
import 'package:smart_ielts_coach_app/utils/custom_widgets.dart';

class TestCentre extends StatefulWidget {
  const TestCentre({super.key});

  @override
  State<TestCentre> createState() => _TestCentreState();
}

class _TestCentreState extends State<TestCentre> {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            // shadowColor: Theme.of(context).colorScheme.onBackground,
            surfaceTintColor: Colors.transparent,
            elevation: 1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                testCentreTextButtons(context, "Reading", () {
                  homeProvider.activateBtn("Reading");
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }, homeProvider.activeBtn[0]),
                testCentreTextButtons(context, "Listening", () {
                  homeProvider.activateBtn("Listening");
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }, homeProvider.activeBtn[1]),
                testCentreTextButtons(context, "Writing", () {
                  homeProvider.activateBtn("Writing");
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }, homeProvider.activeBtn[2]),
                testCentreTextButtons(context, "Speaking", () {
                  homeProvider.activateBtn("Speaking");
                  _pageController.animateToPage(3,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }, homeProvider.activeBtn[3]),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            // homeProvider.setCurrentNavItemIndex(index);
          },
          children: const [
            ReadingModule(),
            ListeningModule(),
            WritingModule(),
            SpeakingModule()
          ],
        ),
      ),
    );
  }
}
