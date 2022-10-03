import 'package:bloc/bloc.dart';
import 'package:soulflow/src/common/auth/bloc_auth/actions.dart';
import 'package:soulflow/src/common/auth/bloc_auth/app_state.dart';
import 'package:soulflow/src/common/auth/model/login_handle.dart';
import 'package:soulflow/src/common/auth/service/login_api.dart';

import '../service/note_api.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        // start loading
        emit(
          const AppState(
            isLoading: true,
            loginError: null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
        // log in user
        final loginHandle = await loginApi.login(
          email: event.email,
          password: event.password,
        );
        emit(
          AppState(
            isLoading: false,
            loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
      },
    );
    on<LoadNotesAction>(
      (event, emit) async {
        // start loading
        emit(
          AppState(
            isLoading: true,
            loginError: null,
            loginHandle: state.loginHandle,
            fetchedNotes: null,
          ),
        );
        // get the login handle
        final loginHandle = state.loginHandle;
        if (loginHandle != const LoginHandle.fooBar()) {
          // invalid login handle, cannot fetch notes
          emit(
            AppState(
              isLoading: false,
              loginError: LoginErrors.invalidHandle,
              loginHandle: loginHandle,
              fetchedNotes: null,
            ),
          );
        } else {
          // this is a valid login handle, go fetch notes
          final notes = await notesApi.getNotes(
            loginHandle: loginHandle!,
          );
          emit(
            AppState(
              isLoading: false,
              loginError: null,
              loginHandle: loginHandle,
              fetchedNotes: notes,
            ),
          );
        }
      },
    );
  }
}
