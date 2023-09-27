import 'package:learn_pagination/data/network_service.dart';
import 'package:learn_pagination/domain/repositories/image_repository.dart';

late final ImageRepository repository;

void serviceLocator() {
  repository = const ImageRepositoryImplementation(
    network: HttpNetwork(),
  );
}
