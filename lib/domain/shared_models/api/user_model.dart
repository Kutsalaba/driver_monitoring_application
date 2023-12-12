class UserModel {
  final int? userId;
  final String? login;
  final String? password;
  final bool? chiefFlag;

  const UserModel({
    this.userId,
    this.login,
    this.password,
    this.chiefFlag,
  });

  Map<String, dynamic> toJson() =>
  <String, dynamic>{
      'userId': userId,
      'login': login,
      'password': password,
      'chiefFlag': chiefFlag,
    };
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] != null ? json['userId'] as int : null,
      login: json['login'] != null ? json['login'] as String : null,
      password: json['password'] != null ? json['password'] as String : null,
      chiefFlag: json['chiefFlag'] != null ? json['chiefFlag'] as bool : null,
    );
  }
}
