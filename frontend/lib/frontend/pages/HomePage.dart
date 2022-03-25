import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/home/home_cubit.dart';
import 'package:frontend/frontend/pages/CompassPage.dart';
import 'package:frontend/frontend/pages/ProfilePage.dart';
import 'package:frontend/frontend/pages/ShareIDPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _page(BuildContext context, HomeState state) {
    if (state is HomeKompassView)
      return CompassPage();
    else if (state is HomeShareIDView)
      return ShareIDPage();
    else
      return ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => Material(
              child: Column(
            children: [
              Expanded(
                child: _page(context, state),
              ),
              BottomNavigationBar(
                currentIndex: state.index(),
                onTap: BlocProvider.of<HomeCubit>(context).setPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(MdiIcons.mapSearch), label: "Compass"),
                  BottomNavigationBarItem(
                      icon: Icon(MdiIcons.qrcode), label: "My ID"),
                  BottomNavigationBarItem(
                      icon: Icon(MdiIcons.account), label: "Profile")
                ],
              )
            ],
          )),
        ));
  }
}
