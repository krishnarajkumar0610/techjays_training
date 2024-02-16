import 'package:bloc/bloc.dart';
import 'package:fruits_scanner/bloc/events.dart';
import 'package:fruits_scanner/bloc/states.dart';

class ScannerBloc extends Bloc<ScannerEvents, ScannerState> {
  bool heightStatus = true;

  ScannerBloc()
      : super(ScannerState(
          containerHeight: true,
        )) {
    on<BarEvent>((event, emit) {
      heightStatus = !heightStatus;

      emit(ScannerState(
        containerHeight: heightStatus,
      ));
    });

    on<SetOption>((event, emit) {
      int? index = event.index;
      emit(ScannerState(selectedIndex: index));
    });
  }
}
