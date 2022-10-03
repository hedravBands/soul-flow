import 'package:flutter/foundation.dart' show immutable;
import 'package:soulflow/src/common/auth/model/login_handle.dart';

import '../../../module/sanctuary/domain/model/note.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrors? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'LoginHandle': loginHandle,
        'fetchedNotes': fetchedNotes
      }.toString();
}
