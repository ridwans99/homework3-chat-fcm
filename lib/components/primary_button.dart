import 'package:flutter/material.dart';

import '../screens/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = primaryColor,
    this.padding = const EdgeInsets.all(defaultPadding),
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class PrimaryButton2 extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final color, textColor;
  final width;
  final shadowColor, borderColor;
  const PrimaryButton2({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.width,
    required this.shadowColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: textColor,
          // onSurface: Colors.blue,
          shadowColor: shadowColor,
          minimumSize: const Size(0, 50),
          alignment: Alignment.center,
          animationDuration: const Duration(
              milliseconds: 200), //Durasi tombolnya ke angkat pas di klik
          elevation: 2, //Kadar ketinggian elevasi nya
          side: BorderSide(
            color: borderColor,
            width: 2,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // side: BorderSide(color: Colors.red.shade900, width: 2),
          // padding: EdgeInsets.all(10),
          // visualDensity: VisualDensity.compact, //Kepadatan sisi dengan dalamnya
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
