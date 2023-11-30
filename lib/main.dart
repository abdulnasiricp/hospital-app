// ignore_for_file: avoid_print, prefer_final_fields, unused_field, non_constant_identifier_names, unused_local_variable, non_constant_identifier_names, non_constant_identifier_names, duplicate_ignore
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_Home_Bottom_bar.dart';
import 'package:TezHealthCare/language_Services/translation.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/themeService.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

bool _initialUriIsHandled = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true); // Set to false in production
  // // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  String? selectedLanguage =
      sharedPreferences.getString('selectedLanguage') ?? 'en';
  String defaultLang = selectedLanguage == 'ne' ? 'ne_NP' : 'en_US';
  print('========================> $defaultLang');
  String? role = await _isLoggedIn();
  runApp(MyApp(
    defaultLanguage: defaultLang,
    userRole: role,
  ));
}

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();
  factory AppTheme() => _instance;

  AppTheme._internal();

  Color appBarTextColor = Colors.black;
}

Future<String?> _isLoggedIn() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.containsKey('username') &&
      sharedPreferences.containsKey('password') &&
      sharedPreferences.containsKey('role')) {
    final String? role = sharedPreferences.getString('role');
    print('==============================> Role: $role');
    return role;
  }
  return null;
}

class MyApp extends StatefulWidget {
  final String defaultLanguage;
  final String? userRole;

  const MyApp({
    Key? key,
    required this.defaultLanguage,
    required this.userRole,
  }) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

@override
class _MyAppState extends State<MyApp> {
  // internet connection checker
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Column(
            children: [
              SvgPicture.asset(
                'assets/nointernet.svg',
                width: 30,
                height: 30,
              ),
              const Text('No Connection'),
            ],
          ),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

  String _latestLink = 'Unknown';
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;
  StreamSubscription? _sub;
  final _scaffoldKey = GlobalKey();
  final _cmds = getCmds();
  final _cmdStyle = const TextStyle(
      fontFamily: 'Courier', fontSize: 12.0, fontWeight: FontWeight.w700);
  @override
  void initState() {
    super.initState();
    getConnectivity();
    _handleIncomingLinks();
    _handleInitialUri();
  }

  /// Handle incoming links - the ones that the app will recieve from the OS
  /// while already started.
  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        String? NotificationId = uri?.path.substring(1);

        setState(() {
          _latestUri = uri;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        Fluttertoast.showToast(
          msg: 'Oops! Error Occured. $err',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        setState(() {
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  /////////////////////////////////////////////////////
  late String NotificationData = '';
  Future<void> getpatientDetails(NotificationId) async {
    final body = {
      'table': 'system_notification',
      'where': {'id': NotificationId}
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.OpdHistory),
        headers: ApiLinks.MainHeader,
        body: jsonEncode(body),
      );
      // Check if the response was successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        NotificationData = data['result'];
        print(NotificationData);
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

  ////////////////////////////////////////////
  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      _showSnackBar('_handleInitialUri called');
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('falied to get initial uri');
      } on FormatException catch (err) {
        if (!mounted) return;
        print('malformed initial uri');
        setState(() => _err = err);
      }
    }
  }

  void _showSnackBar(String msg) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _scaffoldKey.currentContext;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(msg),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ColorNotifier()),
        ],
        child: KhaltiScope(
          publicKey: "test_public_key_c976acda9afe490881d18f9856e6f896",
          enabledDebugging: true, // Set to false in production
          builder: (context, navKey) {
            return GetMaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.white, // Set your desired text color here
                    fontSize: 20, // You can set other text styles as well
                  ),
                  iconTheme: IconThemeData(
                    color:
                        Colors.white, // Set your desired back icon color here
                  ),
                ),
              ),
              locale: Locale(widget.defaultLanguage),
              translations: Translation(),
              debugShowCheckedModeBanner: false,
              darkTheme: Themes().darkTheme,
              home: _buildInitialScreen(),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInitialScreen() {
    if (widget.userRole == 'patient') {
      print('========================> Navigating to Bottomhome()');
      return const Bottomhome();
    } else if (widget.userRole == '3') {
      print(
          '===============================> Navigating to Doctor_Home_Bottom_bar()');
      return const Doctor_Home_Bottom_bar();
    } else {
      print(
          '===================================> Role not recognized. Navigating to Splash_Screen()');
      return const Splash_Screen();
    }
  }
}

List<String>? getCmds() {
  late final String cmd;
  var cmdSuffix = '';

  const plainPath = 'path/subpath';
  const args = 'path/portion/?uid=123&token=abc';
  const emojiArgs =
      '?arr%5b%5d=123&arr%5b%5d=abc&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82';

  if (kIsWeb) {
    return [
      plainPath,
      args,
      emojiArgs,
      // Cannot create malformed url, since the browser will ensure it is valid
    ];
  }

  if (Platform.isIOS) {
    cmd = '/usr/bin/xcrun simctl openurl booted';
  } else if (Platform.isAndroid) {
    cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
        ' -a android.intent.action.VIEW'
        ' -c android.intent.category.BROWSABLE -d';
    cmdSuffix = "'";
  } else {
    return null;
  }

  // https://orchid-forgery.glitch.me/mobile/redirect/
  return [
    '$cmd "tez://tez.hospital/$plainPath"$cmdSuffix',
  ];
}
