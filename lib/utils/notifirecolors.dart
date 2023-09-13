import 'package:flutter/cupertino.dart';

import 'colors.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = false;

  set setIsDark(v) {
    isDark = v;
    notifyListeners();
  }

  get getIsDark => isDark;

  get getwihitecolor => isDark ? darkwihitecolor : wihitecolor;

  get getperple => isDark ? yellow : darkYellow;

  get getblack => isDark ? black : darkblack;

  get getgrey => isDark ? grey : darkgrey;

  get getchatcolor => isDark ? chatcolor : darkchatcolor;

get getkmcolor => isDark ? darkkmcolor : kmcolor;

// get getconcirmstockbuycolor =>
//     isDark ? darkconcirmstockbuycolor : concirmstockbuycolor;

// get getprefixicon => isDark ? prefixicon : darkprefixicon;
}
