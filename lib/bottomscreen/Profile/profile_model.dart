import 'dart:convert';

class ProfileData {
  final String? id;
  final String? patientName;
  final String? dob;
  final String? age;
  final String? image;
  final String? mobileNo;
  final String? email;
  final String? gender;
  final String? maritalStatus;
  final String? bloodGroup;
  final String? address;
  final String? guardianName;
  final String? insuranceId;
  final String? insuranceValidity;
  final String? isDead;
  final String? availableAmount;
  final String? isActive;
  

  ProfileData({
    required this.id,
    required this.patientName,
    required this.dob,
    required this.age,
    required this.image,
    required this.mobileNo,
    required this.email,
    required this.gender,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.address,
    required this.guardianName,
    required this.insuranceId,
    required this.insuranceValidity,
    required this.isDead,
    required this.availableAmount,
    required this.isActive,

  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      patientName: json['patient_name'],
      dob: json['dob'],
      age: json['age'],
      image: json['image'],
      mobileNo: json['mobileno'],
      email: json['email'],
      gender: json['gender'],
      maritalStatus: json['marital_status'],
      bloodGroup: json['blood_group'],
      address: json['address'],
      guardianName: json['guardian_name'],
      insuranceId: json['insurance_id'],
      insuranceValidity: json['insurance_validity'],
      isDead: json['is_dead'],
      availableAmount: json['available_amount'],
      isActive: json['is_active'],
    );
  }
}
