import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulflow/src/common/auth/bloc_auth/actions.dart';
import 'package:soulflow/src/common/auth/view/widgets/iterable_list_view.dart';
import 'package:soulflow/src/common/constant/note_strings.dart';
import 'package:soulflow/src/common/dialogs/generic_dialog.dart';

import '../../../common/auth/bloc_auth/app_bloc.dart';
import '../../../common/auth/bloc_auth/app_state.dart';
import '../../../common/auth/model/login_handle.dart';
import '../../../common/auth/service/login_api.dart';
import '../../../common/auth/service/note_api.dart';
import '../../../common/auth/view/login_view.dart';
import '../../../common/dialogs/loading_screen.dart';

class ElementPage extends StatelessWidget {
  const ElementPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(
        loginApi: LoginApi(),
        notesApi: NotesApi(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Element Notes'),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            // loading screen
            if (appState.isLoading) {
              LoadingScreen().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen().hide();
            }
            // display errors
            final loginError = appState.loginError;
            if (loginError != null) {
              showGenericDialog<bool>(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDialogContent,
                optionsBuilder: () => {ok: true},
              );
            }

            // if (logged in AND no fetched notes) THEN fetch notes now
            if (appState.isLoading == false &&
                appState.loginError == null &&
                appState.loginHandle == const LoginHandle.fooBar() &&
                appState.fetchedNotes == null) {
              context.read<AppBloc>().add(
                    const LoadNotesAction(),
                  );
            }
          },
          builder: (context, appState) {
            final notes = appState.fetchedNotes;
            if (notes == null) {
              return LoginView(onLoginTapped: (email, password) {
                context.read<AppBloc>().add(LoginAction(
                      email: email,
                      password: password,
                    ));
              });
            } else {
              return notes.toListView();
            }
          },
        ),
      ),
    );
  }
}
