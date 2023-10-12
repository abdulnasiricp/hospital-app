// import 'package:flutter/material.dart';

// class ContactScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact'),
//       ),
//       body: Column(
//         children: [
//           // Header section
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'connect IPS',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'pay direct from bank',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Divider
//           Divider(
//             height: 2,
//             thickness: 2,
//           ),

//           // Contact information section
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'For linked bank account specific queries and transaction errors, you may contact your bank. For other queries, please contact to our support team.',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),

//                 // Contact information list
//                 ListView(
//                   shrinkWrap: true,
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.call),
//                       title: Text('Support Call'),
//                       subtitle: Text('015970065, 01-4255306, 16600155306, +977-9801528400'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.email),
//                       title: Text('Email'),
//                       subtitle: Text('support@nchl.com.np'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.web),
//                       title: Text('Website'),
//                       subtitle: Text('connectips.com'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.question_answer),
//                       title: Text('Help Desk'),
//                       subtitle: Text('NCHL Support'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.report),
//                       title: Text('Report Query'),
//                       subtitle: Text('Submit your query here'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
