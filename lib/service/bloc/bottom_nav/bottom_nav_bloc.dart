import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {
      if (event is HomeEvent) {
        emit(HomeNavState());
      }
      if (event is PeopleEvent) {
        emit(PeopleNavState());
      }
      if (event is ProfileEvent) {
        emit(ProfileNavState());
      }
    });
  }
}
