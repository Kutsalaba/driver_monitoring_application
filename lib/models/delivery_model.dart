class DeliveryModel {
  final String? deliveryId;
  final String deliveryName;
  final String deliveryDescription;
  final DateTime deadline;
  final DateTime? createDate;
  final double? shipFromLongitude; // стартова
  final double? shipFromLatitude;
  final double shipToLongitude; // кінцева
  final double shipToLatitude;
  final String? shipToAddress; // адреса
  final String? shipFromAddress;
  final String vehicleId;
  final String driverId;

  DeliveryModel({
    required this.deliveryId,
    required this.deliveryName,
    required this.deliveryDescription,
    required this.deadline,
    required this.createDate,
    required this.shipFromLongitude,
    required this.shipFromLatitude,
    required this.shipToLongitude,
    required this.shipToLatitude,
    required this.shipToAddress,
    required this.shipFromAddress,
    required this.vehicleId,
    required this.driverId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'driver_id': deliveryId,
      'delivery_name': deliveryName,
      'delivery_description': deliveryDescription,
      'deadline': deadline.millisecondsSinceEpoch,
      'create_date': createDate?.millisecondsSinceEpoch,
      'shipfrom_longitude': shipFromLongitude,
      'shipfrom_latitude': shipFromLatitude,
      'shipto_longitude': shipToLongitude,
      'shipto_latitude': shipToLatitude,
      'shipto_address': shipToAddress,
      'shipfrom_address': shipFromAddress,
      'vehicle_id': vehicleId,
      'driverId': driverId,
    };
  }

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      deliveryId: json['driver_id'] != null ? json['driver_id'] as String : null,
      deliveryName: json['delivery_name'] as String,
      deliveryDescription: json['delivery_description'] as String,
      deadline: DateTime.fromMillisecondsSinceEpoch(json['deadline'] as int),
      createDate: json['create_date'] != null ? DateTime.fromMillisecondsSinceEpoch(json['create_date'] as int) : null,
      shipFromLongitude: json['shipfrom_longitude'] != null ? json['shipfrom_longitude'] as double : null,
      shipFromLatitude: json['shipfrom_latitude'] != null ? json['shipfrom_latitude'] as double : null,
      shipToLongitude: json['shipto_longitude'] as double,
      shipToLatitude: json['shipto_latitude'] as double,
      shipToAddress: json['shipto_address'] != null ? json['shipto_address'] as String : null,
      shipFromAddress: json['shipfrom_address'] != null ? json['shipfrom_address'] as String : null,
      vehicleId: json['vehicle_id'] as String,
      driverId: json['driver_id'] as String,
    );
  }
}

//{"delivery_name":"DelName",
//"delivery_description":"description",
//"deadline":'2023-11-2 6:23:11',
//"shipfrom_longitude":24.0,
//"shipfrom_latitude":13.0,
//"shipto_longitude":432.0,
//"shipto_latitude":3214.0,
//"shipto_address":"fwfw",
//"shipfrom_address":"ewrwgwger",
//"vehicle_id":"1",
//"driver_id":"1"}

//13 params