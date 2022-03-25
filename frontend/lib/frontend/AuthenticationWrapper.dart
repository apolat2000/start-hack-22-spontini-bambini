import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/auth/auth_cubit.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper(
      {Key? key, required this.loginViewBuilder, required this.homePageBuilder})
      : super(key: key);

  final Widget Function(BuildContext context) loginViewBuilder;
  final Widget Function(BuildContext context) homePageBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return homePageBuilder(context);
          } else {
            return loginViewBuilder(context);
          }
        },
      ),
    );
  }
}
