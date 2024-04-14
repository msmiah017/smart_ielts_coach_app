import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

class SpeakingModule extends StatefulWidget {
  const SpeakingModule({super.key});

  @override
  State<SpeakingModule> createState() => _SpeakingModuleState();
}

class _SpeakingModuleState extends State<SpeakingModule>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
                msg: "This service is not available at the moment.",
                toastLength: Toast.LENGTH_LONG,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary);
          },
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(75),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: _animation.value,
                        spreadRadius: _animation.value,
                      ),
                    ],
                  ),
                  child: Text(
                    "Start Test",
                    style: bodyTextLarge(context, Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
