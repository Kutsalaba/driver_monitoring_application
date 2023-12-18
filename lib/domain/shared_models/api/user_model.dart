class UserModel {
  final String? userId;
  final String? login;
  final String? userPassword;
  final bool? chiefFlag;

  const UserModel({
    this.userId,
    this.login,
    this.userPassword,
    this.chiefFlag,
  });

  Map<String, dynamic> toJson() =>
  <String, dynamic>{
      'user_id': userId,
      'login': login,
      'user_password': userPassword,
      'chief_flag': chiefFlag,
    };
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] != null ? json['user_id'] as String : null,
      login: json['login'] != null ? json['login'] as String : null,
      userPassword: json['user_password'] != null ? json['user_password'] as String : null,
      chiefFlag: json['chief_flag'] != null ? json['chief_flag'] as bool : null,
    );
  }
}
