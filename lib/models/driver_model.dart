import 'dart:convert';

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

  Map<String, dynamic> toMap() {
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

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      userId: map['user_id'] as String,
      driverFirstName: map['driver_first_name'] as String,
      driverLastName: map['driver_last_name'] as String,
      driverPatronymic: map['driver_patronymic'] as String,
      driverAge: map['driver_age'] as int,
      driverRank: map['driver_rank'] as String,
      mobilePhone: map['mobile_phone'] as String,
      mail: map['mail'] != null ? map['mail'] as String : null,
      aliveFlag: map['alive_flag'] as bool,
      a1Category:
          map['a1_category'] != null ? map['a1_category'] as bool : null,
      aCategory: map['a_category'] != null ? map['a_category'] as bool : null,
      b1Category:
          map['b1_category'] != null ? map['b1_category'] as bool : null,
      bCategory: map['b_category'] != null ? map['b_category'] as bool : null,
      c1Category:
          map['c1_category'] != null ? map['c1_category'] as bool : null,
      cCategoty: map['c_categoty'] != null ? map['c_categoty'] as bool : null,
      d1Categoty:
          map['d1_categoty'] != null ? map['d1_categoty'] as bool : null,
      dCategory: map['d_category'] != null ? map['d_category'] as bool : null,
      c1ECategory:
          map['c1e_category'] != null ? map['c1e_category'] as bool : null,
      beCategory:
          map['be_category'] != null ? map['be_category'] as bool : null,
      ceCategory:
          map['ce_category'] != null ? map['ce_category'] as bool : null,
      d1ECategory:
          map['d1e_category'] != null ? map['d1e_category'] as bool : null,
      deCategory:
          map['de_category'] != null ? map['de_category'] as bool : null,
      currentStatus: map['current_status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
