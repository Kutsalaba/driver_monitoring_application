class ScrollableTileParams {
  ScrollableTileParams({
    this.imagePath,
    required this.title,
    required this.liscenseCategories,
    required this.description,
    this.isSelected = false,
  });

  final String? imagePath;
  final String title;
  final String liscenseCategories;
  final String description;
  final bool isSelected;
}
