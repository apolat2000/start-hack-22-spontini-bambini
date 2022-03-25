part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  int index();
}

class HomeKompassView extends HomeState {
  @override
  int index() => 0;
}

class HomeCertifiateView extends HomeState {
  @override
  int index() => 1;
}

class HomeShareIDView extends HomeState {
  @override
  int index() => 2;
}

class HomeProfileView extends HomeState {
  @override
  int index() => 3;
}
