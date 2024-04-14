import 'package:flutter/material.dart';


//All text styles
TextStyle bodyTextSmall(BuildContext context, Color color){
  return TextStyle(
    fontSize: 14,
      color: color
  );
}
TextStyle bodyTextMedium(BuildContext context, Color color){
  return TextStyle(
      fontSize: 16,
      color: color
  );
}
TextStyle bodyTextLarge(BuildContext context, Color color){
  return TextStyle(
    fontSize: 24, color: color
  );
}

TextStyle btnTextStyle(){
  return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
  );
}