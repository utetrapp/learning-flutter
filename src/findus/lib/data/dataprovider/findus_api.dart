import 'package:dio/dio.dart';
import 'package:findus/data/entity/animal.dart';
import 'package:findus/data/constants.dart';
import 'package:findus/data/exception.dart';

class FindusAPI {
  FindusAPI({required this.dio});
  final Dio dio;

  //@todo check if stream is better
  Future<List<Animal>> getAll() async {
    final response = await dio.get(FindusApiConstants.animalUrl);

    if (response.statusCode == FindusApiConstants.statusOk) {
      // @todo may need adaption, depends on the data structur the server sends, when in doubt, set a breakpoint here
      var animalJsonList = response.data["list"] as List;
      return animalJsonList
          .map((animalJson) => Animal.fromJson(animalJson))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future<Animal?> getById(int id) async {
    final response = await dio.get("$FindusApiConstants.animalUrl?id?$id");

    if (response.statusCode == FindusApiConstants.statusOk) {
      return Animal.fromJson(response.data);
    } else if (response.statusCode == FindusApiConstants.statusNotFound) {
      return null;
    } else {
      throw ServerException();
    }
  }

  Future<int> insert(Animal animal) async {
    final response =
        await dio.post(FindusApiConstants.animalUrl, data: animal.toJson());

    if (response.statusCode == FindusApiConstants.statusOk) {
      return Animal.fromJson(response.data).animalId;
    } else {
      throw ServerException();
    }
  }

  Future<bool> update(Animal animal) async {
    final response =
        await dio.put(FindusApiConstants.animalUrl, data: animal.toJson());

    if (response.statusCode == FindusApiConstants.statusOk) {
      return true;
    } else {
      throw ServerException();
    }
  }

  Future<bool> delete(int id) async {
    final response = await dio.delete(FindusApiConstants.animalUrl, data: id);

    if (response.statusCode == FindusApiConstants.statusOk) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
