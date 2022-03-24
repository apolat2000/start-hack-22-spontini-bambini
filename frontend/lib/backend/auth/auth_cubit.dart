import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnauthenticatedState());

  void openEduIDLogin() {
    // TODO: implement login with eduID

    // pretend, that user is logged in
    emit(AuthenticatedState("{blablabla}"));
  }

  void logOut() {
    emit(UnauthenticatedState());
  }
}
