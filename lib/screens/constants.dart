import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const Color fixmaincolor = const Color(0xFFFDB515);
const Color fixsecondarycolor = const Color(0xFF58C0D0);
const primaryColor = Color(0xFF00BF6D);
const secondaryColor = Color(0xFFFE9901);
const contentColorLightTheme = Color(0xFF1D1D35);
const contentColorDarkTheme = Color(0xFFF5FCF9);
const warninngColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);

const defaultPadding = 16.0;
const kDefaultPadding = 20.0;

const InputDecoration otpInputDecoration = InputDecoration(
  filled: false,
  border: UnderlineInputBorder(),
  hintText: "0",
);

// For demo

final List<String> demoContactsImage =
    List.generate(5, (index) => "assets/images/user_${index + 1}.png");
