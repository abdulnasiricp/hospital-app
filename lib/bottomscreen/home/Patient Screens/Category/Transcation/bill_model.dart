// class BillItem {
//   List<PathologyBill>? pathologyBill;
//   List<dynamic>? directBill;
//   List<RadiologyBill>? radiologyBill;
//   List<PharmacyBill>? pharmacyBill;
//   List<dynamic>? ambulanceBill;
//   List<dynamic>? bloodbank;

//   BillItem(
//       {this.pathologyBill,
//       this.directBill,
//       this.radiologyBill,
//       this.pharmacyBill,
//       this.ambulanceBill,
//       this.bloodbank});

//   BillItem.fromJson(Map<String, dynamic> json) {
//     if (json["pathology_bill"] is List) {
//       pathologyBill = json["pathology_bill"] == null
//           ? null
//           : (json["pathology_bill"] as List)
//               .map((e) => PathologyBill.fromJson(e))
//               .toList();
//     }
//     if (json["direct_bill"] is List) {
//       directBill = json["direct_bill"] ?? [];
//     }
//     if (json["radiology_bill"] is List) {
//       radiologyBill = json["radiology_bill"] == null
//           ? null
//           : (json["radiology_bill"] as List)
//               .map((e) => RadiologyBill.fromJson(e))
//               .toList();
//     }
//     if (json["pharmacy_bill"] is List) {
//       pharmacyBill = json["pharmacy_bill"] == null
//           ? null
//           : (json["pharmacy_bill"] as List)
//               .map((e) => PharmacyBill.fromJson(e))
//               .toList();
//     }
//     if (json["ambulance_bill"] is List) {
//       ambulanceBill = json["ambulance_bill"] ?? [];
//     }
//     if (json["bloodbank"] is List) {
//       bloodbank = json["bloodbank"] ?? [];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (pathologyBill != null) {
//       _data["pathology_bill"] = pathologyBill?.map((e) => e.toJson()).toList();
//     }
//     if (directBill != null) {
//       _data["direct_bill"] = directBill;
//     }
//     if (radiologyBill != null) {
//       _data["radiology_bill"] = radiologyBill?.map((e) => e.toJson()).toList();
//     }
//     if (pharmacyBill != null) {
//       _data["pharmacy_bill"] = pharmacyBill?.map((e) => e.toJson()).toList();
//     }
//     if (ambulanceBill != null) {
//       _data["ambulance_bill"] = ambulanceBill;
//     }
//     if (bloodbank != null) {
//       _data["bloodbank"] = bloodbank;
//     }
//     return _data;
//   }
// }

// class PharmacyBill {
//   String? id;
//   String? date;
//   String? patientId;
//   String? ipdPrescriptionBasicId;
//   String? caseReferenceId;
//   String? customerName;
//   dynamic customerType;
//   String? doctorName;
//   String? file;
//   String? total;
//   String? discountPercentage;
//   String? discount;
//   dynamic taxPercentage;
//   String? tax;
//   String? netAmount;
//   dynamic depreciation;
//   dynamic depreciationPercentage;
//   dynamic returnAmount;
//   String? note;
//   String? generatedBy;
//   String? createdAt;
//   dynamic mid;
//   dynamic ipdId;
//   String? isCancelRefunded;
//   String? paidAmount;
//   String? patientName;
//   String? patientUniqueId;

//   PharmacyBill(
//       {this.id,
//       this.date,
//       this.patientId,
//       this.ipdPrescriptionBasicId,
//       this.caseReferenceId,
//       this.customerName,
//       this.customerType,
//       this.doctorName,
//       this.file,
//       this.total,
//       this.discountPercentage,
//       this.discount,
//       this.taxPercentage,
//       this.tax,
//       this.netAmount,
//       this.depreciation,
//       this.depreciationPercentage,
//       this.returnAmount,
//       this.note,
//       this.generatedBy,
//       this.createdAt,
//       this.mid,
//       this.ipdId,
//       this.isCancelRefunded,
//       this.paidAmount,
//       this.patientName,
//       this.patientUniqueId});

