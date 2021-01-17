class MainInfoModel {
  const MainInfoModel({
    required this.resource,
    required this.text,
    this.url,
  });

  final dynamic resource;
  final String text;
  final String? url;
}
