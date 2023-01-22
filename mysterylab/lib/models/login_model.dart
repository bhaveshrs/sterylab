class LoginModel {
  int? id;
  String? name;
  String? username;
  String? email;
  int? isVerified;
  int? isDuplicate;
  String? status;
  String? updated;
  String? registered;

  LoginModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.isVerified,
      this.isDuplicate,
      this.status,
      this.updated,
      this.registered});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    isVerified = json['is_verified'];
    isDuplicate = json['is_duplicate'];
    status = json['status'];
    updated = json['updated'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['is_verified'] = isVerified;
    data['is_duplicate'] = isDuplicate;
    data['status'] = status;
    data['updated'] = updated;
    data['registered'] = registered;
    return data;
  }
}