//   PharmacyBill.fromJson(Map<String, dynamic> json) {
//     if (json["id"] is String) {
//       id = json["id"];
//     }
//     if (json["date"] is String) {
//       date = json["date"];
//     }
//     if (json["patient_id"] is String) {
//       patientId = json["patient_id"];
//     }
//     if (json["ipd_prescription_basic_id"] is String) {
//       ipdPrescriptionBasicId = json["ipd_prescription_basic_id"];
//     }
//     if (json["case_reference_id"] is String) {
//       caseReferenceId = json["case_reference_id"];
//     }
//     if (json["customer_name"] is String) {
//       customerName = json["customer_name"];
//     }
//     customerType = json["customer_type"];
//     if (json["doctor_name"] is String) {
//       doctorName = json["doctor_name"];
//     }
//     if (json["file"] is String) {
//       file = json["file"];
//     }
//     if (json["total"] is String) {
//       total = json["total"];
//     }
//     if (json["discount_percentage"] is String) {
//       discountPercentage = json["discount_percentage"];
//     }
//     if (json["discount"] is String) {
//       discount = json["discount"];
//     }
//     taxPercentage = json["tax_percentage"];
//     if (json["tax"] is String) {
//       tax = json["tax"];
//     }
//     if (json["net_amount"] is String) {
//       netAmount = json["net_amount"];
//     }
//     depreciation = json["depreciation"];
//     depreciationPercentage = json["depreciation_percentage"];
//     returnAmount = json["return_amount"];
//     if (json["note"] is String) {
//       note = json["note"];
//     }
//     if (json["generated_by"] is String) {
//       generatedBy = json["generated_by"];
//     }
//     if (json["created_at"] is String) {
//       createdAt = json["created_at"];
//     }
//     mid = json["mid"];
//     ipdId = json["ipd_id"];
//     if (json["is_cancel_refunded"] is String) {
//       isCancelRefunded = json["is_cancel_refunded"];
//     }
//     if (json["paid_amount"] is String) {
//       paidAmount = json["paid_amount"];
//     }
//     if (json["patient_name"] is String) {
//       patientName = json["patient_name"];
//     }
//     if (json["patient_unique_id"] is String) {
//       patientUniqueId = json["patient_unique_id"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["date"] = date;
//     _data["patient_id"] = patientId;
//     _data["ipd_prescription_basic_id"] = ipdPrescriptionBasicId;
//     _data["case_reference_id"] = caseReferenceId;
//     _data["customer_name"] = customerName;
//     _data["customer_type"] = customerType;
//     _data["doctor_name"] = doctorName;
//     _data["file"] = file;
//     _data["total"] = total;
//     _data["discount_percentage"] = discountPercentage;
//     _data["discount"] = discount;
//     _data["tax_percentage"] = taxPercentage;
//     _data["tax"] = tax;
//     _data["net_amount"] = netAmount;
//     _data["depreciation"] = depreciation;
//     _data["depreciation_percentage"] = depreciationPercentage;
//     _data["return_amount"] = returnAmount;
//     _data["note"] = note;
//     _data["generated_by"] = generatedBy;
//     _data["created_at"] = createdAt;
//     _data["mid"] = mid;
//     _data["ipd_id"] = ipdId;
//     _data["is_cancel_refunded"] = isCancelRefunded;
//     _data["paid_amount"] = paidAmount;
//     _data["patient_name"] = patientName;
//     _data["patient_unique_id"] = patientUniqueId;
//     return _data;
//   }
// }

// class RadiologyBill {
//   String? id;
//   String? patientId;
//   String? caseReferenceId;
//   dynamic ipdPrescriptionBasicId;
//   String? doctorId;
//   String? date;
//   String? doctorName;
//   String? total;
//   String? discountPercentage;
//   String? discount;
//   String? taxPercentage;
//   String? tax;
//   String? netAmount;
//   dynamic transactionId;
//   String? adjustAdvanceAmount;
//   String? note;
//   String? generatedBy;
//   String? discountSchemeId;
//   String? isCancelRefunded;
//   String? createdAt;
//   dynamic updatedAt;
//   String? isPrinted;
//   String? paidAmount;
//   String? patientName;
//   String? patientUniqueId;
//   String? name;
//   String? surname;
//   String? employeeId;

