
class UserProfile {
  String? id;
  dynamic langId;
  String? patientName;
  String? dob;
  String? age;
  String? month;
  String? day;
  String? image;
  String? mobileno;
  String? email;
  String? gender;
  String? maritalStatus;
  String? bloodGroup;
  dynamic bloodBankProductId;
  String? address;
  String? guardianName;
  String? patientType;
  String? identificationNumber;
  String? knownAllergies;
  String? note;
  String? isIpd;
  String? appKey;
  String? insuranceId;
  dynamic insuranceValidity;
  String? isDead;
  String? uuid;
  String? availableAmount;
  String? locationUuid;
  String? isActive;
  String? policyId;
  dynamic disableAt;
  String? isInsuranceActive;
  String? createdAt;

  UserProfile({this.id, this.langId, this.patientName, this.dob, this.age, this.month, this.day, this.image, this.mobileno, this.email, this.gender, this.maritalStatus, this.bloodGroup, this.bloodBankProductId, this.address, this.guardianName, this.patientType, this.identificationNumber, this.knownAllergies, this.note, this.isIpd, this.appKey, this.insuranceId, this.insuranceValidity, this.isDead, this.uuid, this.availableAmount, this.locationUuid, this.isActive, this.policyId, this.disableAt, this.isInsuranceActive, this.createdAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    langId = json["lang_id"];
    if(json["patient_name"] is String) {
      patientName = json["patient_name"];
    }
    if(json["dob"] is String) {
      dob = json["dob"];
    }
    if(json["age"] is String) {
      age = json["age"];
    }
    if(json["month"] is String) {
      month = json["month"];
    }
    if(json["day"] is String) {
      day = json["day"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["mobileno"] is String) {
      mobileno = json["mobileno"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["gender"] is String) {
      gender = json["gender"];
    }
    if(json["marital_status"] is String) {
      maritalStatus = json["marital_status"];
    }
    if(json["blood_group"] is String) {
      bloodGroup = json["blood_group"];
    }
    bloodBankProductId = json["blood_bank_product_id"];
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["guardian_name"] is String) {
      guardianName = json["guardian_name"];
    }
    if(json["patient_type"] is String) {
      patientType = json["patient_type"];
    }
    if(json["identification_number"] is String) {
      identificationNumber = json["identification_number"];
    }
    if(json["known_allergies"] is String) {
      knownAllergies = json["known_allergies"];
    }
    if(json["note"] is String) {
      note = json["note"];
    }
    if(json["is_ipd"] is String) {
      isIpd = json["is_ipd"];
    }
    if(json["app_key"] is String) {
      appKey = json["app_key"];
    }
    if(json["insurance_id"] is String) {
      insuranceId = json["insurance_id"];
    }
    insuranceValidity = json["insurance_validity"];
    if(json["is_dead"] is String) {
      isDead = json["is_dead"];
    }
    if(json["uuid"] is String) {
      uuid = json["uuid"];
    }
    if(json["available_amount"] is String) {
      availableAmount = json["available_amount"];
    }
    if(json["location_uuid"] is String) {
      locationUuid = json["location_uuid"];
    }
    if(json["is_active"] is String) {
      isActive = json["is_active"];
    }
    if(json["policy_id"] is String) {
      policyId = json["policy_id"];
    }
    disableAt = json["disable_at"];
    if(json["is_insurance_active"] is String) {
      isInsuranceActive = json["is_insurance_active"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["lang_id"] = langId;
    _data["patient_name"] = patientName;
    _data["dob"] = dob;
    _data["age"] = age;
    _data["month"] = month;
    _data["day"] = day;
    _data["image"] = image;
    _data["mobileno"] = mobileno;
    _data["email"] = email;
    _data["gender"] = gender;
    _data["marital_status"] = maritalStatus;
    _data["blood_group"] = bloodGroup;
    _data["blood_bank_product_id"] = bloodBankProductId;
    _data["address"] = address;
    _data["guardian_name"] = guardianName;
    _data["patient_type"] = patientType;
    _data["identification_number"] = identificationNumber;
    _data["known_allergies"] = knownAllergies;
    _data["note"] = note;
    _data["is_ipd"] = isIpd;
    _data["app_key"] = appKey;
    _data["insurance_id"] = insuranceId;
    _data["insurance_validity"] = insuranceValidity;
    _data["is_dead"] = isDead;
    _data["uuid"] = uuid;
    _data["available_amount"] = availableAmount;
    _data["location_uuid"] = locationUuid;
    _data["is_active"] = isActive;
    _data["policy_id"] = policyId;
    _data["disable_at"] = disableAt;
    _data["is_insurance_active"] = isInsuranceActive;
    _data["created_at"] = createdAt;
    return _data;
  }
}