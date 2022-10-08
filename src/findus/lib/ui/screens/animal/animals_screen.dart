import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:findus/ui/screens/animal/cubit/animal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:findus/data/entity/animal.dart';
import "widget/animals_item.dart";

//thanks to https://raw.githubusercontent.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/master/lib/articles_list/presentation/screen/articles_list_screen.dart
class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animals'),
        ),
        body: BlocBuilder<AnimalCubit, AnimalState>(builder: (context, state) {
          if (state is AnimalLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return drawAnimalWidgets(state.animals);
          } else {
            return const Text("should not happen");
          }
        }));
  }

  Widget drawAnimalWidgets(List<Animal> animals) {
    return ListView.builder(
      key: const Key('Animals'),
      itemBuilder: (BuildContext context, int index) {
        return AnimalsItem(
          key: Key('Animal$index'),
          animal: animals[index],
        );
      },
      itemCount: animals.length,
    );
  }
}
