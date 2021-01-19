import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utaite/ui/main/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(MainState state) : super(state);

  factory MainCubit.empty() => MainCubit(MainState(
        index: 0,
      ));

  void update({
    int? index,
  }) =>
      emit(MainState(
        index: index ?? state.index,
      ));
}