//   RadiologyBill(
//       {this.id,
//       this.patientId,
//       this.caseReferenceId,
//       this.ipdPrescriptionBasicId,
//       this.doctorId,
//       this.date,
//       this.doctorName,
//       this.total,
//       this.discountPercentage,
//       this.discount,
//       this.taxPercentage,
//       this.tax,
//       this.netAmount,
//       this.transactionId,
//       this.adjustAdvanceAmount,
//       this.note,
//       this.generatedBy,
//       this.discountSchemeId,
//       this.isCancelRefunded,
//       this.createdAt,
//       this.updatedAt,
//       this.isPrinted,
//       this.paidAmount,
//       this.patientName,
//       this.patientUniqueId,
//       this.name,
//       this.surname,
//       this.employeeId});

//   RadiologyBill.fromJson(Map<String, dynamic> json) {
//     if (json["id"] is String) {
//       id = json["id"];
//     }
//     if (json["patient_id"] is String) {
//       patientId = json["patient_id"];
//     }
//     if (json["case_reference_id"] is String) {
//       caseReferenceId = json["case_reference_id"];
//     }
//     ipdPrescriptionBasicId = json["ipd_prescription_basic_id"];
//     if (json["doctor_id"] is String) {
//       doctorId = json["doctor_id"];
//     }
//     if (json["date"] is String) {
//       date = json["date"];
//     }
//     if (json["doctor_name"] is String) {
//       doctorName = json["doctor_name"];
//     }
//     if (json["total"] is String) {
//       total = json["total"];
//     }
//     if (json["discount_percentage"] is String) {
//       discountPercentage = json["discount_percentage"];
//     }
//     if (json["discount"] is String) {
//       discount = json["discount"];
//     }
//     if (json["tax_percentage"] is String) {
//       taxPercentage = json["tax_percentage"];
//     }
//     if (json["tax"] is String) {
//       tax = json["tax"];
//     }
//     if (json["net_amount"] is String) {
//       netAmount = json["net_amount"];
//     }
//     transactionId = json["transaction_id"];
//     if (json["adjust_advance_amount"] is String) {
//       adjustAdvanceAmount = json["adjust_advance_amount"];
//     }
//     if (json["note"] is String) {
//       note = json["note"];
//     }
//     if (json["generated_by"] is String) {
//       generatedBy = json["generated_by"];
//     }
//     if (json["discount_scheme_id"] is String) {
//       discountSchemeId = json["discount_scheme_id"];
//     }
//     if (json["is_cancel_refunded"] is String) {
//       isCancelRefunded = json["is_cancel_refunded"];
//     }
//     if (json["created_at"] is String) {
//       createdAt = json["created_at"];
//     }
//     updatedAt = json["updated_at"];
//     if (json["is_printed"] is String) {
//       isPrinted = json["is_printed"];
//     }
//     if (json["paid_amount"] is String) {
//       paidAmount = json["paid_amount"];
//     }
//     if (json["patient_name"] is String) {
//       patientName = json["patient_name"];
//     }
//     if (json["patient_unique_id"] is String) {
//       patientUniqueId = json["patient_unique_id"];
//     }
//     if (json["name"] is String) {
//       name = json["name"];
//     }
//     if (json["surname"] is String) {
//       surname = json["surname"];
//     }
//     if (json["employee_id"] is String) {
//       employeeId = json["employee_id"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["patient_id"] = patientId;
//     _data["case_reference_id"] = caseReferenceId;
//     _data["ipd_prescription_basic_id"] = ipdPrescriptionBasicId;
//     _data["doctor_id"] = doctorId;
//     _data["date"] = date;
//     _data["doctor_name"] = doctorName;
//     _data["total"] = total;
//     _data["discount_percentage"] = discountPercentage;
//     _data["discount"] = discount;
//     _data["tax_percentage"] = taxPercentage;
//     _data["tax"] = tax;
//     _data["net_amount"] = netAmount;
//     _data["transaction_id"] = transactionId;
//     _data["adjust_advance_amount"] = adjustAdvanceAmount;
//     _data["note"] = note;
//     _data["generated_by"] = generatedBy;
//     _data["discount_scheme_id"] = discountSchemeId;
//     _data["is_cancel_refunded"] = isCancelRefunded;
//     _data["created_at"] = createdAt;
//     _data["updated_at"] = updatedAt;
//     _data["is_printed"] = isPrinted;
//     _data["paid_amount"] = paidAmount;
//     _data["patient_name"] = patientName;
//     _data["patient_unique_id"] = patientUniqueId;
//     _data["name"] = name;
//     _data["surname"] = surname;
//     _data["employee_id"] = employeeId;
//     return _data;
//   }
// }

