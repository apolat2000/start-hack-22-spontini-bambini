import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/auth/auth_cubit.dart';
import 'package:frontend/frontend/components/ShadowBox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AspectRatio(
              aspectRatio: 2,
              child: Placeholder(),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: BlocProvider.of<AuthCubit>(context).openEduIDLogin,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "Login with eduID",
                  ),
                ))
          ],
        ),
      ),
    )));
  }
}
