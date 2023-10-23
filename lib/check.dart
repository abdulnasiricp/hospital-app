// // Schedule a periodic task to check the API every minute
//     const duration = Duration(seconds: 30);
//     Timer.periodic(duration, (Timer t) {
//       checkForNewData();
//       print('1==========================>');
//     });
//     // Initialize currentDataLength with the length of the initial data
//     currentDataLength = data!.length;
//       print('1 $currentDataLength==========================>');




//   void checkForNewData() async {
//     // final newData = await fetchData(); // Fetch the latest data from the API
//     final newDataLength = DataMap?['result']
//         .length; // Assuming the data structure is similar to your existing data

//     if (newDataLength > currentDataLength) {
//       print('2==========================>');
//       print('newData ===========>$newDataLength');
//       print('current data ===========>$currentDataLength');


//       // New data is available
//       notificationServies.showNotification(
//           15,
//           'pathology Bill',
//           'New data are added please check your pathology Bill',
//           'navigate_to_pathology_bill');
//       // Store the notification data in shared preferences
//       final prefs = await SharedPreferences.getInstance();
//       final notifications = prefs.getStringList('notifications') ?? [];
//       notifications
//           .add('New data are added please check your pathology Bill');
//       prefs.setStringList('notifications', notifications);

//       setState(() {
//         currentDataLength = newDataLength;
//         data = DataMap?['result'];
//         filteredData = data;
//       });
//     }
//   }




//     // Workmanager initialization and registration
//   void initializeWorkManager() {
//     Workmanager().initialize(callbackDispatcher);
//     Workmanager().registerPeriodicTask(
//       "100", // Task ID (should be unique)
//       "checkForNewDataTask", // Task name
//       initialDelay: const Duration(minutes: 1), // Delay before the first execution
//       frequency: const Duration(minutes: 15), // Periodic check every 15 minutes
//       // inputData: <String, dynamic>{'payload': 'navigate_to_home_transaction_bill'},
//     );
//   }
//   void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     checkForNewData();
    
//     return Future.value(true);
//   });
// }



//   NotificationServies notificationServies = NotificationServies();
