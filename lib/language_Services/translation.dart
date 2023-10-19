import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //Bottom Bar
          'home': "Home",
          'transcation': "Transaction",
          'card': "Card",
          'profile': "Profile",
          'HometransactionBill': "Transaction Bill",
          // Patient Home Screen,
          'welcome': "Welcome,\n",
          'patientId': "Patient Id:",
          'hisNo': "HIS NO:",
          'hospitalTitle': "प्रादेशिक अस्पताल सिराहा, नेपाल",
          'hospitaldueBalance': "Hospital Dues Balance",
          'payNow': "Pay Now",
          'transactionBill': "Transcation Bill",
          'idp': "IPD",
          'pathology': "Pathology",
          'radiology': "Radiology",
          'pharmacy': "Pharmacy",
          'usg': "USG",
          'surgery': "Surgery",
          'bloodBank': "Blood Bank",
          'ambulance': "Ambulance",
          'physioTherapy': "Physio Therapy",
          'certificates': "Certificates",
          'bedHistory': "Bed History",
          'daignosis': "Daignosis",
          'liveConsultations': "Live Consultations",
          'doctors': "Doctors",
          'viewAll': "View All",
          'Ratussubtitle': "Rate Us: Your Feedback Matters",
          'Termsconditionubtitle': "App Rules & Regulations",
          'Updatesubtitle': "Never Miss an Update with Check Updates",
          //View All Doctor list
          'selectADoctor': "Select a Doctor",
          'searchADoctor': "Search your doctor",
          'Scan': "Scan",

          //Transaction bill
          'tid': "TID",
          'section': "Section",
          'billno': "Bill No.",
          'amount': "Amount",
          'total': "Total",
          // Profile Screen
          'myinformation': "My Information",
          'myinformationsubtitle': "view your personal details",
          'deviceAndCredential': "Device & notification",
          'deviceAndCredentialSubtitle':
              "manage your Devices and notification ID",
          'helpCenter': "Help Center",
          'helpCenterSubtitle': "Ask a Quastion from help center",
          'aboutUs': "About Us",
          'aboutUsSubtitle': "view aboutus details",
          'darkmode': "Dark Mode",
          'darkmodeSubtitle': "Change Mode",
          'setting': "Setting",
          'settingSubtitle': "Change Your Setting",

          'checkUpdate': "Check for Updates",
          'logout': "Log Out",
          'rateUs': "Rate Us",
          'LogoutSubtitle': "Logout from this device",

          //term and coditions

          //information Profile screen
          'informationProfile': "Information Profile",
          'patientID': "Patient ID",
          'patientAge': "Age",
          'patientGender': "Gender",
          'patientEmail': "Email",
          'patientPhone': "Phone",
          'patientBloodGroup': "Blood Group",
          'patientAddress': "Address",
          'patientMaritialStatus': "Maritial Status",
          'patientGuardianName': "Guardian Name",

          // Devices and Cridentials
          'devicesAndCredentials': "Devices and Credentials",
          'devices': "Devices",
          'credentials': "Credentials",
          'notificationIDs': "Notification IDs",
          'appVersion': "APP Version",
          'addedOn': "Added On",
          'mobileNumber': "Mobile Number",
          'emailAddress': "Email Address",

          //About us
          'hospitalName': "Sirha Provincial Hospital",
          'hospitalNameCity': "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल",
          'hospitalNameCityLocation':
              "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल",
          'viewLocation': "View Location",
          'faculty': "Faculty",
          'allMembers': "All Members",
          'bookAppointment': "Book Appointment",

          //Facality memers screen
          'selectFacultyMember': "Select a Faculty mamber",
          'searchFacultyMember': "Search your Faculty mamber",

          //Select a Date screen
          'selectADate': "Select a Date",
          'doctorProfile': "Doctor Profile",
          'experience': "Experience",
          'specialist': "Specialist",
          'hospital': "Hospital",
          'location': "Location",
          'nationality': "Nationality",
          'about': "About",

          //Old or New Patient screen
          'oldOrNewPatient': "Old or New Patient?",
          'askPatientQuestions':
              "Are you a new patient or old patient of this hospital?",
          'newPatient': "New Patient",
          'newPatientDesc':
              "I have not visited this hospital before or i do\n not have Hospital No.",
          'oldPatient': "Old Patient",
          'oldPatientDesc':
              "I have visited this hospital before and have \n Hospital No.",
          'note': "Note: You can find hospital No. on OPD card/book ",

          //patient List
          'patientList': "Patient List",
          'selectPatient':
              "Please select patient from whom you want to take\n appointment for:",

          //conformation screen
          'conformation': "Confirmation",
          'hospitalVisitAppointment': "Hosiptal Visit Appointment",
          'patientInformation': "Patient's information",
          'patientMobile': "Mobile No.:",
          'patientDOB': "Date of Birth:",
          'patientPaymentAmount': "Payment amount:",
          'confirmationDesc':
              "Please call and confirm at hospital if doctor is a availible at hospital on the day of appointment.",
          'patientName': "Name:",
          'date': "Date:",
          'selectPaymentMethod': "Select Payment Method",

          //select payment method
          'selectAnyOnePayment': "Select any one to Pay.",
          'hospitalDueAmount': "Hospital Due Amount",
          'proceed': "PROCEED",
          'discount': "Discount:",
          'askTermsAndCondition': "By Clicking On Proceed, you agree to our",
          'termsAndCondition': "Terms and Conditions",
          'termsAndConditionMsg':
              "1.Payment Responsibility: Your responsibility includes the prompt settlement of all hospital dues through our mobile app.\n\n2. Accepted Payment Methods: The app offers multiple secure payment options for your convenience.\n\n3. Dispute Resolution: If you encounter any billing issues, please report them within 1 hour.",

          //Notification Screeen
          'notification': "Notification",
          'ended': "The doctor has ended his consultation",
          'please':
              "Your consultation is timed and finished,\n please rate us so we can serve you better!",

          //Pathology screen
          'Payment': "Payment",
          'Pathology': "Pathology",
          'Report': "Report",

          //Radiology screen;
          'Radiology': "Radiology",

          //Pharmacy screen;
          'Medicin': "Medicine",
          'Pharmacy': "Pharmacy",
          'Status': "Status",

          //Therapy screen
          'Physiotherapy': "Physiotherapy",

          //live consultation
          'Liveconsultation': "Live consultation",
          'join': 'join',

          //Add new members
          'addNewMember': 'Add New Member',
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'enterFirstName': 'Enter First Name',
          'enterLastName': 'Enter Last Name',
          'gender': 'Gender',
          'male': 'Male',
          'female': 'Female',
          'age': 'Age',
          'enterAge': 'Enter Age',
          'dob': 'Date Of Birth',
          'enterdob': 'Enter Date Of Birth',
          'phone': 'Phone (optional)',
          'enterPhone': 'Enter Phone Number',
          'email': 'Email Address (optional)',
          'enterEmail': 'Enter Email Address',
          'relationship': 'Relationship',

          //IPD screen
          'medication': 'Medication',
          'mid': 'Mid',
          'medicine': 'Medicine',
          'dose': 'Dose',
          'frequency': 'Frequency',
          'No. D': 'No. D',
          'Bedhistory': 'Bedhistory',
          'Certificate': 'Certificate', 'Bloodbank': 'Bloodbank',
          'Surgery': 'Surgery Report', 'HelpCenter': 'Help Center',

          //////////////// Cardex
          'medication_report': 'Medication Report',
          'drainage_report': 'Drainage Report',
          'observation_report': 'Observation Report',
          'diet_report': 'Diet Report',
          'Cardex': 'Cardex',
          'Directbill': 'Direct Bill',
        },
        'ne_NP': {
          //Bottom Bar
          'home': "होम",
          'transcation': "लेनदेन",
          'profile': "प्रोफाइल",
          'HometransactionBill': "लेनदेन बिल",

          // Patient Home Screen,
          'welcome': "स्वागत छ,\n",
          'patientId': "बिरामी आईडी:",
          'hisNo': "उनको नम्बर:",
          'hospitalTitle': "प्रादेशिक अस्पताल सिराहा, नेपाल",
          'hospitaldueBalance': "अस्पतालको बाँकी रकम",
          'payNow': "अहिले तिर्नुहोस्",
          'transactionBill': "लेनदेन बिल",
          'idp': "IPD",
          'pathology': "रोगविज्ञान",
          'radiology': "रेडियोलोजी",
          'pharmacy': "रेडियोलोजी",
          'usg': "USG",
          'surgery': "शल्यक्रिया",
          'bloodBank': "ब्लड बैंक",
          'ambulance': "यम्बुलेन्स",
          'physioTherapy': "फिजियोथेरापी",
          'certificates': "प्रमाणपत्रहरू",
          'bedHistory': "ओछ्यान इतिहास",
          'liveConsultations': "प्रत्यक्ष परामर्श",
          'doctors': "डाक्टरहरू",
          'viewAll': "सबै हेर्नुहोस्",
          'card': "कार्ड",

          //View All Doctor list
          'selectADoctor': "एक डाक्टर चयन गर्नुहोस्",
          'searchADoctor': "आफ्नो डाक्टर खोज्नुहोस्",

          // transaction bill screen
          'tid': "TID",
          'section': "खण्ड",
          'billno': "बिल नं.",
          'amount': "रकम",
          'total': "कुल",

          // Profile Screen
          'myinformation': "मेरो जानकारी",
          'myinformationsubtitle': "आफ्नो व्यक्तिगत विवरण हेर्नुहोस्",
          'deviceAndCredential': "यन्त्र र सूचना",
          'deviceAndCredentialSubtitle':
              "आफ्नो यन्त्रहरू र सूचना ID प्रबन्ध गर्नुहोस्",
          'helpCenter': "मद्दत केन्द्र",
          'helpCenterSubtitle': "मद्दत केन्द्रबाट प्रश्न सोध्नुहोस्",
          'aboutUs': "हाम्रोबारे",
          'aboutUsSubtitle': "हाम्रोबारे",
          'darkmode': "गाढा मोड",
          'darkmodeSubtitle': "मोड परिवर्तन गर्नुहोस्",
          'LogoutSubtitle': "यस उपकरण लगआउट गर्नुहोस्",
          'setting': "सेटिङ",
          'settingSubtitle': "आफ्नो सेटिङ परिवर्तन गर्नुहोस्",
          'checkUpdate': "अपडेटहरूको लागि जाँच गर्नुहोस्",
          'logout': "बाहिर निस्कनु",
          'rateUs': "हामीलाई मूल्याङ्कन गर्नुहोस्",
          'Ratussubtitle':
              "हामीलाई मूल्याङ्कन गर्नुहोस्: तपाईंको प्रतिक्रिया महत्त्वपूर्ण छ",
          'Termsconditionubtitle': "एप नियम र नियमहरू",
          'Updatesubtitle': "चेक अपडेटको साथ अद्यावधिक कहिल्यै नछुटाउनुहोस्",

          //information Profile screen
          'informationProfile': "जानकारी प्रोफाइल",
          'patientID': "बिरामी आईडी",
          'patientAge': "उमेर",
          'patientGender': "लिङ्ग",
          'patientEmail': "इमेल",
          'patientPhone': "इमेल फोन",
          'patientBloodGroup': "रक्त समूह",
          'patientAddress': "ठेगाना",
          'patientMaritialStatus': "वैवाहिक स्थिति",
          'patientGuardianName': "अभिभावकको नाम",

          // Devices and Cridentials
          'devicesAndCredentials': "यन्त्रहरू र प्रमाणहरू",
          'devices': "यन्त्रहरू",
          'credentials': "प्रमाणहरू",
          'notificationIDs': "सूचना आईडीहरू",
          'appVersion': "APP संस्करण",
          'addedOn': "मा थपियो",
          'mobileNumber': "मोबाइल नम्बर",
          'emailAddress': "इ - मेल ठेगाना",

          //About us
          'hospitalName': "सिरहा प्रादेशिक अस्पताल",
          'hospitalNameCity': "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल",
          'hospitalNameCityLocation':
              "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल",
          'viewLocation': "स्थान हेर्नुहोस्",
          'faculty': "संकाय",
          'allMembers': "सबै सदस्यहरू",
          'bookAppointment': "बुक अपोइन्टमेन्ट",

          //Facality memers screen
          'selectFacultyMember': "एक संकाय सदस्य चयन गर्नुहोस्",
          'searchFacultyMember': "आफ्नो संकाय सदस्य खोज्नुहोस्",

          //Select a Date screen
          'selectADate': "मिति चयन गर्नुहोस्",

          //doctor profile Screen
          'doctorProfile': "डाक्टर प्रोफाइल",
          'experience': "अनुभव",
          'specialist': "विशेषज्ञ",
          'hospital': "अस्पताल",
          'location': "स्थान",
          'nationality': "राष्ट्रियता",
          'about': "बारे",

          //Old or New Patient screen
          'oldOrNewPatient': "पुरानो वा नयाँ बिरामी?",
          'askPatientQuestions':
              "तपाई यो अस्पतालको नयाँ बिरामी हुनुहुन्छ कि पुरानो बिरामी हुनुहुन्छ?",
          'newPatient': "नयाँ बिरामी",
          'newPatientDesc':
              "मैले यस अस्पतालमा पहिले गएको छैन वा मसँग \n अस्पताल नम्बर छैन।",
          'oldPatient': "पुराना बिरामी",
          'oldPatientDesc':
              "मैले यस अस्पतालमा पहिले पनि गएको छु र \n अस्पताल नं.",
          'note':
              "नोट: तपाईले ओपीडी कार्ड/बुकमा अस्पताल नम्बर पाउन सक्नुहुन्छ ",

          //patient List
          'patientList': "बिरामी सूची",
          'selectPatient':
              "कृपया बिरामी चयन गर्नुहोस् जसबाट तपाईं \n अपोइन्टमेन्ट लिन चाहनुहुन्छ:",

          //conformation screen
          'conformation': "पुष्टि",
          'hospitalVisitAppointment': "अस्पताल भ्रमण अपोइन्टमेन्ट:",
          'patientInformation': "बिरामीको जानकारी:",
          'patientMobile': "मोबाइल नम्बर।:",
          'patientDOB': "जन्म मिति:",
          'patientPaymentAmount': "भुक्तानी रकम:",
          'confirmationDesc':
              "अपोइन्टमेन्टको दिनमा अस्पतालमा डाक्टर उपलब्ध भएमा कृपया अस्पतालमा कल गर्नुहोस् र पुष्टि गर्नुहोस्।",
          'patientName': "नाम:",
          'date': "मिति:",
          'selectPaymentMethod': "भुक्तानी विधि चयन गर्नुहोस्",

          //select payment method
          'selectAnyOnePayment': "भुक्तान गर्न कुनै एक चयन गर्नुहोस्।",
          'hospitalDueAmount': "अस्पतालको बाँकी रकम",
          'discount': "छुट:",
          'proceed': "अगाडि बढ्नुहोस्",
          'askTermsAndCondition':
              "अगाडि बढ्नुहोस् मा क्लिक गरेर, तपाईं हाम्रो कुरामा सहमत हुनुहुन्छ",
          'termsAndCondition': "नियम र सर्तहरू",
          'termsAndConditionMsg':
              "1.भुक्तानी जिम्मेवारी: तपाइँको जिम्मेवारीमा हाम्रो मोबाइल एप मार्फत अस्पतालको सबै बक्यौताको तुरुन्तै निपटान समावेश छ। \n \n 2. स्वीकृत भुक्तानी विधिहरू: एपले तपाईंको सुविधाको लागि धेरै सुरक्षित भुक्तानी विकल्पहरू प्रदान गर्दछ। \n \n 3. विवाद समाधान: यदि तपाईंले कुनै बिलिङ समस्याहरू सामना गर्नुभयो भने, कृपया 1 घण्टा भित्र रिपोर्ट गर्नुहोस्।",

          //Notification Screeen
          'notification': "सूचना",
          'ended': "डाक्टरले आफ्नो परामर्श समाप्त गरिसकेका छन्",
          'please':
              "तपाईंको परामर्श समय र समाप्त भयो, \n कृपया हामीलाई मूल्याङ्कन गर्नुहोस् ताकि हामी तपाईंलाई अझ राम्रो सेवा दिन सक्छौं!",

          //Pathology screen
          'Payment': "भुक्तानी",
          'Pathology': "रोगविज्ञान",
          'Report': "रिपोर्ट",

          //Radiology screen;
          'Radiology': "रेडियोलोजी",

          //Pharmacy screen;
          'Medicin': "औषधी",
          'Pharmacy': "फार्मेसी",
          'Status': "स्थिति",

          //Therapy screen
          'Physiotherapy': "फिजियोथेरापी",

          //live consultation
          'Liveconsultation': "प्रत्यक्ष परामर्श",
          'join': 'मिल्नु',

          //Add new members
          'addNewMember': 'Add New Member',
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'enterFirstName': 'Enter First Name',
          'enterLastName': 'Enter Last Name',
          'gender': 'Gender',
          'male': 'Male',
          'female': 'Female',
          'age': 'Age',
          'enterAge': 'Enter Age',
          'dob': 'Date Of Birth',
          'enterdob': 'Enter Date Of Birth',
          'phone': 'Phone (optional)',
          'enterPhone': 'Phone (optional)',

          //IPD screen
          'medication': 'औषधि',
          'mid': 'मध्य',
          'medicine': 'औषधी',
          'dose': 'खुराक',
          'frequency': 'आवृत्ति',
          'No. D': 'No. D',
          'Bedhistory': 'ओछ्यान इतिहास',
          'Certificate': 'प्रमाणपत्रहरू',
          'Bloodbank': 'ब्लडबैंक',
          'Surgery': 'शल्यक्रिया रिपोर्ट',
          'HelpCenter': 'मद्दत केन्द्र',
          'Scan': 'स्क्यान',
          'daignosis': 'निदान',

          /////////////////// Cardex
          'medication_report': 'औषधि रिपोर्ट',
          'drainage_report': 'ड्रेनेज रिपोर्ट',
          'observation_report': 'अवलोकन रिपोर्ट',
          'diet_report': 'आहार रिपोर्ट',
          'Cardex': 'कार्डेक्स',
          'Directbill': 'प्रत्यक्ष बिल',

          //
        }
      };
}
