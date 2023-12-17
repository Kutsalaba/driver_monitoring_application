class DriverModel {
  final String? userId;
  final String driverFirstName;
  final String driverLastName;
  final String driverPatronymic;
  final int driverAge;
  final String driverRank;
  final String mobilePhone;
  final String? mail;
  final bool? aliveFlag;
  final bool? a1Category;
  final bool? aCategory;
  final bool? b1Category;
  final bool? bCategory;
  final bool? c1Category;
  final bool? cCategoty;
  final bool? d1Categoty;
  final bool? dCategory;
  final bool? c1eCategory;
  final bool? beCategory;
  final bool? ceCategory;
  final bool? d1eCategory;
  final bool? deCategory;
  final String? currentStatus;
  final String? login;
  final String? password;

  DriverModel({
    this.userId,
    required this.driverFirstName,
    required this.driverLastName,
    required this.driverPatronymic,
    required this.driverAge,
    required this.driverRank,
    required this.mobilePhone,
    this.mail,
    this.aliveFlag,
    this.a1Category,
    this.aCategory,
    this.b1Category,
    this.bCategory,
    this.c1Category,
    this.cCategoty,
    this.d1Categoty,
    this.dCategory,
    this.c1eCategory,
    this.beCategory,
    this.ceCategory,
    this.d1eCategory,
    this.deCategory,
    this.currentStatus,
    this.login,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'driver_first_name': driverFirstName,
      'driver_last_name': driverLastName,
      'driver_patronymic': driverPatronymic,
      'driver_age': driverAge,
      'driver_rank': driverRank,
      'mobile_phone': mobilePhone,
      'mail': mail,
      'alive_flag': aliveFlag,
      'a1_category': a1Category,
      'a_category': aCategory,
      'b1_category': b1Category,
      'b_category': bCategory,
      'c1_category': c1Category,
      'c_categoty': cCategoty,
      'd1_categoty': d1Categoty,
      'd_category': dCategory,
      'c1e_category': c1eCategory,
      'be_category': beCategory,
      'ce_category': ceCategory,
      'd1e_category': d1eCategory,
      'de_category': deCategory,
      'current_status': currentStatus,
      'login': login,
      'password': password
    };
  }

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      userId: json['user_id'] != null ? json['user_id'] as String : null,
      driverFirstName: json['driver_first_name'] as String,
      driverLastName: json['driver_last_name'] as String,
      driverPatronymic: json['driver_patronymic'] as String,
      driverAge: json['driver_age'] as int,
      driverRank: json['driver_rank'] as String,
      mobilePhone: json['mobile_phone'] as String,
      mail: json['mail'] != null ? json['mail'] as String : null,
      aliveFlag: json['alive_flag'] != null ? json['alive_flag'] as bool : null,
      a1Category:
          json['a1_category'] != null ? json['a1_category'] as bool : null,
      aCategory: json['a_category'] != null ? json['a_category'] as bool : null,
      b1Category:
          json['b1_category'] != null ? json['b1_category'] as bool : null,
      bCategory: json['b_category'] != null ? json['b_category'] as bool : null,
      c1Category:
          json['c1_category'] != null ? json['c1_category'] as bool : null,
      cCategoty: json['c_categoty'] != null ? json['c_categoty'] as bool : null,
      d1Categoty:
          json['d1_categoty'] != null ? json['d1_categoty'] as bool : null,
      dCategory: json['d_category'] != null ? json['d_category'] as bool : null,
      c1eCategory:
          json['c1e_category'] != null ? json['c1e_category'] as bool : null,
      beCategory:
          json['be_category'] != null ? json['be_category'] as bool : null,
      ceCategory:
          json['ce_category'] != null ? json['ce_category'] as bool : null,
      d1eCategory:
          json['d1e_category'] != null ? json['d1e_category'] as bool : null,
      deCategory:
          json['de_category'] != null ? json['de_category'] as bool : null,
      currentStatus: json['current_status'] != null
          ? json['current_status'] as String
          : null,
      login: json['login'] != null ? json['login'] as String : null,
      password: json['password'] != null ? json['password'] as String : null,
    );
  }

  DriverModel copyWith({
    String? userId,
    String? driverFirstName,
    String? driverLastName,
    String? driverPatronymic,
    int? driverAge,
    String? driverRank,
    String? mobilePhone,
    String? mail,
    bool? aliveFlag,
    bool? a1Category,
    bool? aCategory,
    bool? b1Category,
    bool? bCategory,
    bool? c1Category,
    bool? cCategoty,
    bool? d1Categoty,
    bool? dCategory,
    bool? c1eCategory,
    bool? beCategory,
    bool? ceCategory,
    bool? d1eCategory,
    bool? deCategory,
    String? currentStatus,
    String? login,
    String? password,
  }) {
    return DriverModel(
      userId: userId ?? this.userId,
      driverFirstName: driverFirstName ?? this.driverFirstName,
      driverLastName: driverLastName ?? this.driverLastName,
      driverPatronymic: driverPatronymic ?? this.driverPatronymic,
      driverAge: driverAge ?? this.driverAge,
      driverRank: driverRank ?? this.driverRank,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      mail: mail ?? this.mail,
      aliveFlag: aliveFlag ?? this.aliveFlag,
      a1Category: a1Category ?? this.a1Category,
      aCategory: aCategory ?? this.aCategory,
      b1Category: b1Category ?? this.b1Category,
      bCategory: bCategory ?? this.bCategory,
      c1Category: c1Category ?? this.c1Category,
      cCategoty: cCategoty ?? this.cCategoty,
      d1Categoty: d1Categoty ?? this.d1Categoty,
      dCategory: dCategory ?? this.dCategory,
      c1eCategory: c1eCategory ?? this.c1eCategory,
      beCategory: beCategory ?? this.beCategory,
      ceCategory: ceCategory ?? this.ceCategory,
      d1eCategory: d1eCategory ?? this.d1eCategory,
      deCategory: deCategory ?? this.deCategory,
      currentStatus: currentStatus ?? this.currentStatus,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }
}
