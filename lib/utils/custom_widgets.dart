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
