import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        // print('Timer ticked');

        int? curPage = pageController.page?.toInt();
        if (curPage == null) {
          return;
        }
        int nextPage;
        if (curPage == 2) {
          nextPage = 0;
        } else {
          nextPage = curPage + 1;
        }
        pageController.animateToPage(nextPage,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: pageController,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: [1, 2, 3]
            .map<Widget>(
              (number) => Image.asset(
                'asset/img/$number.jpg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }
}
