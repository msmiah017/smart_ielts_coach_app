import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../sidebar/models/dashboard_models.dart';
import '../../utils/global_utils.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<SpeakingData> speakingDataList = [];
  List<WritingData> writingDataList = [];
  Random random = Random();

  @override
  void initState() {
    // TODO: implement initState
    createSpeakingData();
    createWritingData();
    super.initState();
  }

  void createSpeakingData() {
    for (int i = 1; i <= 20; i++) {
      int randomNumber = random.nextInt(9) + 1;
      speakingDataList.add(SpeakingData(i, randomNumber));
    }
  }

  void createWritingData() {
    for (int i = 1; i <= 20; i++) {
      int randomNumber = random.nextInt(9) + 1;
      writingDataList.add(WritingData(i, randomNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "The following charts will help you understand where you may need improvement.",
              style: bodyTextLarge(context, Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
          ),

          //Reading Chart----------
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary,
            ))),
            child: Text(
              "Your performance in Reading Tests",
              style: bodyTextMedium(
                  context, Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: SfCartesianChart(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                title: const ChartTitle(
                    text: 'Mark vs Test Number',
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                primaryXAxis: const NumericAxis(
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Test Number',
                      textStyle: TextStyle(color: Colors.white)),
                  interval: 1,
                ),
                primaryYAxis: const NumericAxis(
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Obtained Mark',
                      textStyle: TextStyle(color: Colors.white)),
                  minimum: 0,
                  maximum: 40,
                ),
                series: <CartesianSeries>[
                  LineSeries<TestData, int>(
                    color: Theme.of(context).colorScheme.primary,
                    dataSource: <TestData>[
                      TestData(1, 30),
                      TestData(2, 24),
                      TestData(3, 28),
                      TestData(4, 35),
                      TestData(5, 33),
                      TestData(6, 22),
                      TestData(7, 18),
                      TestData(8, 26),
                    ],
                    xValueMapper: (TestData data, _) => data.testNumber,
                    yValueMapper: (TestData data, _) => data.score,
                    name: 'Score',
                  ),
                ]),
          ),
          const SizedBox(
            height: 30,
          ),

          //Listening Chart----------
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary,
            ))),
            child: Text(
              "Your performance in Listening Tests",
              style: bodyTextMedium(
                  context, Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: SfCartesianChart(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                title: const ChartTitle(
                    text: 'Mark vs Test Number',
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                primaryXAxis: const NumericAxis(
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Test Number',
                      textStyle: TextStyle(color: Colors.white)),
                  interval: 1,
                ),
                primaryYAxis: const NumericAxis(
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Obtained Mark',
                      textStyle: TextStyle(color: Colors.white)),
                  minimum: 0,
                  maximum: 40,
                ),
                series: <CartesianSeries>[
                  LineSeries<TestData, int>(
                    color: Theme.of(context).colorScheme.primary,
                    dataSource: <TestData>[
                      TestData(1, 30),
                      TestData(2, 24),
                      TestData(3, 28),
                      TestData(4, 35),
                      TestData(5, 33),
                      TestData(6, 22),
                      TestData(7, 18),
                      TestData(8, 26),
                    ],
                    xValueMapper: (TestData data, _) => data.testNumber,
                    yValueMapper: (TestData data, _) => data.score,
                    name: 'Score',
                  ),
                ]),
          ),
          const SizedBox(
            height: 30,
          ),

          //Speaking Chart----------
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary,
            ))),
            child: Text(
              "Your performance in Speaking Tests",
              style: bodyTextMedium(
                  context, Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: SfCartesianChart(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                title: const ChartTitle(
                    text: 'Score vs Test Number',
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                primaryXAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Test Number',
                      textStyle: TextStyle(color: Colors.white)),
                  interval: 5,
                ),
                primaryYAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Band Score',
                      textStyle: TextStyle(color: Colors.white)),
                  minimum: 0,
                  maximum: 9,
                  interval: 1,
                ),
                series: <CartesianSeries>[
                  LineSeries<SpeakingData, int>(
                    color: Theme.of(context).colorScheme.primary,
                    dataSource: speakingDataList,
                    xValueMapper: (SpeakingData data, _) => data.testNumber,
                    yValueMapper: (SpeakingData data, _) => data.bandScore,
                    name: 'Score',
                  ),
                ]),
          ),
          const SizedBox(
            height: 30,
          ),

          //Writing Chart----------
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary,
            ))),
            child: Text(
              "Your performance in Writing Tests",
              style: bodyTextMedium(
                  context, Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: SfCartesianChart(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                title: const ChartTitle(
                    text: 'Score vs Test Number',
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                primaryXAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Test Number',
                      textStyle: TextStyle(color: Colors.white)),
                  interval: 5,
                ),
                primaryYAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                  title: AxisTitle(
                      text: 'Band Score',
                      textStyle: TextStyle(color: Colors.white)),
                  minimum: 0,
                  maximum: 9,
                  interval: 1,
                ),
                series: <CartesianSeries>[
                  LineSeries<WritingData, int>(
                    color: Theme.of(context).colorScheme.primary,
                    dataSource: writingDataList,
                    xValueMapper: (WritingData data, _) => data.testNumber,
                    yValueMapper: (WritingData data, _) => data.bandScore,
                    name: 'Score',
                  ),
                ]),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    ));
  }
}
