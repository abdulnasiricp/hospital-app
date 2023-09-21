// import 'package:flutter/material.dart';
// import 'package:hello_world/modal/noticebord.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key key}) : super(key: key);
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }
// class _NotificationScreenState extends State<NotificationScreen> {
//   Future<List<Noticebord>> getRequest() async {
//     String url = "https://birgunjcollege.com/apinotice";
//     final response =
//     await http.get(Uri.parse('https://birgunjcollege.com/apinotice'));
//
//     var responseData = response.body;
//     print(responseData);
//     final List<Noticebord> users = noticebordFromJson(responseData);
//     return users;
//   }
//
//   @override
//   void initState() {
//     getRequest();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Notice"),
//           backgroundColor: Colors.red,
//         ),
//         body: Container(
//           padding: EdgeInsets.all(5.0),
//           child: FutureBuilder<List<Noticebord>>(
//             future: getRequest(),
//             builder: (BuildContext ctx, snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               } else {
//                 return ListView.separated(
//                   separatorBuilder: (context, index) => Divider(
//                     color: Colors.black,
//                   ),
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (ctx, index) => Card(
//                     child: new InkWell(
//                       onTap: () async {
//                         if (await canLaunch(snapshot.data[index].docfile) !=
//                             null) {
//                           // Launch the App
//                           await launch(snapshot.data[index].docfile);
//                         }
//                       },
//                       child: ListTile(
//                         title: Text(snapshot.data[index].heading,
//                           style: TextStyle(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         subtitle:
//                         Text(snapshot.data[index].created_on.toString()),
//                         leading: Builder(
//                           builder: (BuildContext context) {
//                             return IconButton(
//                               icon: const Icon(Icons.notifications_on_sharp,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () async {
//                                 if (await canLaunch(
//                                     snapshot.data[index].docfile) !=
//                                     null) {
//                                   // Launch the App
//                                   await launch(snapshot.data[index].docfile);
//                                 }
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }