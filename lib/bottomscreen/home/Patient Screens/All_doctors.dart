// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class AllDoctorsList extends StatefulWidget {
  const AllDoctorsList({Key? key}) : super(key: key);

  @override
  State<AllDoctorsList> createState() => _AllDoctorsListState();
}

class _AllDoctorsListState extends State<AllDoctorsList> {
  Map<String, dynamic>? DataMap;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true; // Control the loading indicator

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    try {
      final response = await http.post(
        Uri.parse(ApiLinks.getAllDoctor),
        headers:ApiLinks.MainHeader,
      );
      if (response.statusCode == 200) {
        DataMap = json.decode(response.body);
        setState(() {
          data = DataMap!['doctors'];
          filteredData = data;
          isLoading = false; // Set isLoading to false when data is loaded
        });
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false; // Set isLoading to false on error
      });
    }
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
              element['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true; // Set isLoading to true to show shimmer
    });

    // Fetch data when the user pulls down to refresh
    await fetchDataFromAPI();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 65),
            child: SafeArea(
                child: Container(
              decoration: BoxDecoration(color: darkYellow, boxShadow: const [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5)),
              ]),
              alignment: Alignment.center,
              child: AnimationSearchBar(
                  previousScreen: const Bottomhome(),
                  isBackButtonVisible: true,
                  backIconColor: whitecolor,
                  centerTitle: 'selectADoctor'.tr,
                  centerTitleStyle: TextStyle(color: whitecolor, fontSize: 20),
                  searchIconColor: whitecolor,
                  searchFieldDecoration: BoxDecoration(
                      color: whitecolor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  closeIconColor: whitecolor,
                  onChanged: (query) => filterData(query),
                  searchTextEditingController: searchController,
                  horizontalPadding: 5),
            ))),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: isLoading
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Adjust alignment as needed
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Adjust alignment as needed
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 130,
                                height: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 120,
                                height: 10,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 100,
                                height: 5,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 150,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      12.5), // Half of the height to make it circular
                                  // Add other properties like boxShadow if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : filteredData!.isEmpty
                  ? Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Lottie.asset(
                          'assets/No_Data_Found.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 0,
                              ),
                              itemCount: filteredData!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 5,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '${filteredData![index]['image']}', 
                                                    width:
                                                        200.0, 
                                                    height:
                                                        200.0, // Set the height (optional)
                                                    fit: BoxFit
                                                        .cover, // Set the BoxFit (optional)
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      } else {
                                                        return CircularProgressIndicator(
                                                          color: darkYellow,
                                                          backgroundColor:
                                                              yellow,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData?[index]['name']} ${filteredData?[index]['surname']}'
                                                        .isEmpty
                                                    ? "N/A"
                                                    : '${filteredData?[index]['name']} ${filteredData?[index]['surname']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData?[index]['specialization']}'
                                                        .isEmpty
                                                    ? "N/A"
                                                    : '${filteredData?[index]['specialization']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData?[index]['qualification']} '
                                                        .isEmpty
                                                    ? "N/A"
                                                    : '${filteredData?[index]['qualification']} ',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 30,
                                                width: width,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  color: yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        SelectDateScreen(
                                                          workExp:
                                                              filteredData![
                                                                      index]
                                                                  ['work_exp'],
                                                          doctorId:
                                                              filteredData![
                                                                  index]['id'],
                                                          doctorImage:
                                                              filteredData![
                                                                      index]
                                                                  ['image'],
                                                          doctorName:
                                                              filteredData![
                                                                          index]
                                                                      ['name'] +
                                                                  " " +
                                                                  filteredData![
                                                                          index]
                                                                      [
                                                                      'surname'],
                                                          doctorSpecialization:
                                                              filteredData![
                                                                      index][
                                                                  'specialization'],
                                                          department_id:
                                                              filteredData![
                                                                      index][
                                                                  'department_id'],
                                                        ));
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'bookAppointment'.tr,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
