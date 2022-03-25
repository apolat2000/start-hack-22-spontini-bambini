import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/auth/auth_cubit.dart';
import 'package:frontend/frontend/components/ShadowBox.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareIDPage extends StatelessWidget {
  const ShareIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String publicID =
        (BlocProvider.of<AuthCubit>(context).state as AuthenticatedState)
            .publicID;

    return Center(
        child: Column(children: [
      AppBar(
        title: Text("Your ID"),
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(data: publicID),
              const SizedBox(
                height: 80,
              ),
              Text("Your personal code: "),
              SizedBox(
                height: 10,
              ),
              ShadowBox(
                  child: SizedBox(
                width: double.infinity,
                child: Text(
                  publicID,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ),
      )
    ]));
  }
}
