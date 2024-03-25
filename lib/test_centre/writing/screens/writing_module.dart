import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ielts_coach_app/test_centre/writing/providers/writing_provider.dart';

import '../../../utils/global_utils.dart';

class WritingModule extends StatefulWidget {
  const WritingModule({super.key});

  @override
  State<WritingModule> createState() => _WritingModuleState();
}

class _WritingModuleState extends State<WritingModule> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeProvider();
  }

  Future<void> initializeProvider() async {
    await context.read<WritingProvider>().getWritingQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final writingProvider = Provider.of<WritingProvider>(context);
    if (writingProvider.writingQuestions.isEmpty) {
      return Center(
            child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.red,
          ));
    } else {
      return RefreshIndicator(
        onRefresh: () async {

          //===========================================/
          // ------ Highlight in Presentation --------//
          // If the server is off and a user do a refresh,
          // it keeps checking on the server. As soon as the
          // server is up, the api request completes without
          // refreshing again.

          // When a user pulls down to refresh
          writingProvider.setIsRefreshing(true);

          // Making an api request when user refresh the page
          await writingProvider.getWritingQuestions();

          // Once api call is done, the refreshing will be stopped.
          writingProvider.setIsRefreshing(false);
        },
        color: Theme.of(context).colorScheme.secondary,

        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
              itemCount: writingProvider.writingQuestions.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 10, top: 0, right: 10, bottom: 0),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground,
                          // offset: const Offset(3,
                          //     3), // Move the shadow 3 unit to the right and 3 unit to the bottom
                          spreadRadius: 2, // No spreading of the shadow
                          blurRadius: 2, // Adjust the blur radius as needed
                        ),
                      ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5,
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/logo/sic_black_bg_inapp.PNG"),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Smart IELTS Coach",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground),
                                      ),
                                      Text("Writing Essay",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary, // Set background color if active
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Add border radius
                                  ),
                                  child: const Text(
                                    "Start Test",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // The extra quotes here are for the text itself.
                            Text(
                                " \" ${writingProvider.writingQuestions[index]["questionStatement"]} \" ",
                                style: bodyTextMedium(context)),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                writingProvider.writingQuestions[index]
                                    ["questionText"],
                                style: bodyTextMedium(context), softWrap: true,),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5, top: 20, right: 5, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      // offset: const Offset(2, 2)
                                    )
                                  ]),
                              child: Text("Performed : 14",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      // offset: const Offset(2, 2)
                                    )
                                  ]),
                              child: Text("Highest : 38",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
      );
    }
  }
}