// class PathologyBill {
//   String? id;
//   String? caseReferenceId;
//   dynamic ipdPrescriptionBasicId;
//   String? date;
//   String? patientId;
//   String? doctorId;
//   String? doctorName;
//   String? total;
//   String? discountPercentage;
//   String? discount;
//   String? taxPercentage;
//   String? tax;
//   dynamic ccPercentage;
//   dynamic cc;
//   String? netAmount;
//   dynamic transactionId;
//   String? discountSchemeId;
//   String? isPrinted;
//   String? adjustAdvanceAmount;
//   String? note;
//   String? generatedBy;
//   String? isCancelRefunded;
//   String? createdAt;
//   dynamic updatedAt;
//   String? labId;
//   String? paidAmount;
//   String? patientName;
//   String? patientUniqueId;
//   String? name;
//   String? surname;
//   String? employeeId;

//   PathologyBill(
//       {this.id,
//       this.caseReferenceId,
//       this.ipdPrescriptionBasicId,
//       this.date,
//       this.patientId,
//       this.doctorId,
//       this.doctorName,
//       this.total,
//       this.discountPercentage,
//       this.discount,
//       this.taxPercentage,
//       this.tax,
//       this.ccPercentage,
//       this.cc,
//       this.netAmount,
//       this.transactionId,
//       this.discountSchemeId,
//       this.isPrinted,
//       this.adjustAdvanceAmount,
//       this.note,
//       this.generatedBy,
//       this.isCancelRefunded,
//       this.createdAt,
//       this.updatedAt,
//       this.labId,
//       this.paidAmount,
//       this.patientName,
//       this.patientUniqueId,
//       this.name,
//       this.surname,
//       this.employeeId});

