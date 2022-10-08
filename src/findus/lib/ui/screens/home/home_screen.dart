import 'package:findus/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:findus/ui/screens/home/cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var strings = LocalizedStrings.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(strings.homeCounterMessage),
              BlocBuilder<HomeCubit, HomeInitial>(builder: (context, state) {
                return Text(state.counterValue.toString());
              }),
              ElevatedButton(
                onPressed: () => context.push(ScreenPaths.dummy1),
                child: const Text('dummy1'),
              ),
              ElevatedButton(
                onPressed: () => context.push(ScreenPaths.dummy2),
                child: const Text('dummy2-modal'),
              ),
              ElevatedButton(
                onPressed: () => context.push(ScreenPaths.animals),
                child: const Text('animals'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => BlocProvider.of<HomeCubit>(context).increment(),
          tooltip: strings.homeFabTooltip,
          child: const Icon(Icons.add),
        ));
  }
}
