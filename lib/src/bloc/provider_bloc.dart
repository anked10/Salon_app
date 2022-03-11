import 'package:flutter/material.dart';
import 'package:salon_app/src/bloc/alumnos_bloc.dart';
import 'package:salon_app/src/bloc/aula_bloc.dart';
import 'package:salon_app/src/bloc/bottom_navigation_bloc.dart';

class ProviderBloc extends InheritedWidget {
  final bottonBloc = BottomNaviBloc();
  final aulaBloc = AulaBloc();
  final alumnosBloc = AlumnosBloc();
  
  ProviderBloc({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ProviderBloc oldWidget) => true;


  static BottomNaviBloc botton(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.bottonBloc;
  }

  static AulaBloc aula(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.aulaBloc;
  }

  static AlumnosBloc alumno(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!.alumnosBloc;
  }

}
