class AuthModel {
  ActionLogin? actionLogin;

  AuthModel({this.actionLogin});

  AuthModel.fromJson(Map<String, dynamic> json) {
    actionLogin = json['action_login'] != null
        ? new ActionLogin.fromJson(json['action_login'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actionLogin != null) {
      data['action_login'] = this.actionLogin!.toJson();
    }
    return data;
  }
}

class ActionLogin {
  String? message;
  String? token;

  ActionLogin({this.message, this.token});

  ActionLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}