//   PathologyBill.fromJson(Map<String, dynamic> json) {
//     if (json["id"] is String) {
//       id = json["id"];
//     }
//     if (json["case_reference_id"] is String) {
//       caseReferenceId = json["case_reference_id"];
//     }
//     ipdPrescriptionBasicId = json["ipd_prescription_basic_id"];
//     if (json["date"] is String) {
//       date = json["date"];
//     }
//     if (json["patient_id"] is String) {
//       patientId = json["patient_id"];
//     }
//     if (json["doctor_id"] is String) {
//       doctorId = json["doctor_id"];
//     }
//     if (json["doctor_name"] is String) {
//       doctorName = json["doctor_name"];
//     }
//     if (json["total"] is String) {
//       total = json["total"];
//     }
//     if (json["discount_percentage"] is String) {
//       discountPercentage = json["discount_percentage"];
//     }
//     if (json["discount"] is String) {
//       discount = json["discount"];
//     }
//     if (json["tax_percentage"] is String) {
//       taxPercentage = json["tax_percentage"];
//     }
//     if (json["tax"] is String) {
//       tax = json["tax"];
//     }
//     ccPercentage = json["cc_percentage"];
//     cc = json["cc"];
//     if (json["net_amount"] is String) {
//       netAmount = json["net_amount"];
//     }
//     transactionId = json["transaction_id"];
//     if (json["discount_scheme_id"] is String) {
//       discountSchemeId = json["discount_scheme_id"];
//     }
//     if (json["is_printed"] is String) {
//       isPrinted = json["is_printed"];
//     }
//     if (json["adjust_advance_amount"] is String) {
//       adjustAdvanceAmount = json["adjust_advance_amount"];
//     }
//     if (json["note"] is String) {
//       note = json["note"];
//     }
//     if (json["generated_by"] is String) {
//       generatedBy = json["generated_by"];
//     }
//     if (json["is_cancel_refunded"] is String) {
//       isCancelRefunded = json["is_cancel_refunded"];
//     }
//     if (json["created_at"] is String) {
//       createdAt = json["created_at"];
//     }
//     updatedAt = json["updated_at"];
//     if (json["lab_id"] is String) {
//       labId = json["lab_id"];
//     }
//     if (json["paid_amount"] is String) {
//       paidAmount = json["paid_amount"];
//     }
//     if (json["patient_name"] is String) {
//       patientName = json["patient_name"];
//     }
//     if (json["patient_unique_id"] is String) {
//       patientUniqueId = json["patient_unique_id"];
//     }
//     if (json["name"] is String) {
//       name = json["name"];
//     }
//     if (json["surname"] is String) {
//       surname = json["surname"];
//     }
//     if (json["employee_id"] is String) {
//       employeeId = json["employee_id"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["case_reference_id"] = caseReferenceId;
//     _data["ipd_prescription_basic_id"] = ipdPrescriptionBasicId;
//     _data["date"] = date;
//     _data["patient_id"] = patientId;
//     _data["doctor_id"] = doctorId;
//     _data["doctor_name"] = doctorName;
//     _data["total"] = total;
//     _data["discount_percentage"] = discountPercentage;
//     _data["discount"] = discount;
//     _data["tax_percentage"] = taxPercentage;
//     _data["tax"] = tax;
//     _data["cc_percentage"] = ccPercentage;
//     _data["cc"] = cc;
//     _data["net_amount"] = netAmount;
//     _data["transaction_id"] = transactionId;
//     _data["discount_scheme_id"] = discountSchemeId;
//     _data["is_printed"] = isPrinted;
//     _data["adjust_advance_amount"] = adjustAdvanceAmount;
//     _data["note"] = note;
//     _data["generated_by"] = generatedBy;
//     _data["is_cancel_refunded"] = isCancelRefunded;
//     _data["created_at"] = createdAt;
//     _data["updated_at"] = updatedAt;
//     _data["lab_id"] = labId;
//     _data["paid_amount"] = paidAmount;
//     _data["patient_name"] = patientName;
//     _data["patient_unique_id"] = patientUniqueId;
//     _data["name"] = name;
//     _data["surname"] = surname;
//     _data["employee_id"] = employeeId;
//     return _data;
//   }
// }




class BillItem {
  final String? id;
  final double total;
  final String? patientId;
  final String? name;

  BillItem({
    required this.id,
    required this.total,
    required this.patientId,
    required this.name,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) {
    return BillItem(
      id: json['id'],
      total: double.parse(json['total']),
      patientId: json['patient_id'],
      name: json['name'],
    );
  }
}

class PathologyBillItem extends BillItem {
  PathologyBillItem({
    required String? id,
    required double total,
    required String? patientId,
    required String? name,
  }) : super(id: id, total: total, patientId: patientId,name: name);
}

class RadiologyBillItem extends BillItem {
  RadiologyBillItem({
    required String? id,
    required double total,
    required String? patientId,
    required String? name,
  }) : super(id: id, total: total, patientId: patientId,name: name);
}

class PharmacyBillItem extends BillItem {
  PharmacyBillItem({
    required String? id,
    required double total,
    required String? patientId,
    required String? name,
  }) : super(id: id, total: total, patientId: patientId,name: name);
}

