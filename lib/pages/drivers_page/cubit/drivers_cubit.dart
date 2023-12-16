import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(DriversInitial());
}
