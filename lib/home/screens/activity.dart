import 'package:flutter/material.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Activity",
          style: bodyTextLarge(
              context, Theme.of(context).colorScheme.onBackground),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Theme.of(context).colorScheme.onBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 0.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ))),
                    child: Text(
                      "Started Tests",
                      style: bodyTextMedium(
                          context, Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Container(
                    child: Text(
                      "0 test started",
                      style: bodyTextSmall(
                          context, Theme.of(context).colorScheme.onBackground),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 0.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ))),
                    child: Text(
                      "Recently Viewed",
                      style: bodyTextMedium(
                          context, Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Container(
                    child: Text(
                      "0 test viewed in last 24 hours",
                      style: bodyTextSmall(
                          context, Theme.of(context).colorScheme.onBackground),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 0.5,
                color: Theme.of(context).colorScheme.secondary,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Completed Tests",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Last 7 days",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Text(
              "0 test completed in last 7 days",
              style: bodyTextSmall(
                  context, Theme.of(context).colorScheme.onBackground),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 0.5,
                color: Theme.of(context).colorScheme.secondary,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Highest Score",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Last 7 days",
                    style: bodyTextMedium(
                        context, Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Text(
              "0",
              style: bodyTextSmall(context, Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
