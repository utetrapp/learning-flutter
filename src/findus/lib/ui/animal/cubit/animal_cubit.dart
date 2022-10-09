import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:findus/data/entity/animal.dart';
import 'package:findus/data/repository/animal_repository.dart';
part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  final AnimalRepository _repository;
  AnimalCubit(this._repository) : super(AnimalInitial()) {
    getAnimals();
  }

  void getAnimals() async {
    try {
      emit(AnimalLoading());
      List<Animal> animals = await _repository.getAll();
      emit(LoadedState(animals));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
