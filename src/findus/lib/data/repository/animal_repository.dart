import 'package:findus/data/entity/animal.dart';
import 'package:findus/data/dataprovider/findus_api.dart';

//@todo: implement caching logic here see https://developer.android.com/topic/architecture/data-layer#caches and https://github.com/AbedElazizShe/flutter_clean_architecture
// a strategy could be to fetch at app start from the network if available and else work local ...
class AnimalRepository {
  AnimalRepository({required this.findusApi});
  final FindusAPI findusApi;

  Future<List<Animal>> getAll() {
    return findusApi.getAll();
  }

  Future<Animal?> getById(int id) {
    return findusApi.getById(id);
  }

  Future<void> insert(Animal animal) {
    return findusApi.insert(animal);
  }

  Future<void> update(Animal animal) {
    return findusApi.update(animal);
  }

  Future<bool> delete(int id) {
    return findusApi.delete(id);
  }
}
