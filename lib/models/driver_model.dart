class DriverModel {
  final String userId;
  final String driverFirstName;
  final String driverLastName;
  final String driverPatronymic;
  final int driverAge;
  final String driverRank;
  final String mobilePhone;
  final String? mail;
  final bool aliveFlag;
  final bool? a1Category;
  final bool? aCategory;
  final bool? b1Category;
  final bool? bCategory;
  final bool? c1Category;
  final bool? cCategoty;
  final bool? d1Categoty;
  final bool? dCategory;
  final bool? c1ECategory;
  final bool? beCategory;
  final bool? ceCategory;
  final bool? d1ECategory;
  final bool? deCategory;
  final String currentStatus;

  DriverModel({
    required this.userId,
    required this.driverFirstName,
    required this.driverLastName,
    required this.driverPatronymic,
    required this.driverAge,
    required this.driverRank,
    required this.mobilePhone,
    required this.mail,
    required this.aliveFlag,
    this.a1Category,
    this.aCategory,
    this.b1Category,
    this.bCategory,
    this.c1Category,
    this.cCategoty,
    this.d1Categoty,
    this.dCategory,
    this.c1ECategory,
    this.beCategory,
    this.ceCategory,
    this.d1ECategory,
    this.deCategory,
    required this.currentStatus,
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
      'c1e_category': c1ECategory,
      'be_category': beCategory,
      'ce_category': ceCategory,
      'd1e_category': d1ECategory,
      'de_category': deCategory,
      'current_status': currentStatus,
    };
  }

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      userId: json['user_id'] as String,
      driverFirstName: json['driver_first_name'] as String,
      driverLastName: json['driver_last_name'] as String,
      driverPatronymic: json['driver_patronymic'] as String,
      driverAge: json['driver_age'] as int,
      driverRank: json['driver_rank'] as String,
      mobilePhone: json['mobile_phone'] as String,
      mail: json['mail'] != null ? json['mail'] as String : null,
      aliveFlag: json['alive_flag'] as bool,
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
      c1ECategory:
          json['c1e_category'] != null ? json['c1e_category'] as bool : null,
      beCategory:
          json['be_category'] != null ? json['be_category'] as bool : null,
      ceCategory:
          json['ce_category'] != null ? json['ce_category'] as bool : null,
      d1ECategory:
          json['d1e_category'] != null ? json['d1e_category'] as bool : null,
      deCategory:
          json['de_category'] != null ? json['de_category'] as bool : null,
      currentStatus: json['current_status'] as String,
    );
  }
}
