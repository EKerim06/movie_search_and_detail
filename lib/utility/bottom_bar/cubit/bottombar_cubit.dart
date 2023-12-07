import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottombar_state.dart';

///BottomBar Cubit
class BottombarCubit extends Cubit<BottombarState> {
  ///BottomBar Cubit Constructor
  BottombarCubit() : super(const BottombarState(currentIndex: 0));

  ///changed selected index
  void changeCurrentIndex(int value) {
    emit(state.copyWith(currentIndex: value));
  }
}
