import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/bloc/state.dart';
import 'package:notes/presentation/pages/notes/notes_screen.dart';
import 'package:notes/presentation/pages/tasks/tasks_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());
  static MainCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [const NotesScreen(), const TasksScreen()];
  changeTopBar(int index) {
    currentIndex = index;
    emit(MainButtomTopBarState());
  }
}
