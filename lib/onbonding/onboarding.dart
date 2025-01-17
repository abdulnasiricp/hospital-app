// ignore_for_file: sized_box_for_whitespace

import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 4;

  late ColorNotifier notifire;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      // color: const Color(0xff2792f5),
                      color: darkYellow,
                      height: height,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Container(
                                    height: 300.0,
                                    width: double.infinity,
                                    child: Image.asset(
                                      "assets/Onboarding_1.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          "Online Report",
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Bold',
                                            color: notifire.getwihitecolor,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Welcome to Tez Health Care, your gateway to a world of online reports; this document will guide you in accessing, understanding, and utilizing our extensive report repository.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Medium',
                                            color: notifire.getwihitecolor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Container(
                                    height: 300.0,
                                    width: double.infinity,
                                    child: Image.asset(
                                      "assets/Onboarding_2.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          "Online Transaction",
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Bold',
                                            color: notifire.getwihitecolor,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Easily monitor all your transactions within our app, ensuring a seamless and efficient experience for your financial needs",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Medium',
                                            color: notifire.getwihitecolor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Container(
                                    height: 300.0,
                                    width: double.infinity,
                                    child: Image.asset(
                                      "assets/Onboarding_3.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          "Online Tickets",
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Bold',
                                            color: notifire.getwihitecolor,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Purchase tickets and schedule doctor appointments effortlessly through our app, offering a convenient and reliable platform for all your booking and healthcare needs",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Medium',
                                            color: notifire.getwihitecolor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Container(
                                    height: 300.0,
                                    width: double.infinity,
                                    child: Image.asset(
                                      "assets/Onboarding_4.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          "Online Payment",
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Bold',
                                            color: notifire.getwihitecolor,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Access our secure online payment gateway to conveniently settle hospital bills and manage financial transactions within this app, simplifying your healthcare and financial management.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy_Medium',
                                            color: notifire.getwihitecolor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _currentPage != _numPages - 1
                  ? Column(
                      children: [
                        SizedBox(height: height / 1.12),
                        Container(
                          color: Colors.transparent,
                          height: height / 11,
                          child: Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const MainSiginScreen());
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: Text(
                                            'Skip',
                                            style: TextStyle(
                                                fontFamily: 'Gilroy Medium',
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: _buildPageIndicator(),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _pageController.nextPage(
                                          duration:
                                              const Duration(microseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: Text(
                                            'Next',
                                            style: TextStyle(
                                                fontFamily: 'Gilroy Medium',
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: height / 1.12),
                        Container(
                          color: Colors.transparent,
                          height: height / 11,
                          child: Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(const MainSiginScreen());
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: Text(
                                            'Skip',
                                            style: TextStyle(
                                                fontFamily: 'Gilroy Medium',
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: _buildPageIndicator(),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(
                                        () => const MainSiginScreen(),
                                      );
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: Text(
                                            'Start',
                                            style: TextStyle(
                                                fontFamily: 'Gilroy Medium',
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
//testing
