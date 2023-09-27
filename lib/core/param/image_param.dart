class ImageParam {
  final ImageSize? size;
  final MimeType? mimeType;
  final ImageFormat? format;
  final Order? order;
  final int page;
  final int limit;
  final String? breedIds;
  final bool hasBreeds;

  const ImageParam({
    this.size,
    this.mimeType,
    this.format,
    this.order,
    this.page = 0,
    this.limit = 25,
    this.breedIds,
    this.hasBreeds = true,
  });

  Map<String, String> get toQueryParameters => {
    "page": page.toString(),
    "limit": limit.toString(),
    "has_breeds": hasBreeds.toString(),
    if(size != null) "size": size!.name,
    if(mimeType != null) "mime_types": mimeType!.name,
    if(format != null) "format": format!.name,
    if(order != null) "order": order!.name,
    if(breedIds != null) "breed_ids": breedIds!,
  };
}

enum ImageSize {
  small,
  med,
  full,
}

enum MimeType {
  jpg,
  png,
  gif,
}

enum ImageFormat {
  json,
  src,
}

enum Order {
  RANDOM,
  ASC,
  DESC,
}
