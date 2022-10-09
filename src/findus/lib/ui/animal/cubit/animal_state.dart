part of 'animal_cubit.dart';

abstract class AnimalState extends Equatable {
  const AnimalState();

  @override
  List<Object> get props => [];
}

class AnimalInitial extends AnimalState {}

class AnimalLoading extends AnimalState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AnimalState {
  const LoadedState(this.animals);

  final List<Animal> animals;

  @override
  List<Object> get props => [animals];
}

// class EditState extends AnimalState {

//   Animal animal;

//   @override
//   List<Object> get props => [animal];
// }

class AnimalList extends AnimalState {
  final List<AnimalRepository> animals;

  const AnimalList(this.animals);
}

class ErrorState extends AnimalState {
  @override
  List<Object> get props => [];
}
