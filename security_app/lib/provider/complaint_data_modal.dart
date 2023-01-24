class GetComplaintData {
  int? id;
  int? userid;
  int? allotted;
  int? deptid;
  String? nature;
  String? firstname;
  String? lastname;
  String? ctsno;
  String? surveyno;
  String? description;
  String? deviceaddress;
  String? primarycontact;
  String? secondarycontact;
  int? ownershiptype;
  int? status;
  String? district;
  String? taluka;
  String? landmark;
  String? latitude;
  String? logitude;
  //
  GetComplaintData({
    this.id,
    this.userid,
    this.allotted,
    this.deptid,
    this.nature,
    this.firstname,
    this.lastname,
    this.ctsno,
    this.surveyno,
    this.description,
    this.deviceaddress,
    this.primarycontact,
    this.secondarycontact,
    this.ownershiptype,
    this.status,
    this.district,
    this.taluka,
    this.landmark,
    this.latitude,
    this.logitude,
  });
  /////////////////
  factory GetComplaintData.fromJson(Map<String, dynamic> json) {
    return GetComplaintData(
        id: json['id'],
        userid: json['user_id'],
        allotted: json['allotted_to'],
        deptid: json['dept_id'],
        nature: json['nature'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        ctsno: json['cts_no'],
        surveyno: json['survey_no'],
        description: json['description'],
        deviceaddress: json['device_address'],
        primarycontact: json['primarycontact'],
        secondarycontact: json['secondarycontact'],
        ownershiptype: json['ownership_type'],
        status: json['status'],
        district: json['district'],
        taluka: json['taluka'],
        landmark: json['landmark'],
        latitude: json['latitude'],
        logitude: json['longitude']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userid,
        'allotted_to': allotted,
        'dept_id': deptid,
        'nature': nature,
        'firstname': firstname,
        'lastname': lastname,
        'cts_no': ctsno,
        "survey_no": surveyno,
        'description': description,
        'device_address': deviceaddress,
        'primarycontact': primarycontact,
        'secondarycontact': secondarycontact,
        'ownership_type': ownershiptype,
        'status': status,
        'district': district,
        'taluka': taluka,
        'landmark': landmark,
        'latitude': latitude,
        'longitude': logitude
      };
}
