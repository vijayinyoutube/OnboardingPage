import 'package:flutter/material.dart';

PageController myPageViewController = new PageController(viewportFraction: 0.8);
final ValueNotifier<double> currentPage = ValueNotifier<double>(0.0);

List heading = <String>[
  "Stay Fit & Healthy",
  "Simple workouts",
  "Manage Diet",
  "Track Progress",
];

List subHeading = <String>[
  "Stay healthy by doing simple exercises you prefer.",
  "Easily workout indoor exercises, meditations and yoga with this app.",
  "Regulate your diet patterns and food habits with recommendation option.",
  "Track your workout paterns and visualize you every day progress.",
];
