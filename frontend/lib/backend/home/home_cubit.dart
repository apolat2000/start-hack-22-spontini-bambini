import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:frontend/frontend/pages/CertificatesPage.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeKompassView());

  void setPage(int index) {
    HomeState state;

    switch (index) {
      case 0:
        state = HomeKompassView();
        break;
      case 1:
        state = HomeCertifiateView();
        break;
      case 2:
        state = HomeShareIDView();
        break;
      default:
        state = HomeProfileView();
    }

    emit(state);
  }
}
