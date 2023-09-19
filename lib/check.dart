// void fetchData() async {
//   setState(() {
//     isLoading = true;
//     responseData;
//     DoneListData;
//   });
//
//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Soft-service': 'TezHealthCare',
//         'Auth-key': authKey,
//       },
//       body: json.encode({"patient_id": patientId}),
//     );
//
//     if (response.statusCode == 200) {
//       setState(() {
//         responseData = json.decode(response.body);
//         DoneListData = responseData?['ambulance_bill'];
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//       DoneListData = null; // Set DoneListData to null indicating no data
//       print("$e"); // Print the error message
//     });
//   }
// }
//
// // ...
//
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Your Title'),
//     ),
//     body: Center(
//       child: isLoading
//           ? CircularProgressIndicator()
//           : DoneListData == null || DoneListData.isEmpty
//           ? Text('No data available')  // Display "No data available" text
//           : ListView.builder(
//         itemCount: DoneListData.length,
//         itemBuilder: (context, index) {
//           // Build your UI using DoneListData[index]
//         },
//       ),
//     ),
//   );
// }
