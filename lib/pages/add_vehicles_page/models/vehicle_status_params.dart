import 'package:flutter/material.dart' show Color;

enum VehicleStatusType {
  good,
  repair,
  broken,
}

class VehicleStatusParams {
  final String name;
  final bool isSelected;
  final Color backgroundColor;
  final Color textColor;
  final VehicleStatusType type;

  VehicleStatusParams({
    required this.name,
    this.isSelected = false,
    required this.backgroundColor,
    required this.textColor,
    required this.type,
  });

  VehicleStatusParams copyWith({
    String? name,
    bool? isSelected,
    Color? backgroundColor,
    Color? textColor,
    VehicleStatusType? type,
  }) {
    return VehicleStatusParams(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      type: type ?? this.type,
    );
  }
}
