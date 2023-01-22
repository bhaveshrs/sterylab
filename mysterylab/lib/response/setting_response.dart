import '../models/setting_model.dart';

class SettingResponse {
  List<SettingModel>? data;
  String? message;
  String? status;

  SettingResponse({this.data, this.message, this.status});

  SettingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SettingModel>[];
      json['data'].forEach((v) {
        data!.add(new SettingModel.fromJson(v));
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