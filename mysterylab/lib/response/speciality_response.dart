import '../models/speciality_model.dart';

class SpecialityResponse {
  List<SpecialityModel>? data;
  String? message;
  String? status;

  SpecialityResponse({this.data, this.message, this.status});

  SpecialityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SpecialityModel>[];
      json['data'].forEach((v) {
        data!.add(new SpecialityModel.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}