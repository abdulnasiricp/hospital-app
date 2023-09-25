import 'package:flutter/cupertino.dart';

import 'colors.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = true;

  set setIsDark(v) {
    isDark = v;
    notifyListeners();
  }

  // get getIsDark => isDark;

  get getwihitecolor => isDark ? darkchatcolor : darkYellow;

  get getperple => isDark ? darkYellow : whitecolor;

  get getblack => isDark ? black : darkblack;

  get getgrey => isDark ? grey : darkgrey; 

  get getdarkyellow => isDark ? darkYellow : whitecolor;

  get getdarkwhite => isDark ? grey : darkYellow;


  get getchatcolor => isDark ? chatcolor : darkchatcolor;

get getkmcolor => isDark ? darkkmcolor : kmcolor;

// get getconcirmstockbuycolor =>
//     isDark ? darkconcirmstockbuycolor : concirmstockbuycolor;

// get getprefixicon => isDark ? prefixicon : darkprefixicon;
}
