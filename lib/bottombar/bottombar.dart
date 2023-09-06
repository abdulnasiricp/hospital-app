import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/bottomscreen/chat/chat.dart';
import 'package:TezHealthCare/bottomscreen/home/myappoiment.dart';
import 'package:TezHealthCare/bottomscreen/profile.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../bottomscreen/home/home.dart';

class Bottomhome extends StatefulWidget {
  const Bottomhome({Key? key}) : super(key: key);

  @override
  _BottomhomeState createState() => _BottomhomeState();
}

class _BottomhomeState extends State<Bottomhome> {
  int _selectedIndex = 0;
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(backgroundColor: notifier.getwihitecolor,
        bottomNavigationBar: SalomonBottomBar(curve:Curves.easeInOut ,
          selectedItemColor: notifier.getperple,
          currentIndex: _selectedIndex,
          items: [
            SalomonBottomBarItem(
              icon: Image.asset("assets/home.png", height: height / 30,color: Colors.blue[300]),
              title: Text(
                EnString.home,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: notifier.getperple,
                    fontFamily: 'Gilroy_Bold'),
              ),
              selectedColor: notifier.getperple,
            ),
            SalomonBottomBarItem(
              icon: Image.asset("assets/Schedule.png", height: height / 30,color: Colors.blue[300],),
              title: Text(
                EnString.sche,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: notifier.getperple,
                    fontFamily: 'Gilroy_Bold'),
              ),
              selectedColor: notifier.getperple,
            ),
            SalomonBottomBarItem(
              icon: Image.asset("assets/chat.png", height: height / 30,color: Colors.blue[300]),
              title: Text(
                EnString.chat,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: notifier.getperple,
                    fontFamily: 'Gilroy_Bold'),
              ),
              selectedColor: notifier.getperple,
            ),
            SalomonBottomBarItem(
              icon: Image.asset("assets/profile.png", height: height / 30,color: Colors.blue[300]),
              title: Text(
                EnString.profile,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: notifier.getperple,
                    fontFamily: 'Gilroy_Bold'),
              ),
              selectedColor: notifier.getperple,
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomePage(),
          const MyAppoiment(),
          const Chat(),
          const Profile(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
