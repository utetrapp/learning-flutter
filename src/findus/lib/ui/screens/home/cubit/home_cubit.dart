import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeInitial> {
  HomeCubit() : super(HomeInitial(counterValue: 0));
  void increment() => emit(HomeInitial(counterValue: state.counterValue + 1));
}
