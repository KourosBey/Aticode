import 'package:flutter_bloc/flutter_bloc.dart';

enum MainStateNavigator { mainPage, profile }

class MainNavigatorCubit extends Cubit<MainStateNavigator> {
  MainNavigatorCubit() : super(MainStateNavigator.mainPage);
  void showMainPage() => emit(MainStateNavigator.mainPage);
}
