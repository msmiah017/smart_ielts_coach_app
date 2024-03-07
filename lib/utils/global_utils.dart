import 'package:flutter/material.dart';


//All text styles
TextStyle bodyTextSmall(){
  return const TextStyle(
    fontSize: 14,
  );
}
TextStyle bodyTextMedium(BuildContext context){
  return TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.onBackground
  );
}
TextStyle bodyTextLarge(){
  return const TextStyle(
    fontSize: 24,
  );
}

TextStyle btnTextStyle(){
  return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
  );
}