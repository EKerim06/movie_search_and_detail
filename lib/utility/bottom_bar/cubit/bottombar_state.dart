// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottombar_cubit.dart';

class BottombarState extends Equatable {
  const BottombarState({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  BottombarState copyWith({
    int? currentIndex,
  }) {
    return BottombarState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
