import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joinevent_state.dart';

class JoineventCubit extends Cubit<JoineventState> {
  JoineventCubit() : super(JoineventInitial());
}
