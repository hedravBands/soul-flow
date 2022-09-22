import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/error/failure.dart';
import '../../../../common/usecase/usecase.dart';
import '../../data/repository/sanctum_repository.dart';

class DeleteSanctumUsecase implements Usecase<Unit, Params> {
  final SanctumRepository repository;

  DeleteSanctumUsecase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return await repository.deleteSanctum(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
