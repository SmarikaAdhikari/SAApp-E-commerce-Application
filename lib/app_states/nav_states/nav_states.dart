import 'package:equatable/equatable.dart';

class NavStates extends Equatable {
  const NavStates({this.index = 0});
  final int index;
  NavStates copyWith({
    int? index,
  }) {
    return NavStates(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}
