class LicenseCategory {
  final String name;
  final bool isSelected;

  LicenseCategory({
    required this.name,
    this.isSelected = false,
  });

  LicenseCategory copyWith({
    String? name,
    bool? isSelected,
  }) {
    return LicenseCategory(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
