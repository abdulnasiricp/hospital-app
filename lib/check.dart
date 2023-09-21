import 'package:TezHealthCare/bottomscreen/Profile/profile.dart';
import 'package:TezHealthCare/bottomscreen/home/myappoiment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';

import 'bottomscreen/chat/chat.dart';
import 'bottomscreen/home/Patient Screens/Patient_home.dart';

class Bottomhome extends StatefulWidget {
  const Bottomhome({Key? key}) : super(key: key);

  @override
  _BottomhomeState createState() => _BottomhomeState();
}

class _BottomhomeState extends State<Bottomhome> {
  int _selectedIndex = 0;
  late ColorNotifier notifier;
  DateTime? currentBackPressTime; // Track back button press time

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return WillPopScope(
      onWillPop: _onBackPressed, // Handle back button press
      child: Scaffold(
        backgroundColor: notifier.getwihitecolor,
        bottomNavigationBar: SalomonBottomBar(
          curve: Curves.easeInOut,
          selectedItemColor: notifier.getperple,
          currentIndex: _selectedIndex,
          items: [
            // Your bottom bar items...
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

  Future<bool> _onBackPressed() {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press back again to exit',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
      );
      return Future.value(false); // Prevent the app from closing
    }
    return Future.value(true); // Allow the app to close
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const  PatientHomePage(),
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
