part of 'sanctum_bloc.dart';

abstract class SanctumState extends Equatable {
  const SanctumState();
}

class SanctumInitial extends SanctumState {
  @override
  List<Object> get props => [];
}
