import 'package:flutter/material.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

class ReadingModule extends StatefulWidget {
  const ReadingModule({super.key});

  @override
  State<ReadingModule> createState() => _ReadingModuleState();
}

class _ReadingModuleState extends State<ReadingModule> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    // offset: const Offset(3,
                    //     3), // Move the shadow 3 unit to the right and 3 unit to the bottom
                    spreadRadius: 2, // No spreading of the shadow
                    blurRadius: 2, // Adjust the blur radius as needed
                  ),
                ]),
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: width * 0.5,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/mohammad.jpg"),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mohammad Miah",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground),
                                  ),
                                  Text("10 posted tests",
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
                    )),
                Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Passage 1 : Crop growing sky scrappers.",
                            style: bodyTextMedium(context, Theme.of(context).colorScheme.onBackground)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Passage 2 : The Falkirk Wheel.",
                            style: bodyTextMedium(context, Theme.of(context).colorScheme.onBackground)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Passage 3 : Reducing the effect of climate change.",
                            style: bodyTextMedium(context, Theme.of(context).colorScheme.onBackground)),
                      ],
                    )),
                Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
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
                            child: Text("Performed : 14", style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
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
                            child: Text("Highest : 38", style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
