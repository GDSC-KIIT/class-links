import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // static const FlexSchemeColor _myScheme1Light = FlexSchemeColor(
  //   primary: Color(0xFF00296B),
  //   primaryVariant: Color(0xFF2F5C91),
  //   secondary: Color(0xFFFF7B00),
  //   secondaryVariant: Color(0xFFFDB100),
  //   appBarColor: Color(0xFFf95738),
  // );

  // static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
  //   primary: Color(0xFF6B8BC3),
  //   primaryVariant: Color(0xFF4874AA),
  //   secondary: Color(0xffff7155),
  //   secondaryVariant: Color(0xFFF1CB9D),
  //   appBarColor: Color(0xFF892807),
  // );

  static final FlexSchemeColor _myScheme2Light =
      FlexSchemeColor.from(primary: const Color(0xFF055C34));
  static final FlexSchemeColor _myScheme2Dark =
      FlexSchemeColor.from(primary: const Color(0xFF629F80));

  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF04368E),
    secondary: const Color(0xFFA00505),
  );

  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    // const FlexSchemeData(
    //   name: 'C1: Midnight',
    //   description: 'Midnight blue theme, created by using custom color values '
    //       'for all colors in the scheme',
    //   light: _myScheme1Light,
    //   dark: _myScheme1Dark,
    // ),
    FlexSchemeData(
      name: 'C2: Greens',
      description: 'Vivid green theme, created from one primary color in light '
          'mode and another primary for dark mode',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    FlexSchemeData(
      name: 'C3: Red & Blue',
      description: 'Classic read and blue, created from only light theme mode '
          'primary and secondary colors',
      light: _myScheme3Light,
      dark: _myScheme3Light.toDark(),
    ),
    ...FlexColor.schemesList,
  ];
}
