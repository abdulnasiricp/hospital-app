// import 'package:flutter/material.dart';


// class DynamicRowList extends StatefulWidget {
//   const DynamicRowList({Key? key}) : super(key: key);

//   @override
//   _DynamicRowListState createState() => _DynamicRowListState();
// }

// class _DynamicRowListState extends State<DynamicRowList> {
//   List<Widget> rows = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//      body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 // Add a new row when the "Add" button is clicked
//                 rows.add(buildRow());
//               });
//             },
//             child: Text('Add'),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: rows.length,
//               itemBuilder: (context, index) {
//                 return rows[index];
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRow() {
//     TextEditingController textFieldController = TextEditingController();

//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: textFieldController,
//             decoration: InputDecoration(labelText: 'Enter text'),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               // Remove the row when the "Cancel" button is clicked
//               rows.removeLast();
//             });
//           },
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }
// }
