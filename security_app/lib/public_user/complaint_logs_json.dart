import 'dart:convert';

class ComplaitLogsData {
  String? status;
  String? nature;
  String? remarks;
  String? handledby;
  String? date;
  String? performedby;
  String? adminremarks;

  ComplaitLogsData({
    this.status,
    this.nature,
    this.remarks,
    this.handledby,
    this.date,
    this.performedby,
    this.adminremarks,
  });

  //
  factory ComplaitLogsData.fromJson(Map<String, dynamic> json) {
    return ComplaitLogsData(
        status: json['status'],
        nature: json['nature'],
        remarks: json['remarks'],
        handledby: json['handledby'],
        date: json['time'],
        performedby: json['performedby'],
        adminremarks: json['adminremarks']);
  }
}
