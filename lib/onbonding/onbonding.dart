import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Onbonding extends StatefulWidget {
  const Onbonding({Key? key}) : super(key: key);

  @override
  _OnbondingState createState() => _OnbondingState();
}

class _OnbondingState extends State<Onbonding> {
  final int _numPages = 3;

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
                      color: const Color(0xff2792f5),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage("assets/onimage.png"),
                                        fit: BoxFit.fill),
                                    color: const Color(0xff2792f5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50.sp),
                                      topLeft: Radius.circular(50.sp),
                                    ),
                                  ),
                                  height: height,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: height / 6.5),
                                        Text(
                                          EnString.qualityReputations,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Bold',
                                              color: notifire.getwihitecolor,
                                              fontSize: 22.sp),
                                        ),
                                        SizedBox(height: height / 40),
                                        Text(
                                          EnString
                                              .theteamofreputabledoctorshasmanyyearsofprofessionalexperience,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Medium',
                                              color: notifire.getwihitecolor,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("assets/twoonbod.png"),
                                        fit: BoxFit.fill),
                                    color: const Color(0xff2792f5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50.sp),
                                      topLeft: Radius.circular(50.sp),
                                    ),
                                  ),
                                  height: height,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: height / 6.5),
                                        Text(
                                          EnString.onlinehealthcheck,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Bold',
                                              color: notifire.getwihitecolor,
                                              fontSize: 22.sp),
                                        ),
                                        SizedBox(height: height / 40),
                                        Text(
                                          EnString
                                              .easyandconvenientonlinecheckupsrightfromyourhome,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Medium',
                                              color: notifire.getwihitecolor,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/onbondingthree.png"),
                                        fit: BoxFit.fill),
                                    color: const Color(0xff2792f5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50.sp),
                                      topLeft: Radius.circular(50.sp),
                                    ),
                                  ),
                                  height: height,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: height / 6.5),
                                        Text(
                                          EnString.researchdeeptesting,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Bold',
                                              color: notifire.getwihitecolor,
                                              fontSize: 22.sp),
                                        ),
                                        SizedBox(height: height / 40),
                                        Text(
                                          EnString
                                              .ensurethemostaccurateresultsforthehealthofyouandyourfamily,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy_Medium',
                                              color: notifire.getwihitecolor,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
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
                                      Get.to(() => const Bottomhome());
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: height / 20,
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
                                      height: height / 20,
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
                                      Get.to(const Bottomhome());
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: height / 20,
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
                                      height: height / 20,
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
