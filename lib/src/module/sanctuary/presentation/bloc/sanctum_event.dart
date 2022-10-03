part of 'sanctum_bloc.dart';

abstract class SanctumEvent extends Equatable {
  const SanctumEvent();
}

class CreateSanctumEvent extends SanctumEvent {
  final String id;

  const CreateSanctumEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteSanctumEvent extends SanctumEvent {
  final String id;

  const DeleteSanctumEvent({required this.id});

  @override
  List<Object> get props => [id];
}
