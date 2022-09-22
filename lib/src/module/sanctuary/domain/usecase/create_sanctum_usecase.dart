import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/error/failure.dart';
import '../../../../common/usecase/usecase.dart';
import '../../data/repository/sanctum_repository.dart';

class CreateSanctumUsecase implements Usecase<Unit, Params> {
  final SanctumRepository repository;

  CreateSanctumUsecase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return await repository.createSanctum(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
