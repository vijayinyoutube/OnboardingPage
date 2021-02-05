import 'package:exeappgetsrt/Declarations/GetStartedPage.dart';
import 'package:exeappgetsrt/Declarations/Images/ImageFiles.dart';
import 'package:exeappgetsrt/GeneralWidgets/GWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  double currentPage = 0;
  String name;
  bool checkValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: (MediaQuery.of(context).size.height)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildPageView(),
                 heightSpacer(30.00),
                buildDotIndicator(),
                heightSpacer(100.00),
                buildGetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView() => Container(
        height: MediaQuery.of(context).size.height / 1.55,
        child: Container(
          child: PageView.builder(
            controller: myPageViewController,
            itemCount: 4,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.00),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: Image.asset(
                            getStartedPageImages[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          heading[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: HexColor("#7DA3F3"),
                            fontSize: 20.00,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      heightSpacer(10.00),
                      Flexible(
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
                      ),
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (value) {
              try {
                setState(() {
                  currentPage = value.toDouble();
                });
              } catch (e) {}
            },
          ),
        ),
      );

  Widget buildDotIndicator() => SmoothPageIndicator(
        controller: myPageViewController,
        count: 4,
        effect: WormEffect(
            activeDotColor: HexColor("#7DA3F3"),
            dotWidth: 10.0,
            dotHeight: 10,
            dotColor: Colors.grey[350]),
      );

  Widget buildGetStartedButton() => currentPage == 3
      ? Container(
          width: (MediaQuery.of(context).size.width) - 25,
          height: 50,
          child: ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: HexColor("#7DA3F3"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.00)),
            ),
            child: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.00,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
        )
      : buildNextbackBtn(currentPage);
}

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
                        color: HexColor("#7DA3F3"),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: HexColor("#7DA3F3"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
