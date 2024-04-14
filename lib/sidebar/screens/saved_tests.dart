import 'package:flutter/material.dart';

import '../../utils/global_utils.dart';

class SavedTests extends StatefulWidget {
  const SavedTests({super.key});

  @override
  State<SavedTests> createState() => _SavedTestsState();
}

class _SavedTestsState extends State<SavedTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Saved Tests",
          style: bodyTextLarge(context, Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
