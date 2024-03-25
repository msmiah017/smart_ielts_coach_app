import 'package:flutter/material.dart';

Widget buildErrorMessageWidget(
    BuildContext context, String errorMessage, bool isVisible, double width) {
  return Visibility(
    visible: isVisible,
    child: Center(
      child: Container(
        width: width * 0.8,
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    ),
  );
}

BottomNavigationBarItem customBottomNavBarItem(
    BuildContext context, IconData iconData, String label) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        // color: Theme.of(context).colorScheme.secondary,
        size: 30,
      ),
      label: label);
}

Widget testCentreTextButtons(
    BuildContext context, String btnText, VoidCallback onPressed, bool isActive) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).colorScheme.primary : null, // Set background color if active
        borderRadius: BorderRadius.circular(8.0), // Add border radius
      ),
      child: Text(btnText, style: TextStyle(
        fontSize: 14,
         color: !isActive ? Theme.of(context).colorScheme.primary : Colors.white
      ),),
    ),
  );
}
