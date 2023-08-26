import 'dart:async';

import 'package:car_app_flutter/screen/gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNo = 0;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      } else {
        pageController.animateToPage(pageNo,
            duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
      }
    });
  }

  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: 5,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                controller: pageController,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      return child!;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 4, right: 4, top: 36, bottom: 12),
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                  );
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => Container(
                          margin: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.circle,
                            size: 12,
                            color: pageNo == index
                                ? Colors.amber
                                : Colors.grey[300],
                          ),
                        )))
          ],
        ),
      )),
    );
  }
}
