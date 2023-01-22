import 'package:mysterylab/models/prodedure_model.dart';

class ProdedureResponse {
  List<ProdedureModel>? data;
  String? message;
  String? status;

  ProdedureResponse({this.data, this.message, this.status});

  ProdedureResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProdedureModel>[];
      json['data'].forEach((v) {
        data!.add(new ProdedureModel.fromJson(v));
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