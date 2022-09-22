import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/create_sanctum_usecase.dart';
import '../../domain/usecase/delete_sanctum_usecase.dart';

part 'sanctum_event.dart';
part 'sanctum_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
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
}
