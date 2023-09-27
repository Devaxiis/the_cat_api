import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_pagination/domain/models/weight/weight.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed{
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Breed({
    required Weight weight,
    required String id,
    required String name,
    required String? cfaUrl,
    required String? vetstreetUrl,
    required String? vcahospitalsUrl,
    required String temperament,
    required String origin,
    required String countryCodes,
    required String countryCode,
    required String description,
    required String lifeSpan,
    required int indoor,
    required String? altNames,
    required int adaptability,
    required int affectionLevel,
    required int childFriendly,
    required int dogFriendly,
    required int energyLevel,
    required int grooming,
    required int healthIssues,
    required int intelligence,
    required int sheddingLevel,
    required int socialNeeds,
    required int strangerFriendly,
    required int vocalisation,
    required int experimental,
    required int hairless,
    required int natural,
    required int rare,
    required int rex,
    required int suppressedTail,
    required int shortLegs,
    required String wikipediaUrl,
    required int hypoallergenic,
    required String referenceImageId,
  }) = _Breed;

  factory Breed.fromJson(Map<String, Object?> json) => _$BreedFromJson(json);
}