import 'package:exeappgetsrt/Declarations/Global/GlobalDeclarations.dart';
import 'package:exeappgetsrt/Declarations/Images/ImageFiles.dart';
import 'package:exeappgetsrt/Declarations/GetStartedPage.dart';
import 'package:exeappgetsrt/GeneralWidgets/GWidgets.dart';
import 'package:flutter/material.dart';

Widget buildPageView(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 1.55,
      child: Container(
        child: PageView.builder(
          controller: myPageViewController,
          itemCount: 4,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildTopViews(context, index);
          },
          onPageChanged: (value) {
            try {
              currentPage.value = value.toDouble();
            } catch (e) {}
          },
        ),
      ),
    );

Widget buildTopViews(BuildContext context, int index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.00),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(index),
            heightSpacer(25.00),
            buildTitle(index),
            heightSpacer(10.00),
            buildSubTitle(context, index),
          ],
        ),
      ),
    );

Widget buildImage(int index) => Center(
      child: Container(
        width: double.infinity,
        height: 200,
        child: Image.asset(
          getStartedPageImages[index],
          fit: BoxFit.contain,
        ),
      ),
    );

Widget buildTitle(int index) => Flexible(
      child: Text(
        heading[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: primaryColor,
          fontSize: 20.00,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

Widget buildSubTitle(BuildContext context, int index) => Flexible(
      child: Container(
        width: (MediaQuery.of(context).size.width) - 100,
        child: Text(
          subHeading[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.75,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
