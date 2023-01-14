class RegisterModel {
  ActionRegister? actionRegister;

  RegisterModel({this.actionRegister});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    actionRegister = json['action_register'] != null
        ? new ActionRegister.fromJson(json['action_register'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actionRegister != null) {
      data['action_register'] = this.actionRegister!.toJson();
    }
    return data;
  }
}

class ActionRegister {
  String? email;
  int? id;
  String? name;
  String? createdAt;

  ActionRegister({this.email, this.id, this.name, this.createdAt});

  ActionRegister.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    return data;
  }
}