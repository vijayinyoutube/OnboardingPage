import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController myPageViewController=new PageController(viewportFraction: 0.8);
  double currentPage = 0;
  String name;
  bool checkValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: (MediaQuery.of(context).size.height)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildPageView(),
                buildDotIndicator(),
                buildGetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView() => Container(
        height: MediaQuery.of(context).size.height / 1.25,
        child: Container(
          child: PageView.builder(
            controller: myPageViewController,
            itemCount: 5,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              //  ScrollPosition ScrollPosition(physics: BouncingScrollPhysics(), context: myPageViewController.page),
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          width: 300, height: 250, child: Text("hai")),
                    ),
                    Flexible(
                      child: Text(
                        "asdasdasd",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.00,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: (MediaQuery.of(context).size.width) - 100,
                        child: Text(
                          "asdasdasd",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15.00,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
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
	controller: myPageViewController,  // PageController
	count:  5,

	// forcing the indicator to use a specific direction
	//textDirection: TextDirection.rtl,
	effect:  WormEffect(activeDotColor: Colors.blue,dotWidth: 10.0,dotHeight: 10,dotColor: Colors.grey[350]),
);


  Widget buildGetStartedButton() => Container(
        width: (MediaQuery.of(context).size.width) - 25,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.00)),
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
      );
}
