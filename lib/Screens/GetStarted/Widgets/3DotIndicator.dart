import 'package:exeappgetsrt/Declarations/Global/GlobalDeclarations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:exeappgetsrt/Declarations/GetStartedPage.dart';
import 'package:flutter/material.dart';

Widget buildDotIndicator() => SmoothPageIndicator(
      controller: myPageViewController,
      count: 4,
      effect: WormEffect(
          activeDotColor: primaryColor,
          dotWidth: 10.0,
          dotHeight: 10,
          dotColor: Colors.grey[350]),
    );
