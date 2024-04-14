import 'package:flutter/material.dart';
import 'package:smart_ielts_coach_app/home/screens/home_screen.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Mohammad Miah",
          style: bodyTextLarge(context, Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.secondary,
                ))),
                child: Text(
                  "About",
                  style: bodyTextLarge(
                      context,
                      Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Always interested to improve English by any means available.",
                  style: bodyTextSmall(
                      context, Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.secondary,
                ))),
                child: Text(
                  "Achieved Badge",
                  style: bodyTextLarge(
                      context,
                      Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "No badge achieved yet.",
                  style: bodyTextSmall(
                      context, Theme.of(context).colorScheme.onBackground),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profession : ",
                    style: bodyTextMedium(
                        context,
                        Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
                  ),
                  Text(
                    "Student",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Intended Band Score : ",
                    style: bodyTextMedium(
                        context,
                        Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
                  ),
                  Text(
                    "7+",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reason : ",
                    style: bodyTextMedium(
                        context,
                        Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
                  ),
                  Text(
                    "Higher Study Abroad",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(
              //     width: 0.5,
              //     color: Theme.of(context).colorScheme.secondary,
              //   ))),
              //   child: Text(
              //     "Booked a test",
              //     style: bodyTextLarge(
              //       context,
              //       Theme.of(context).colorScheme.primary,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
