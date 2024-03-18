import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ielts_coach_app/auth/screens/login_screen.dart';
import 'package:smart_ielts_coach_app/home/providers/home_provider.dart';
import 'package:smart_ielts_coach_app/home/screens/activity.dart';
import 'package:smart_ielts_coach_app/home/screens/dashboard.dart';
import 'package:smart_ielts_coach_app/home/screens/notifications.dart';
import 'package:smart_ielts_coach_app/home/screens/test_centre.dart';
import 'package:smart_ielts_coach_app/utils/custom_form_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
          height: 40,
          padding: const EdgeInsets.only(left: 15, right: 20),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: InputBorder.none,
                      hintText: "Search...",
                      contentPadding: EdgeInsets.zero,
                    ),
                  )),
              Flexible(
                  child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {},
              ))
            ],
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "This service is not available at the moment.",
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.onSecondary);
              },
              icon: const Icon(
                Icons.message,
                size: 24,
              ))
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          // homeProvider.setCurrentNavItemIndex(index);
        },
        children: const [
          TestCentre(),
          Activity(),
          Notifications(),
          Dashboard()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Test Centre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity_outlined, size: 28),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 28),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 28),
            label: 'Dashboard',
          ),
        ],
        currentIndex: homeProvider.currentNavItemIndex,
        selectedFontSize: 12,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.primary),
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        showUnselectedLabels: true,
        onTap: (index) {
          homeProvider.setCurrentNavItemIndex(index);
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
      drawer: Container(
        height: height,
        width: width * 0.8,
        padding:
            const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.onBackground,
                  blurRadius: 5,
                  spreadRadius: 0.2)
            ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/mohammad.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mohammad Miah",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 0.5,
                width: width * 0.8,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              SizedBox(
                height: 320,
                width: width,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final navItemsLabels = [
                        "View Profile",
                        "Favourite Tests",
                        "Saved",
                        "Test Instructions",
                        "Settings",
                        "Help and Support"
                      ];
                      final navItemIcons = [
                        Icons.person,
                        Icons.heart_broken,
                        Icons.bookmark,
                        Icons.info_outline_rounded,
                        Icons.settings,
                        Icons.help_outline_outlined
                      ];
                      return ListTile(
                        leading: Icon(navItemIcons[index]),
                        title: Text(
                          navItemsLabels[index],
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {},
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 0.5,
                width: width * 0.8,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, right: 20, bottom: 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dark Mode",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                        value: homeProvider.darkModeEnabled,
                        onChanged: (newValue) {
                          homeProvider.setDarkModeEnabled(newValue);
                        },
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 0, right: 20, bottom: 0),
                child: ListTile(
                  leading: Text(
                    "Terms and Policy",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: width * 0.5,
                child: CustomSubmitButton(
                    context: context,
                    buttonText: "Logout",
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);
                      if (mounted) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
