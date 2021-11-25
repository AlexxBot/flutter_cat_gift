import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dfdf_event.dart';
part 'dfdf_state.dart';

class DfdfBloc extends Bloc<DfdfEvent, DfdfState> {
  DfdfBloc() : super(DfdfInitial()) {
    on<DfdfEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
