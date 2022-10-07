import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/error/failure.dart';
import '../../domain/model/sanctum.dart';
import '../../domain/usecase/create_sanctum_usecase.dart';
import '../../domain/usecase/delete_sanctum_usecase.dart';

part 'sanctum_event.dart';
part 'sanctum_state.dart';

// ignore: constant_identifier_names
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
// ignore: constant_identifier_names
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class SanctumBloc extends Bloc<SanctumEvent, SanctumState> {
  final CreateSanctumUsecase createSanctum;
  final DeleteSanctumUsecase deleteSanctum;

  SanctumBloc({
    required this.createSanctum,
    required this.deleteSanctum,
  }) : super(Empty()) {
    on<SanctumEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
