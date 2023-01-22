import '../models/login_model.dart';

class LoginResponse {
  String? token;
  LoginModel? data;
  String? status;
  String? message;

  LoginResponse({this.token, this.data, this.status, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['data'] != null ? new LoginModel.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}