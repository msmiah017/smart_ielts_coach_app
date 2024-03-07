import 'package:flutter/material.dart';
import 'package:smart_ielts_coach_app/main.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

//This is the Text Field template for the app which will be inherited throughout the project.
class CustomTextField extends StatelessWidget {
  final BuildContext context;
  final String labelText;
  final String? hintText;
  final bool password;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;

  const CustomTextField({
    super.key,
    required this.context,
    required this.labelText,
    this.hintText,
    required this.password,
    required this.controller,
    this.onChanged,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {},
      obscureText: password,
      decoration: InputDecoration(
          label: Text(labelText),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary, width: 1.0),
          ),
          hintText: hintText,
          suffixIcon: password
              ? IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.remove_red_eye),
                  color: Theme.of(context).colorScheme.onBackground,
                )
              : null,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          )),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}

class CustomSubmitButton extends StatelessWidget {
  final BuildContext context;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomSubmitButton({
    super.key,
    required this.context,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 50,
      width: width * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(btnTextStyle()),
          foregroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.onPrimary),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                // Color when pressed
                return Colors.red;
              } else if (states.contains(MaterialState.hovered)) {
                // Color when hovered
                return Colors.blue;
              } else if (states.contains(MaterialState.disabled)) {
                // Color when disabled
                return Theme.of(context).colorScheme.primary;
              }
              // Default color
              return Theme.of(context).colorScheme.primary;
            },
          ),
        ),
        child: Text(
          buttonText.toUpperCase(),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}

//********************************** Custom Submit Button Template **********************
class CustomTextButton extends StatelessWidget {
  final BuildContext context;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.context,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(btnTextStyle()),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              // Color when pressed
              return Colors.red;
            } else if (states.contains(MaterialState.hovered)) {
              // Color when hovered
              return Colors.blue;
            } else if (states.contains(MaterialState.disabled)) {
              // Color when disabled
              return Theme.of(context).colorScheme.tertiary;
            }
            // Default color
            return Theme.of(context).colorScheme.secondary;
          },
        ),
      ),
      child: Text(buttonText),
    );
  }
}
