import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_pagination/domain/models/breed/breed.dart';

part 'image.freezed.dart';
part 'image.g.dart';

final json = {
  "breeds": [],
  "id": "a7l",
  "url": "https://cdn2.thecatapi.com/images/a7l.jpg",
  "width": 600,
  "height": 450
};

@freezed
class CatImage with _$CatImage {
  @JsonSerializable(explicitToJson: true)
  const factory CatImage({
    @Default([]) List<Breed> breeds,
    required String id,
    required String url,
    required int width,
    required int height,
}) = _CatImage;

  factory CatImage.fromJson(Map<String, Object?> json) => _$CatImageFromJson(json);
}