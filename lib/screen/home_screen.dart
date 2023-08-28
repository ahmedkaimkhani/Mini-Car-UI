import 'dart:async';

import 'package:car_app_flutter/constrants/colors.dart';
import 'package:car_app_flutter/wigets/gridview.dart';
import 'package:flutter/material.dart';

import '../wigets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNo = 0;

  late final Timer carasouelTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageNo == 5) {
        pageNo = 0;
      } else {
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
        pageNo++;
      }
    });
  }

  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTimer = getTimer();
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
      backgroundColor: tdBGColor,
      appBar: customAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
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
                          left: 4, right: 4, top: 36, bottom: 14),
                      height: 300,
                      decoration: BoxDecoration(
                          color: tdAmber,
                          borderRadius: BorderRadius.circular(24)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Image.network(
                          '${carsList.elementAt(index)['image']}',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                    color: pageNo == index ? tdAmber : Colors.grey[300],
                  ),
                ),
              ),
            ),
            CustomGridView(),
          ],
        ),
      )),
    );
  }
}
