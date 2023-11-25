// ignore_for_file: file_names, constant_identifier_names

class ApiLinks {
  static const Map<String, String> MainHeader = {
    'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
  };

  static const String BASE_URL = "https://uat.tez.hospital/xzy/webservice";  
  static const String Loginapiforboth =
      "https://uat.tez.hospital/xzy/auth/login";
  static const String logout =
      "https://uat.tez.hospital/xzy/auth/patient_logout";
  static const String stafflogout =
      "https://uat.tez.hospital/xzy/auth/staff_logout";
  static const String update_password =
      "https://uat.tez.hospital/xzy/auth/update_password";
  static const String forget_password =
      "https://uat.tez.hospital/xzy/auth/forget_password";
  static const String getAllDoctor = "$BASE_URL/getAllDoctor";
  static const String getAllPayment = "$BASE_URL/getAllPayment";
  static const String generateBillPrint = "$BASE_URL/generateBillPrint";
  static const String generateIdcard = "$BASE_URL/generateIdcard";
  static const String getPatientprofile = "$BASE_URL/getPatientprofile";
  static const String pathology = "$BASE_URL/getPathologyDetails";
  static const String radiology = "$BASE_URL/getRadiologyDetails";
  static const String pharmacy = "$BASE_URL/getPharmacyDetails";
  static const String getAllUsgBill = "$BASE_URL/getAllUsgBill";
  static const String Therapy = "$BASE_URL/getPhysiotherapyDetails";
  static const String getIPDMedication = "$BASE_URL/getIpdMedication";
  static const String getDues = "$BASE_URL/get_dues";
  static const String getAllTransaction = "$BASE_URL/getAllTransaction";
  static const String getAmbulanceDetails = "$BASE_URL/getAmbulanceDetails";
  static const String getbloodbankDetails = "$BASE_URL/getAllTransaction";
  static const String getpatientDetails = "$BASE_URL/getpatientDetails";
  static const String getipdVitals = "$BASE_URL/getipdVitals";
  static const String aboutUs = "$BASE_URL/AboutUs";
  static const String Maternity = "$BASE_URL/getipdMaternity";
  static const String surgery = "$BASE_URL/getipdSurgeryPrescription";
  static const String Cardex = "$BASE_URL/getipdCardex";
  static const String getDirectDetails = "$BASE_URL/getDirectDetails";
  static const String OPDTicketList = "$BASE_URL/lists";
  static const String addopdticket = "$BASE_URL/addopdticket";
  static const String getNotificationlistcount ="$BASE_URL/getNotificationlistcount";
  static const String OpdHistory ="$BASE_URL/db_table";
   static const String getliveconsult="$BASE_URL/getliveconsult";
   static const String generateCertificate="$BASE_URL/generateCertificate";
   static const String duePayment="$BASE_URL/duePayment";
   static const String notifier="$BASE_URL/notifier";
  static const String singleTableDataDetector="$BASE_URL/db_table";
  static const String getAllipdRecord="$BASE_URL/getAllipdRecord";
  static const String total_count="$BASE_URL/get_total_count";

}
