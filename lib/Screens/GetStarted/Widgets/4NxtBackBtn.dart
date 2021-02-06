import 'package:exeappgetsrt/Declarations/Global/GlobalDeclarations.dart';
import 'package:exeappgetsrt/Declarations/GetStartedPage.dart';
import 'package:flutter/material.dart';

Widget buildNextbackBtn(double currentPage) => Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentPage != 0
                ? GestureDetector(
                    onTap: () {
                      myPageViewController.previousPage(
                          duration: Duration(seconds: 1), curve: Curves.ease);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.navigate_before),
                          Text(
                            "Back",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            GestureDetector(
              onTap: () {
                myPageViewController.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
