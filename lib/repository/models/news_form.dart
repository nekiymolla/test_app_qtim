class NewsForm {
  const NewsForm({
    required this.id,
    required this.name,
    this.previewDescription,
    this.mainDescription,
    this.imageAsset,
  });

  final String id;
  final String name;
  final String? imageAsset;
  final String? previewDescription;
  final String? mainDescription;
}
